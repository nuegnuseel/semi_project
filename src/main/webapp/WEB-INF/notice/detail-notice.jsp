<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/left_side_menu.jsp"%>
<div class="content-area d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary position-absolute top-0 col-8" style="width: calc(100% - 520px);">
    <h2>공지사항 상세 내용</h2>
    <div>
        <h3>${notice.title}</h3>
        <p><strong>작성자:</strong> ${notice.author}</p>
        <p><strong>작성일:</strong> ${notice.created_date}</p>
        <p><strong>조회수:</strong> ${notice.views}</p>
        <hr>
        <p>${notice.content}</p>
    </div>
</div>

<%@ include file="../include/right_side_info.jsp"%>
