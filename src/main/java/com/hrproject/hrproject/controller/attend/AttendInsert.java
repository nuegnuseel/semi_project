package com.hrproject.hrproject.controller.attend;



import com.hrproject.hrproject.dao.AttendDao;;
import com.hrproject.hrproject.dao.HrmDao;
import com.hrproject.hrproject.dto.AttendDto;
import com.hrproject.hrproject.dto.HrmDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/attend/insert")
public class AttendInsert extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HrmDao hrmDao = new HrmDao();
        List<HrmDto> hrmList=null;

        if (hrmList != null){
            System.out.println("hrm select Query successfully");
        }else {
            System.out.println("hrm select Qry failed");
        }

        System.out.println(hrmList);
        req.setAttribute("hrmList",hrmList);
        req.getRequestDispatcher("/WEB-INF/attend/insert-attend.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AttendDto attendDto = AttendDto.builder()
                .empNo(Integer.parseInt(req.getParameter("empNo")))
                .eName(req.getParameter("eName"))
                .attendCount(req.getParameter("attendCount"))
                .attendNo(req.getParameter("attendNo"))
                .num(Double.parseDouble(req.getParameter("num")))
                .attendDate(req.getParameter("attendDate"))
                .offDay(req.getParameter("offDay"))
                .detailOffday(req.getParameter("detailOffday"))
                .detailOffday(req.getParameter("print"))
                .build();

        AttendDao attendDao = new AttendDao();


        int result = attendDao.insertAttendDao(attendDto);


        req.getRequestDispatcher("/WEB-INF/attend/insert-attend.jsp").forward(req, resp);
    }
}

