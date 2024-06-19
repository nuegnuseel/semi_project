package com.hrproject.hrproject.controller.workSchedule;

import com.hrproject.hrproject.dao.WorkScheduleDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/workSchedule/delete")
public class WorkScheduleDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int workIdx = Integer.parseInt(req.getParameter("workIdx"));
        WorkScheduleDao workScheduleDao = new WorkScheduleDao();
        workScheduleDao.deleteWorkSchedule(workIdx);
        resp.sendRedirect("/workSchedule/adminWorkBoard");
    }
}
