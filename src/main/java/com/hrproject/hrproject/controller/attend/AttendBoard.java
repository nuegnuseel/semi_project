package com.hrproject.hrproject.controller.attend;

import com.hrproject.hrproject.dao.AttendDao;
import com.hrproject.hrproject.dto.AttendDto;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/attend/board")
public class AttendBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String search = req.getParameter("search");
        String searchWord = req.getParameter("searchWord");
        String url = req.getRequestURL().toString().substring(22);


        // 검색어와 검색 조건이 모두 제공되면 검색을 수행합니다.
        if (search != null && searchWord != null && !search.isBlank() && !searchWord.isBlank()) {
            AttendDao attendDao = new AttendDao();
            List<AttendDto> attendList = attendDao.searchAttend(search, searchWord);
            req.setAttribute("attendList", attendList);
            req.setAttribute("url", url);

        } else {
            // 검색어나 검색 조건이 제공되지 않은 경우 모든 출결 정보를 가져옵니다.
            AttendDao attendDao = new AttendDao();
            List<AttendDto> attendList = attendDao.getAttendList();
            req.setAttribute("attendList", attendList);
            req.setAttribute("url", url);
        }

        // JSP 페이지로 포워딩합니다.
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/attend/board-attend.jsp");
        dispatcher.forward(req, resp);
    }
}
