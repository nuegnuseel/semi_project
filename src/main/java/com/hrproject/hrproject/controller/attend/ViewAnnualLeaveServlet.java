package com.hrproject.hrproject.controller.attend;

import com.hrproject.hrproject.dao.HrmDao;
import com.hrproject.hrproject.dto.AttendDto;
import com.hrproject.hrproject.dto.HrmDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.List;

@WebServlet("/attend/view-annual-leave")
public class ViewAnnualLeaveServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String empNo = req.getParameter("empNo");

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/attend/view-annual-leave.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String empNo = req.getParameter("empNo");
        String hireDateStr = req.getParameter("hireDate");

        LocalDate hireDate = null;
        LocalDate today = LocalDate.now();
        long workDays = 0;

        if (empNo != null && !empNo.isEmpty()) {
            try {
                HrmDao hrmDao = new HrmDao();
                HrmDto hrmDto = hrmDao.getHrm(Integer.parseInt(empNo));

                if (hrmDto != null && hrmDto.getHireDate() != null) {
                    hireDate = LocalDate.parse(hrmDto.getHireDate(), DateTimeFormatter.ISO_DATE);
                    workDays = ChronoUnit.DAYS.between(hireDate, today);

                    AnnualLeaveCalculator calculator = new AnnualLeaveCalculator();
                    int totalAnnualLeaveDays = calculator.calculateAnnualLeave(hireDate);
                    int usedAnnualLeaveDays = hrmDao.getUsedAnnualLeaveDays(Integer.parseInt(empNo));
                    int remainingAnnualLeaveDays = totalAnnualLeaveDays - usedAnnualLeaveDays;

                    hrmDto.setRemainingAnnualLeaveDays(remainingAnnualLeaveDays);
                    req.setAttribute("hrmDto", hrmDto);
                    req.setAttribute("workDays", workDays); // 근무 일수
                } else {
                    req.setAttribute("errorMessage", "직원 정보를 찾을 수 없습니다.");
                }
            } catch (NumberFormatException e) {
                req.setAttribute("errorMessage", "유효한 사원 번호를 입력하세요.");
            } catch (DateTimeParseException e) {
                req.setAttribute("errorMessage", "입사일 형식이 올바르지 않습니다. (예: yyyy-MM-dd)");
            }
        } else if (hireDateStr != null && !hireDateStr.isEmpty()) {
            try {
                hireDate = LocalDate.parse(hireDateStr, DateTimeFormatter.ISO_DATE);
                workDays = ChronoUnit.DAYS.between(hireDate, today);

                req.setAttribute("hireDate", hireDateStr); // 선택한 입사일
                req.setAttribute("workDays", workDays); // 근무 일수
            } catch (DateTimeParseException e) {
                req.setAttribute("errorMessage", "올바른 날짜 형식을 입력하세요. (예: yyyy-MM-dd)");
            }
        } else {
            req.setAttribute("errorMessage", "사원 번호 또는 입사일을 입력하세요.");
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/attend/view-annual-leave.jsp");
        dispatcher.forward(req, resp);
    }
}