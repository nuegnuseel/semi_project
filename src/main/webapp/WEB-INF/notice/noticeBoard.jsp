<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp"%>
<%@include file="../include/left_side_menu.jsp"%>
<div class="content-area d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary position-absolute top-0 col-8" style="width: calc(100% - 520px);">
    <h2>noticeboard</h2>
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <%-- 10개 --%>
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">작성일</th>
                <th scope="col">조회수</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${noticeList}" var="noticeDto" varStatus="loop">
                <tr>
                    <td>${noticeDto.notice_no}</td>  <%-- 글번호 --%>
                    <td><a href="/notice/detail?notice_no=${noticeDto.notice_no}">${noticeDto.title}</td> <%-- 제목 --%>
                    <td>${noticeDto.author}</td> <%-- 작성자 --%>
                    <td>${noticeDto.created_date}</td> <%-- 작성일 --%>
                    <td>${noticeDto.views}</td> <%-- 글번호 --%>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <button id="writeBtn" class="notice-write btn btn-outline-primary">글작성하기</button>
</div>

<script>
    // JavaScript를 사용하여 버튼 클릭 이벤트 처리
    document.getElementById('writeBtn').addEventListener('click', function() {
        window.location.href = "/notice/insert"; // 클릭 시 이동할 페이지 URL 설정
    });
</script>

<%@include file="../include/right_side_info.jsp"%>