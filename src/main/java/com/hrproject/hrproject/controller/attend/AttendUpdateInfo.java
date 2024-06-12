package com.hrproject.hrproject.controller.attend;

import com.hrproject.hrproject.dao.AttendDao;
import com.hrproject.hrproject.dto.AttendDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/attend/attendUpdateInfo")
public class AttendUpdateInfo extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selectName =req.getParameter("ATDNO");

        AttendDao attendDao = new AttendDao();
        AttendDto updateInfoDto = attendDao.getUpdateInfo(selectName);



    }
}
