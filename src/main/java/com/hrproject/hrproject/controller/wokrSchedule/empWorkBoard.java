package com.hrproject.hrproject.controller.wokrSchedule;

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

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/workSchedule/empWorkBoard")
public class empWorkBoard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 로그인을 통해서 현재 접속자 empNo를 받아와야 합니다.
        int empNo = 1;

        WorkScheduleDao workScheduleDao = new WorkScheduleDao();
        List<WorkScheduleDto> empWrokList = workScheduleDao.getEmpWorkList(empNo);

        if (empWrokList != null) {
            System.out.println("workDB select List successfully");
        } else {
            System.out.println("workDB select List failed");
        }

        req.setAttribute("empWorkList", empWrokList);
        req.getRequestDispatcher("/WEB-INF/workSchedule/board-empWork.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 오늘 날짜 설정 (현재 날짜를 사용하려면 LocalDate.now() 사용)
        LocalDate currentDate = LocalDate.now();
        // 현재 시각 설정 (현재 시각을 사용하려면 LocalTime.now() 사용)
        LocalTime currentTime = LocalTime.now();

        // 세션으로 로그인된 사람의 empNo를 받아와야 함
        int empNo = 1;

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
        String vacationCode = null;
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
                                    vacationCode = attendDto.getAtdCode();
                                }
                            }

                            WorkScheduleDto workScheduleDto = WorkScheduleDto.builder()
                                    .empNo(attendDto.getEmpNo())
                                    .status(vacationCode)
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
            }
        }

        Map<String, Object> empNoDateMap = new HashMap<>();
        System.out.println("Date >>>" + Date);
        empNoDateMap.put("empNo", empNo);
        empNoDateMap.put("date", Date);

        // empNo(로그인한 사람의 사원 번호)를 통해서 그 사람의 workScheduleDto를 가져오기
        WorkScheduleDto workScheduleDto = workScheduleDao.getWorkScheduleOne(empNoDateMap);

//        WorkScheduleDto workScheduleDto = workScheduleDao.getWorkSchedulelist(empNoDateMap);

        System.out.println("WSCDTO >>> " + workScheduleDto);
        if (workScheduleDto.getStartTime() == null) {
            workScheduleDto.setStartTime(Time);

            workScheduleDao.updateWorkStartTime(workScheduleDto);
            System.out.println("WSCDTO02 >>> " + workScheduleDto);
            resp.sendRedirect("/workSchedule/empWorkBoard");

        } else if (workScheduleDto.getStartTime() != null) {
            workScheduleDto.setEndTime(Time);
            workScheduleDao.updateWorkEndTime(workScheduleDto);
            resp.sendRedirect("/workSchedule/empWorkBoard");
        } else if (workScheduleDto.getStartTime() != null && workScheduleDto.getEndTime() != null) {
            req.setAttribute("showAlert", true);
            req.getRequestDispatcher("/WEB-INF/workSchedule/board-empWork.jsp").forward(req, resp);
        }

//        이제 여기서부터 경우의 수 따져서 처리 + 예외처리

        System.out.println("오늘 날짜: " + currentDate);
        System.out.println("현재 시각: " + currentTime);
    }


}
