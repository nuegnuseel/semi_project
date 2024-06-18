package com.hrproject.hrproject.controller.wokrSchedule;

import com.hrproject.hrproject.dao.WorkScheduleDao;
import com.hrproject.hrproject.dto.HrmDto;
import com.hrproject.hrproject.dto.WorkScheduleAdminDto;
import com.hrproject.hrproject.dto.WorkScheduleDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/workSchedule/adminWorkBoard")
public class adminWorkBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<WorkScheduleAdminDto> adminWrokList;
        WorkScheduleDao workScheduleDao = new WorkScheduleDao();

        adminWrokList = workScheduleDao.selectAllByAdmin();
        req.setAttribute("adminWorkList",adminWrokList);

        req.getRequestDispatcher("/WEB-INF/workSchedule/board-adminWork.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
