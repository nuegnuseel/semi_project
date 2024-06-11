package com.hrproject.hrproject.controller.attend;

import com.hrproject.hrproject.dao.AttendDao;
import com.hrproject.hrproject.dto.AttendDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/attend/list")
public class AttendList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
        AttendDao attendDao = new AttendDao();
        List<AttendDto> attendList = attendDao.getAttendList();
        req.setAttribute("attendList",attendList);
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/attend/list-attend.jsp");
        dispatcher.forward(req,resp);
    }
}
