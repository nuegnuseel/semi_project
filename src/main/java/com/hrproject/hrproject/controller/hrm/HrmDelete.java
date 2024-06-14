package com.hrproject.hrproject.controller.hrm;

import com.hrproject.hrproject.dao.HrmDao;
import com.hrproject.hrproject.dto.HrmDto;
import com.hrproject.hrproject.utils.ScriptWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/hrm/delete")
public class HrmDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        int empNo = 0;
//        if (req.getParameter("empNo") != null) empNo = Integer.parseInt(req.getParameter("empNo"));
//
//        HrmDao hrmDao = new HrmDao();
//        HrmDto hrmDto = hrmDao.getHrm(empNo);
//        req.setAttribute("hrmDeleteDto", hrmDto);

        req.getRequestDispatcher("/WEB-INF/hrm/hrm-delete.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String[] tempArray = req.getParameterValues("check");
        int[] noArray = new int[tempArray.length];
        for (int i = 0; i < tempArray.length; i++) {
            noArray[i] = Integer.parseInt(tempArray[i]);
        }
        HrmDao hrmDao = new HrmDao();
        int result = hrmDao.setShowAbleHrm(noArray);

        if (result > 0) {
            ScriptWriter.alertAndNext(resp, "사원 삭제가 완료되었습니다.", "../hrm/board");
        } else {
            ScriptWriter.alertAndBack(resp, "오류가 발생했습니다. 다시 시도해주세요.");
        }
    }
}