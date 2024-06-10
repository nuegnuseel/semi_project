package com.hrproject.hrproject.controller.salary;

import com.hrproject.hrproject.dao.HrmDao;
import com.hrproject.hrproject.dao.SalaryDao;
import com.hrproject.hrproject.dto.HrmDto;
import com.hrproject.hrproject.dto.SalaryDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/salary/insert")
public class SalaryInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HrmDao hrmDao = new HrmDao();
        List<HrmDto> hrmList=hrmDao.Test___getHrmList();

        if (hrmList !=null){
            System.out.println("hrm select Query successfully");
        }else {
            System.out.println("hrm select Qry failed");
        }

        System.out.println(hrmList);
        req.setAttribute("hrmList",hrmList);
        req.getRequestDispatcher("/WEB-INF/salary/insert-salary.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SalaryDto salaryDto = SalaryDto.builder()
                .empNo(Integer.parseInt(req.getParameter("empNo")))
                .accountingPeriod(req.getParameter("accountingPeriod"))
                .salaryCategory(req.getParameter("salaryCategory"))
                .salaryName(req.getParameter("salaryName"))
                .salaryDay(req.getParameter("salaryDay"))
                .salary(Integer.parseInt(req.getParameter("salary")))
                .salaryInfo(req.getParameter("salaryInfo"))
                .bonus(Integer.parseInt(req.getParameter("bonus")))
                .build();

        SalaryDao salaryDao = new SalaryDao();


        int result = salaryDao.insertSalaryDao(salaryDto);


        req.getRequestDispatcher("/WEB-INF/salary/insert-salary.jsp").forward(req, resp);
    }
}
