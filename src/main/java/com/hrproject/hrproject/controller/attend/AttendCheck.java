package com.hrproject.hrproject.controller.attend;

import com.hrproject.hrproject.controller.salary.SalaryCheck;
import com.hrproject.hrproject.dao.AttendDao;
import com.hrproject.hrproject.dto.AttendDto;
import com.google.gson.Gson;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.*;

@WebServlet("/attend/check")
public class AttendCheck extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        LocalDate now = LocalDate.now(); // 현재 날짜
        int year = now.getYear(); // 현재 년도
        int month = now.getMonthValue(); // 현재 달


        Calendar cal = Calendar.getInstance();
        cal.set(year, month - 1, 1); // 1월 = 0
        int dayLast = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        System.out.println("dayLast===" + dayLast);

        // 첫 번째 날의 요일 인덱스 구하기 (일요일: 1 ~ 토요일: 7)
        int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        System.out.println("firstDayOfWeek===" + firstDayOfWeek);

        // 주차별 날짜 리스트 생성
        List<List<Integer>> weekDates = generateWeeklyDates(firstDayOfWeek, dayLast);
        int numberOfWeeks = weekDates.size();

        req.setAttribute("weekDates", weekDates);
        req.setAttribute("numberOfWeeks", numberOfWeeks);

        String formatMonth;
        if (month < 10) {
             formatMonth = "0"+month;
        }
        else {
            formatMonth = String.valueOf(month);
        }

        req.setAttribute("year", String.valueOf(year));
        req.setAttribute("month", formatMonth);


        // 승인 상태의 근태 출력
        AttendDao attendDao = new AttendDao();
        List<AttendDto> approvedAttendList = attendDao.getApprovedAttendList();
        req.setAttribute("approvedAttendList", approvedAttendList);

        String search = req.getParameter("search");
        String searchWord = req.getParameter("searchWord");
        String url = req.getRequestURL().toString().substring(22);

        // 검색어와 검색 조건이 모두 제공되면 검색을 수행합니다.
        if (search != null && searchWord != null && !search.isBlank() && !searchWord.isBlank()) {
            List<AttendDto> attendList = attendDao.searchAttend(search, searchWord);
            req.setAttribute("attendList", attendList);
        } else {
            // 모든 근태 출력
            List<AttendDto> attendList = attendDao.getAttendList();
            req.setAttribute("attendList", attendList);
        }

        req.setAttribute("url", url);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/attend/check-attend.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int year = Integer.parseInt(req.getParameter("year"));
        int month = Integer.parseInt(req.getParameter("month"));

        System.out.println("year===" + year);
        System.out.println("month===" + month);

        Calendar cal = Calendar.getInstance();
        cal.set(year, month-1, 1);
        int dayLast = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        List<List<Integer>> weekDates = generateWeeklyDates(firstDayOfWeek, dayLast);
        int numberOfWeeks = weekDates.size();

        System.out.println("dayLast==="+dayLast);
        System.out.println("firstDayOfWeek==="+firstDayOfWeek);
        System.out.println("numberOfWeeks==="+numberOfWeeks);
        System.out.println("weekDates==="+weekDates);

        AttendDao attendDao = new AttendDao();

        List<AttendDto> approvedAttendList = attendDao.getApprovedAttendList();

        req.setAttribute("approvedAttendList", approvedAttendList);

        // 응답 객체 생성
        AttendCheck.ResponseData responseData = new  AttendCheck.ResponseData(weekDates, numberOfWeeks,year,month,approvedAttendList);

        Gson gson = new Gson();


        String jsonResponse = gson.toJson(responseData);

        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        PrintWriter out = resp.getWriter();
        out.write(jsonResponse);
        out.flush();
    }

    private List<List<Integer>> generateWeeklyDates(int firstDayOfWeek, int dayLast) {
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
        return weekDates;
    }

    private static class ResponseData {
        List<List<Integer>> weekDates;
        int numberOfWeeks;
        int year;
        int month;
        List<AttendDto> approvedAttendList;
        public ResponseData(List<List<Integer>> weekDates, int numberOfWeeks , int year , int month, List<AttendDto> approvedAttendList) {
            this.weekDates = weekDates;
            this.numberOfWeeks = numberOfWeeks;
            this.year=year;
            this.month=month;
            this.approvedAttendList = approvedAttendList;
        }
    }
}
