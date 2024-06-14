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
import org.eclipse.tags.shaded.org.apache.xalan.xsltc.trax.TemplatesImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/workSchedule/empWorkBoard")
public class empWorkBoard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


//        로그인을 통해서 현재 접속자 empNo를 받아와야 합니다~~~~
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

//        세션으로 로그인된 사람의 empNo를 받아와야 함!!!!!!!!!!
        int empNo = 1;
        String Date = currentDate.toString(); // LocalDate는 ISO 형식으로 문자열로 변환됨
        String Time = currentTime.toString(); // LocalTime은 ISO 형식으로 문자열로 변환됨
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        String formattedTime = currentTime.format(formatter);
        /*
         * 경우의 수 ___ 먼저 기록을 검사를 하고 경우의 수를 따져야 함
         *
         * 1. status= 출근인 경우
         * 오늘날짜에 휴가수==1인 값이 없고, 출근기록이 == null일 때 ... 출근
         *
         * 2. status= 퇴근인 경우
         * 오늘날짜에 출근기록이 있고, 퇴근기록이 == null일 때 ... 퇴근
         *
         * 3. status= 휴가코드
         * 오늘날짜에 하루휴가인 경우에 근태코드에 따른 status를 반영한다.
         *
         * 4. status= null
         * 오늘날짜에 휴가도 뭣도 아무것도 없으면
         *
         * 5. status= 결석
         * 오늘날짜에 어제날짜 status = null이면 어제날짜 status 결석
         *
         * status= (출근 or 퇴근)/휴가코드
         * 오늘날짜에 하루휴가가 아닌 경우 + 출퇴근 기록이 있을시
         */

        // 대상 사원의 휴가기록 조사
        AttendDao attendDao = new AttendDao();
        List<AttendDto> attendDtoList = attendDao.getAttendListByEmpNo(empNo);
        List<String> allDates = null;
        String vacationCode = null;
        double duration = 0;

        for (int i = 0; i < attendDtoList.size(); i++) {
            String date = attendDtoList.get(i).getAtdDate();

            // "날짜 ~ 날짜"여서 안에 있는 공백 다 없앰!
            date.trim();
            String dateRange = date.replaceAll("\\s+", "");

            //"~"를 기준으로 값 시작날과 마지막날 값 가져옴!
            String[] dates = dateRange.split("~");
            if (dates.length != 2) {
                throw new IllegalArgumentException("Invalid date format");
            }

            String startDateStr = dates[0].trim();
            String endDateStr = dates[1].trim();

            // 무튼 시작날부터 마지막날까지의 모든 날을 가져옴
            DateTimeFormatter formatterDate = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate startDate = LocalDate.parse(startDateStr, formatterDate);
            LocalDate endDate = LocalDate.parse(endDateStr, formatterDate);
            allDates = new ArrayList<>();
            LocalDate tempDate = startDate;
            while (!tempDate.isAfter(endDate)) {
                allDates.add(tempDate.format(formatter));
                tempDate = tempDate.plusDays(1);
            }
            for (int j = 0; j < allDates.size(); j++) {
                if (allDates.get(j).equals(Date)) {
//              ?어라 오늘날짜에 휴가가 있네? 그럼 뭐 해야해?? 오늘날짜의 근태코드랑 근태수를 가져와야지
                    vacationCode = attendDtoList.get(j).getAtdCode();
                    duration = attendDtoList.get(j).getAtdNum();
                }
            }

        }




        // 오늘자 워크스케쥴러 init


        // 오늘 날짜의 대상 사원의 워크스케쥴 만들어야함..
        // 그러면 먼저 워크스케쥴을 가져와서 오늘 날짜의 디비가 있는지 없는지 체크하고 없으면  전사원을 대상으로 오늘날짜 DB만든다.
        // 이게 맞나? 안맞음. 제대로 할거면 서버에서 계속 시간을 체크하면서 다음날이 되는 순간 전사원을 대상으로 오늘날짜 DB만들어야 함


        WorkScheduleDao workScheduleDao = new WorkScheduleDao();

        // 오늘날짜 DB 있는지 체크
        if (workScheduleDao.getTodaySchedule(Date) == null) {
            // 오늘날짜 DB가 없으니까 전사원 대상 오늘 날짜 DB생성
            // 그럼 어떻게??? 전사원 대상으로 DB를 만드냐..
            System.out.println("오늘자 DB가 없습니다. 만든다.");
            // 먼저 모든 사원의 empNo의 리스트를 받아야되겠쬬?
            HrmDao hrmDao = new HrmDao();
            List<HrmDto> empNoList = hrmDao.getEmpNoList();

            if (empNoList != null) {
                System.out.println("List로 전 사원 empNo 받음");
            }
            // 그 리스트로 전 사원 대상 워크스케쥴러 만들기!
            workScheduleDao.createAllEmpSchedule(empNoList);

            //오늘자 워크스케쥴러 ATTEND DB에서 받은 휴가 업데이트.

            // ATTEND_DB에 있는 휴가가 현재날짜에 부합하면,
            // for(
            //      EmpNo 기준으로 ATTEND_DB에 있는 휴가 날짜를 받아와서

//            for ()
//            attendDao.getAttendListByEmpNo()
            //       그 "YYYY-MM-DD ~ YYYY-MM-DD" String 받아서
            //       공백 삭제하고 시작날과 끝나는 날를 배열로 받아서
            //       그걸 기준으로 날짜를 받아서 리스트에 모든 날을 넣어서~
            //       오늘 날과 비교하고, 비교했는데 휴가 날짜가 있으면
            //       그 ATTEND_DB.ATDCODE 받아서
            //       EMPNO기준으로 워크스케쥴러DB.Status에 ATDCODE기입을 하는데
            //       ATDCODE와 부합하는 휴가명을 ex)연차ㅇ 월차 ㅓ예비군 etc (그러면 열거도 만들어야함)
            //       status에 update를 한다.
             //   )
            // 이렇게 하면 오늘자에 모든 사원의 휴가가 업데이트 된다.!



        }





        // 1. status= 출근인 경우
        if (vacationCode == null)


            // 1.먼저 오늘날짜의 휴가기록을 가져온다.
            // 2.오늘 날짜의 workDB를 가져온다.
            // 2-1 만약 오늘 날짜의 workDB가 없으면 만든다?(날짜 바뀌면 자동으로 모든 사원의 오늘날짜DB만들고 싶은데)


            System.out.println("오늘 날짜: " + currentDate);
        System.out.println("현재 시각: " + currentTime);

    }
}
