package com.hrproject.hrproject.controller.attend;

import com.google.gson.Gson;
import com.hrproject.hrproject.dao.AttendDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/attend/checkInsert")
public class CheckInsert extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String empNo = request.getParameter("empNo");
        String atdNo = request.getParameter("atdNo");

        int empResult=0;
        int atdResult=0;
        int result=0;

        AttendDao attendEmpNoDao = new AttendDao();
        empResult = attendEmpNoDao.checkEmpNo(empNo);
        AttendDao attendDao = new AttendDao();
        atdResult = attendDao.checkAtdNo(atdNo);

        if (empResult == 1 && atdResult == 0) {
            result = 1;
        }

        Gson gson = new Gson();
        String json = gson.toJson(result);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write(json);
        out.flush();

    }
}
