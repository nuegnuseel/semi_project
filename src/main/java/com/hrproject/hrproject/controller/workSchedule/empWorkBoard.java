package com.hrproject.hrproject.controller.workSchedule;

import com.hrproject.hrproject.dao.AttendDao;
import com.hrproject.hrproject.dao.HrmDao;
import com.hrproject.hrproject.dao.WorkScheduleDao;
import com.hrproject.hrproject.dto.AttendDto;
import com.hrproject.hrproject.dto.HrmDto;
import com.hrproject.hrproject.dto.WorkScheduleDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@WebServlet("/workSchedule/empWorkBoard")
public class empWorkBoard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 로그인을 통해서 현재 접속자 empNo를 받아와야 합니다.
        HttpSession session = req.getSession();
        HrmDto loginDto = (HrmDto) session.getAttribute("sessionDto");
        int empNo = loginDto.getEmpNo();


        WorkScheduleDao workScheduleDao = new WorkScheduleDao();
        List<WorkScheduleDto> empWorkList = workScheduleDao.getEmpWorkList(empNo);

        System.out.println("empWorkList >>>> "+empWorkList);
        if (empWorkList != null) {
            System.out.println("workDB select List successfully");
        } else {
            System.out.println("workDB select List failed");
        }

        req.setAttribute("empWorkList", empWorkList);
        req.getRequestDispatcher("/WEB-INF/workSchedule/board-empWork.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 오늘 날짜 설정 (현재 날짜를 사용하려면 LocalDate.now() 사용)
        LocalDate currentDate = LocalDate.now();
        // 현재 시각 설정 (현재 시각을 사용하려면 LocalTime.now() 사용)
        LocalTime currentTime = LocalTime.now();

        // 세션으로 로그인된 사람의 empNo를 받아와야 함
        HttpSession session = req.getSession();
        HrmDto loginDto = (HrmDto) session.getAttribute("sessionDto");
        int empNo = loginDto.getEmpNo();

        String Date = currentDate.toString(); // LocalDate는 ISO 형식으로 문자열로 변환됨
        String Time = currentTime.toString(); // LocalTime은 ISO 형식으로 문자열로 변환됨
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        LocalDateTime dateTime = LocalDateTime.now();


        String formattedDateTime = dateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        String formattedTime = currentTime.format(formatter);


        WorkScheduleDao workScheduleDao = new WorkScheduleDao();
        AttendDao attendDao = new AttendDao();
        HrmDao hrmDao = new HrmDao();

        List<AttendDto> attendDtoList = null;
//        List<String> allDates = null;
        String atdNo = null;
        double duration = 0;

        // 오늘자 워크스케쥴러 init
        // 오늘날짜 DB 있는지 체크
        if (workScheduleDao.getTodaySchedule(Date).isEmpty()) {
            // 오늘날짜 DB가 없으니까 전사원 대상 오늘 날짜 DB생성
            System.out.println("today DB doesnt exist");
            // 모든 사원의 empNo 리스트를 받아서 DB 생성
            List<HrmDto> empNoList = hrmDao.getEmpNoList();
            if (empNoList != null) {
                System.out.println("List로 전 사원 empNo 받음");
                // 전 사원 대상 워크스케쥴러 만들기
                workScheduleDao.createAllEmpSchedule(empNoList);
            }
        }


        List<HrmDto> empNoList = hrmDao.getEmpNoList();
        // 오늘자 워크스케쥴러 ATTEND DB에서 받은 휴가 업데이트
        boolean run = true;
        int idx = 0;
        int empListSize = empNoList.size();

        while (run && idx < empListSize) {
            if (empNoList.get(idx) != null) {
                int empNoIdx = empNoList.get(idx).getEmpNo();
                attendDtoList = attendDao.getAttendListByEmpNo(empNoIdx);
                for (AttendDto attendDto : attendDtoList) {
                    String date = attendDto.getAtdDate().trim();
                    String dateRange = date.replaceAll("\\s+", "");
                    String[] dates = dateRange.split("~");
                    String startDateStr = dates[0].trim();
                    String endDateStr = dates[1].trim();

                    DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate startDate = LocalDate.parse(startDateStr, formatterDate);
                    LocalDate endDate = LocalDate.parse(endDateStr, formatterDate);
                    List<String> allDates = new ArrayList<>();
                    LocalDate tempDate = startDate;
                    while (!tempDate.isAfter(endDate)) {
                        allDates.add(tempDate.format(formatterDate));
                        tempDate = tempDate.plusDays(1);
                    }
                    for (String dateStr : allDates) {
                        if (dateStr.equals(Date)) {
                            atdNo = attendDto.getAtdNo();
                        }
                    }

                    WorkScheduleDto workScheduleDto = WorkScheduleDto.builder()
                            .empNo(attendDto.getEmpNo())
                            .atdNo(atdNo)
                            .vacationCode(attendDto.getAtdCode())
                            .workDate(Date)
                            .build();


                    int updateResult = workScheduleDao.updateWorkSchedule(workScheduleDto);
                    if (updateResult > 0) {
                        System.out.println("workScheduleDao.updateWorkSchedule(workScheduleDto) 성공");
                    }
                }
                idx++;
            } else {
                run = false;
            }
        }


// 다시 다 받아서 업데이트 해라


// 만약 ATTEND_DB에서 ATDCODE가 바뀐 사항이 있을 수 있으니까 현 페이지 들어가면 DB 한번 리프레쉬~~
// DB과부하를 막기 위해서 변동사항이 있는 경우에만 update를 해야하는데 나중에 구현할게요~


        Map<String, Object> empNoDateMap = new HashMap<>();
        empNoDateMap.put("empNo", empNo);
        empNoDateMap.put("date", Date);

// empNo(로그인한 사람의 사원 번호)를 통해서 그 사람의 workScheduleDto를 가져오기
        WorkScheduleDto workScheduleDto = workScheduleDao.getWorkScheduleOne(empNoDateMap);
        if (workScheduleDto.getStartTime() == null) {
            workScheduleDto.setStartTime(Time);
            try {
                String strStatus = workScheduleDto.getStatus();
                if (strStatus != null) {
                    List<String> statusList = new ArrayList<>(Arrays.asList(strStatus.split("/")));
                    statusList.add("출근");

//                    String combinedString = String.join("/", statusList);
//                    workScheduleDto.setStatus(combinedString);
                } else {
                    workScheduleDto.setStatus("출근");
                }
            } catch (
                    NullPointerException e) {
                e.printStackTrace();
            }
            workScheduleDao.updateWorkStartTime(workScheduleDto);
            resp.sendRedirect("/workSchedule/empWorkBoard");

        } else if (workScheduleDto.getStartTime() != null && workScheduleDto.
                getEndTime() == null) {
            workScheduleDto.setEndTime(Time);
            String strStatus = workScheduleDto.getStatus();
            List<String> statusList = new ArrayList<>(Arrays.asList(strStatus.split("/")));
            for (int i = 0; i < statusList.size(); i++) {
                String status = statusList.get(i);
                if (status.equals("출근")) {
                    status = "퇴근";
                    statusList.set(i, status);
                }
            }
            String combinedString = String.join("/", statusList);
            workScheduleDto.setStatus(combinedString);
            workScheduleDao.updateWorkEndTime(workScheduleDto);
            resp.sendRedirect("/workSchedule/empWorkBoard");
        } else if (workScheduleDto.getStartTime() != null && workScheduleDto.getEndTime() != null) {
// JavaScript를 사용하여 경고창을 표시하고 확인 클릭 시 특정 페이지로 이동
            String alertScript = "<script>"
                    + "alert('이미 기록이 있습니다. 수정은 관리자에게 문의해주세요.');"
                    + "window.location.href = '/workSchedule/empWorkBoard';"  // 확인을 누르면 이동할 페이지
                    + "</script>";

// 응답 설정 및 경고창 출력
            resp.setContentType("text/html; charset=UTF-8");

            PrintWriter out = resp.getWriter();
            out.println(alertScript);
            out.flush();
        }
//        이제 여기서부터 경우의 수 따져서 처리 + 예외처리

        System.out.println("오늘 날짜: " + currentDate);
        System.out.println("현재 시각: " + currentTime);
    }


}
