package com.hrproject.hrproject.controller.hrm;

import com.hrproject.hrproject.dao.HrmDao;
import com.hrproject.hrproject.dto.HrmDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/hrm/view")
public class HrmView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int empNo = 0;
        if (req.getParameter("empNo") != null) empNo = Integer.parseInt(req.getParameter("empNo"));

        HrmDao hrmDao = new HrmDao();
        HrmDto hrmDto = hrmDao.getHrm(empNo);
        req.setAttribute("hrmViewDto", hrmDto);
        req.getRequestDispatcher("/WEB-INF/hrm/hrm-view.jsp").forward(req, resp);
    }
}
