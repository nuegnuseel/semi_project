package com.hrproject.hrproject.controller.workSchedule;

import com.hrproject.hrproject.dao.WorkScheduleDao;
import com.hrproject.hrproject.dto.WorkScheduleDto;
import com.hrproject.hrproject.dto.WorkScheduleLogDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/workSchedule/modify")
public class WorkScheduleModify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPost(req, resp);

        WorkScheduleDao workScheduleDao = new WorkScheduleDao();

        String startTime = req.getParameter("modifyStartTime");
        String endTime = req.getParameter("modifyEndTime");
        int workIdx  = Integer.parseInt(req.getParameter("workIdx_modify"));
        String startTimeFormat = startTime+":00";
        String endTimeFormat = endTime+":00";
        System.out.println("startTime >>> "+startTimeFormat);
        System.out.println("endTime >>> "+endTimeFormat);

        //수정 전 내역 LOG 기록
        // 세션에서 로그인 ID를 받아와야함 나중에 해야합니다~~
        // FM대로 할거면 왜 수정했는지도 넣어야 할거 같은데 패스합니다~

//        WorkScheduleLogDto workScheduleLogDto = workScheduleDao.getWorkScheduleByWorkIdx(workIdx);
//        workScheduleLogDto = WorkScheduleLogDto.builder()
//                .whoModify("whoModify세션에서 받아와야합니다~")
//                .logStatus("M")
//                .build();
//        workScheduleDao.insertWorkScheduleLog(workScheduleLogDto);

        Map<String,Object> modifyParamMap = new HashMap<>();

        modifyParamMap.put("startTime",startTimeFormat);
        modifyParamMap.put("endTime",endTimeFormat);
        modifyParamMap.put("workIdx",workIdx);
        workScheduleDao.modifyWorkTime(modifyParamMap);

        resp.sendRedirect("/workSchedule/adminWorkBoard");
//        req.getRequestDispatcher("/WEB-INF/workSchedule/board-adminWork.jsp").forward(req, resp);

    }


}
