package com.hrproject.hrproject.controller.workSchedule;

import com.hrproject.hrproject.dao.WorkScheduleDao;
import com.hrproject.hrproject.dto.WorkScheduleLogDto;
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
        WorkScheduleLogDto workScheduleLogDto01 = workScheduleDao.getWorkScheduleByWorkIdx(workIdx);
        System.out.println("workScheduleLogDto01 >>>> " + workScheduleLogDto01);

        WorkScheduleLogDto workScheduleLogDto02;
        workScheduleLogDto02 = WorkScheduleLogDto.builder()
                .workIdx(workScheduleLogDto01.getWorkIdx())
                .empNo(workScheduleLogDto01.getEmpNo())
                .workDate(workScheduleLogDto01.getWorkDate())
                .startTime(workScheduleLogDto01.getStartTime())
                .endTime(workScheduleLogDto01.getEndTime())
                .status(workScheduleLogDto01.getStatus())
                .atdNo(workScheduleLogDto01.getAtdNo())
                .vacationCode(workScheduleLogDto01.getVacationCode())
                .modifyReason("아직 구현 안했는데 고민 중")
                .whoModify("세션 아이디 받아와야합니다~")
                .logStatus("D")
                .build();


        workScheduleDao.insertWorkScheduleLog(workScheduleLogDto02);

        workScheduleDao.deleteWorkSchedule(workIdx);
        resp.sendRedirect("/workSchedule/adminWorkBoard");
    }
}
