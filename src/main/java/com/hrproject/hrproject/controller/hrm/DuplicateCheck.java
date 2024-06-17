package com.hrproject.hrproject.controller.hrm;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.hrproject.hrproject.dao.HrmDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/hrm/duplicate-check")
public class DuplicateCheck extends HttpServlet {
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        HrmDao hrmDao = new HrmDao();
//        int result = -1;
//        if (req.getParameter("email") != null) result = hrmDao.duplicateCheck("email", req.getParameter("email"));
//        if (req.getParameter("mobile") != null) result = hrmDao.duplicateCheck("mobile", req.getParameter("mobile"));
//        if (req.getParameter("passport") != null) result = hrmDao.duplicateCheck("passport", req.getParameter("passport"));
//
//        Gson gson = new Gson();
//        Map<String, Integer> resultMap = new HashMap<>();
//        resultMap.put("count", result);
//        String resultJson = gson.toJson(resultMap);
//
//        resp.setContentType("application/json; charset=utf-8");
//        PrintWriter out = resp.getWriter();
//        out.println(resultJson);
//    }
    @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BufferedReader reader = req.getReader();
    StringBuilder sb = new StringBuilder();
    String line;
    while ((line = reader.readLine()) != null) {
        sb.append(line);
    }
    String requestData = sb.toString();

    // requestData는 JSON 형식의 데이터일 경우 파싱하여 사용
    Gson gson = new Gson();
    Map<String, String> dataMap = gson.fromJson(requestData, new TypeToken<Map<String, String>>() {}.getType());

    // 클라이언트로부터 전송된 각 파라미터에 접근하여 처리
    String email = dataMap.get("email");
    String mobile = dataMap.get("mobile");
    String passport = dataMap.get("passport");

        System.out.println(email);
        System.out.println(mobile);
        System.out.println(passport);

    // 각 파라미터에 대한 처리 로직 추가

    // JSON 형식의 응답을 생성하여 클라이언트에게 반환
    Map<String, Integer> resultMap = new HashMap<>();
    resultMap.put("count", 0); // 예시로 0을 넣었지만 실제로 처리한 결과를 여기에 넣어야 함
    String resultJson = gson.toJson(resultMap);

    resp.setContentType("application/json; charset=utf-8");
    PrintWriter out = resp.getWriter();
    out.println(resultJson);
}

}
