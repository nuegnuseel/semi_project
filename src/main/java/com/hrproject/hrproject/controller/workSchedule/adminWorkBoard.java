package com.hrproject.hrproject.controller.workSchedule;

import com.hrproject.hrproject.dao.WorkScheduleDao;
import com.hrproject.hrproject.dto.WorkScheduleAdminDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/workSchedule/adminWorkBoard")
public class adminWorkBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<WorkScheduleAdminDto> adminWrokList;
        WorkScheduleDao workScheduleDao = new WorkScheduleDao();

        adminWrokList = workScheduleDao.selectAllByAdmin();
        req.setAttribute("adminWorkList", adminWrokList);

        req.getRequestDispatcher("/WEB-INF/workSchedule/board-adminWork.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);
        WorkScheduleDao workScheduleDao = new WorkScheduleDao();

        String workDate = req.getParameter("searchWorkDate");
        int empNo=0;
        if (!req.getParameter("searchWorkEmpNo").isEmpty()) {
            empNo = Integer.parseInt(req.getParameter("searchWorkEmpNo"));
        }
        String deptName = req.getParameter("searchWorkDept");
        String ename = req.getParameter("searchWorkEName");
        String status = req.getParameter("searchWorkStatus");
        String vacationCode = req.getParameter("searchWorkVacation");

        WorkScheduleAdminDto workScheduleAdminDto = WorkScheduleAdminDto.builder()
                .workDate(workDate)
                .empNo(empNo)
                .deptName(deptName)
                .ename(ename)
                .status(status)
                .vacationCode(vacationCode)
                .build();

        List<WorkScheduleAdminDto> WSADtoList = workScheduleDao.getAdminWorkList(workScheduleAdminDto);

        req.setAttribute("adminWorkList", WSADtoList);
        req.getRequestDispatcher("/WEB-INF/workSchedule/board-adminWork.jsp").forward(req, resp);
    }
}
