package com.hrproject.hrproject.controller.attend;

import com.google.gson.Gson;
import com.hrproject.hrproject.controller.salary.SalaryCheck;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet("/attend/check")
public class AttendCheck extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LocalDate now = LocalDate.now(); //현재 날짜
        int year = now.getYear(); //현재 년도
        int month = now.getMonthValue(); //현재 달
        System.out.println("year===" + year);
        System.out.println("month===" + month);

        Calendar cal = Calendar.getInstance();
        cal.set(year, month - 1, 1); // 1월 = 0
        int dayLast = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        System.out.println("dayLast===" + dayLast);

        // 첫 번째 날의 요일 인덱스 구하기 (일요일: 1 ~ 토요일: 7)
        int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        System.out.println("firstDayOfWeek===" + firstDayOfWeek);

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

        req.setAttribute("weekDates", weekDates);
        req.setAttribute("numberOfWeeks", numberOfWeeks);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/attend/attend-check.jsp");
        dispatcher.forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String empNo = req.getParameter("empNo");
        String accountingPeriod = req.getParameter("accountingPeriod");

        System.out.println("empNo==="+empNo);
        System.out.println("accountingPeriod==="+accountingPeriod);

        int searchYear=Integer.parseInt(accountingPeriod.substring(0,4));
        int searchMonth=Integer.parseInt(accountingPeriod.substring(4,6));

        System.out.println("searchYear==="+searchYear);
        System.out.println("searchMonth==="+searchMonth);

        Calendar cal = Calendar.getInstance();
        cal.set(searchYear,searchMonth-1,1);
        int dayLast=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        int firstDayOfWeek =cal.get(Calendar.DAY_OF_WEEK);
        List<List<Integer>> weekDates = new ArrayList<>();
        int dayCounter=1;

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
        AttendCheck.ResponseData responseData = new AttendCheck.ResponseData(weekDates, numberOfWeeks);

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
        int numberOfWeeks;

        public ResponseData(List<List<Integer>> weekDates, int numberOfWeeks) {
            this.weekDates = weekDates;
            this.numberOfWeeks = numberOfWeeks;
        }
    }
}
