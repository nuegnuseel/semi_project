package com.hrproject.hrproject.controller.salary;

import com.google.gson.Gson;
import com.hrproject.hrproject.dao.WorkScheduleDao;
import com.hrproject.hrproject.dto.HrmDto;
import com.hrproject.hrproject.dto.WorkScheduleDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.*;

@WebServlet("/salary/check")
public class SalaryCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LocalDate now = LocalDate.now(); //현재 날짜
        int year = now.getYear(); //현재 년도
        int month = now.getMonthValue(); //현재 달
        List<Integer> weekWorkTimes = new ArrayList<>(); // 주간근무시간
        int weekWorkTime = 0; //주간근무시간계산용
        String workMonth=now.toString().substring(0,7);
        System.out.println("get year===" + year);
        System.out.println("get month===" + month);
        System.out.println("get workMonth==="+workMonth);

        HttpSession session = req.getSession();
        HrmDto sessionDto = (HrmDto)session.getAttribute("sessionDto");
        int empNo = sessionDto.getEmpNo();

        System.out.println("get empNo==="+empNo);

        WorkScheduleDao workScheduleDao = new WorkScheduleDao();
        WorkScheduleDto workScheduleDto = WorkScheduleDto.builder()
                .empNo(empNo)
                .workMonth(workMonth)
                .build();
        List<WorkScheduleDto> workScheduleDtoList = workScheduleDao.getEmpWorkList(workScheduleDto); // 일한날 리스트
        System.out.println("workScheduleDtoList=="+workScheduleDtoList);
        Map<Integer,Integer>workDayList = new HashMap<>(); //일한날짜 리스트
        Calendar cal = Calendar.getInstance();
        cal.set(year, month - 1, 1); // 1월 = 0
        int dayLast = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        System.out.println("get dayLast===" + dayLast);

        boolean isWork = false;
        workDayList.put(0,0);
        for(int i=1; i<=dayLast; i++){
            isWork=false;
            for(int j=0; j<workScheduleDtoList.size(); j++){
                if(i == Integer.parseInt(workScheduleDtoList.get(j).getWorkDate().substring(8))){
                    workDayList.put(i,8);
                    isWork=true;
                }
            }
            if(!isWork) {
                workDayList.put(i,0);
            }
        }
// ServletRequest에 계산된 주간 근무시간을 저장하여 JSP로 전달합니다
        req.setAttribute("weekWorkTimes", weekWorkTimes);

        // 첫 번째 날의 요일 인덱스 구하기 (일요일: 1 ~ 토요일: 7)
        int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        System.out.println("get firstDayOfWeek===" + firstDayOfWeek);

        // 주차별 날짜 리스트 생성
        List<List<Integer>> weekDates = new ArrayList<>();

        int dayCounter = 1;
        for (int i = 0; i < 6; i++) { // 최대 6주까지 생성
            List<Integer> daysInWeek = new ArrayList<>();
            for (int j = 1; j <= 7; j++) {
                if (i == 0 && j < firstDayOfWeek) {
                    daysInWeek.add(0); // 첫 번째 주의 첫 날 이전은 0으로 채운다
                } else if (dayCounter <= dayLast) {
                    daysInWeek.add(dayCounter);
                    dayCounter++;
                } else {
                    daysInWeek.add(0); // 마지막 날 이후는 0으로 채운다
                }
            }
            weekDates.add(daysInWeek);
            if (dayCounter > dayLast) break; // 모든 날짜를 다 채웠으면 중단
        }
        int numberOfWeeks = weekDates.size();
        // 주간 근무시간을 계산할 리스트 초기화
        for (int i = 0; i < weekDates.size(); i++) {
            List<Integer> week = weekDates.get(i);
            int weeklyWorkTime = 0;

            // 주간 근무시간 계산
            for (int j = 0; j < week.size(); j++) {
                int day = week.get(j);
                if (day != 0) {
                    // workDayList는 0부터 시작하므로 인덱스 조정 필요
                    weeklyWorkTime += workDayList.get(day);
                }
            }

            // 계산된 주간 근무시간을 리스트에 추가
            weekWorkTimes.add(weeklyWorkTime);
        }
        req.setAttribute("year",year);
        req.setAttribute("month",month);
        req.setAttribute("weekDates", weekDates);
        req.setAttribute("numberOfWeeks", numberOfWeeks);
        req.setAttribute("workDayList",workDayList);
        req.setAttribute("weekWorkTimes", weekWorkTimes);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/salary/salary-check.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int empNo = Integer.parseInt(req.getParameter("empNo"));
        int searchYear = Integer.parseInt(req.getParameter("year"));
        int searchMonth = Integer.parseInt(req.getParameter("month"));
        String workMonth = "";
        if(searchMonth<10){
            workMonth = req.getParameter("year").concat("-0"+req.getParameter("month"));
        }else {
        workMonth = req.getParameter("year").concat("-"+req.getParameter("month"));
        }
        System.out.println("post empNo==="+empNo);
        System.out.println("post searchYear==="+searchYear);
        System.out.println("post searchMonth==="+searchMonth);
        System.out.println("post workMonth==="+workMonth);

        Calendar cal = Calendar.getInstance();
        cal.set(searchYear,searchMonth-1,1);
        int dayLast=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        int firstDayOfWeek =cal.get(Calendar.DAY_OF_WEEK);
        List<List<Integer>> weekDates = new ArrayList<>();
        int dayCounter=1;

        WorkScheduleDao workScheduleDao = new WorkScheduleDao();
        WorkScheduleDto workScheduleDto = WorkScheduleDto.builder()
                .empNo(empNo)
                .workMonth(workMonth)
                .build();

        List<WorkScheduleDto> workScheduleDtoList = workScheduleDao.getEmpWorkList(workScheduleDto); // 일한날 리스트
        Map<Integer,Integer> workDayList = new HashMap<>(); //일한날짜 리스트
        boolean isWork = false;
        workDayList.put(0,0);
        for(int i=1; i<=dayLast; i++){
            isWork=false;
            for(int j=0; j<workScheduleDtoList.size(); j++){
                if(i == Integer.parseInt(workScheduleDtoList.get(j).getWorkDate().substring(8))){
                    workDayList.put(i,8);
                    isWork=true;
                }
            }
            if(!isWork) {
                workDayList.put(i,0);
            }
        }
        System.out.println("workDayList==="+workDayList);
        for (int i = 0; i < 6; i++) { // 최대 6주까지 생성
            List<Integer> daysInWeek = new ArrayList<>();
            for (int j = 1; j <= 7; j++) {
                if (i == 0 && j < firstDayOfWeek) {
                    daysInWeek.add(0); // 첫 번째 주의 첫 날 이전은 0으로 채운다
                } else if (dayCounter <= dayLast) {
                    daysInWeek.add(dayCounter);
                    dayCounter++;
                } else {
                    daysInWeek.add(0); // 마지막 날 이후는 0으로 채운다
                }
            }
            weekDates.add(daysInWeek);
            if (dayCounter > dayLast) break; // 모든 날짜를 다 채웠으면 중단
        }
        int numberOfWeeks = weekDates.size();

        // 응답 객체 생성
        ResponseData responseData = new ResponseData(weekDates, numberOfWeeks,workDayList);

        Gson gson = new Gson();
        String json = gson.toJson(responseData);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.write(json);
        out.flush();
    }
    private static class ResponseData {
        List<List<Integer>> weekDates;
        Map<Integer,Integer> workDayList;
        int numberOfWeeks;


        public ResponseData(List<List<Integer>> weekDates, int numberOfWeeks ,Map<Integer,Integer> workDayList) {
            this.weekDates = weekDates;
            this.numberOfWeeks = numberOfWeeks;
            this.workDayList=workDayList;
        }
    }
}
