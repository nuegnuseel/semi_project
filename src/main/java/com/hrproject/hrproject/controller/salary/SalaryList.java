package com.hrproject.hrproject.controller.salary;

import com.hrproject.hrproject.dao.SalaryDao;
import com.hrproject.hrproject.dto.SalaryDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/salary/list")
public class SalaryList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
        SalaryDao salaryDao = new SalaryDao();
        List<SalaryDto> salaryList = salaryDao.getSalaryList();
        req.setAttribute("salaryList",salaryList);
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("/WEB-INF/salary/list-salary.jsp");
        dispatcher.forward(req,resp);
    }
}
