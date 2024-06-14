<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp"%>
<div class="content-area d-flex flex-column flex-shrink-0 position-relative col-12">
    <div class="board-title">
<h2 class="title">공지사항 상세 내용</h2>
</div>
    <div class="notice-content-area p-3 bg-body-tertiary">
        <h3>${notice.title}</h3>
        <p><strong>작성자:</strong> ${notice.author}</p>
        <p><strong>작성일:</strong> ${notice.created_date}</p>
        <p><strong>조회수:</strong> ${notice.views}</p>
        <hr>
        <p>${notice.content}</p>
    </div>
</div>
