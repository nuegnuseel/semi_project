<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>

<div class="content-area d-flex flex-column flex-shrink-0 position-relative col-3">
    <%--  제목 영역  --%>
    <div class="board-title">
        <h2 class="title">Login</h2>
    </div>
    <%--  내용 영역  --%>
    <div class="hrm-content-area p-3 bg-body-tertiary">
        <form action="../hrm/login-logout" method="post">
            <div class="row mt-3">
                <div class="col">사원번호</div>
                <div class="col col-4">
                    <input type="text" class="form-control" id="loginEmpNo" placeholder="사원번호 입력, admin, sal, attend, hrm" aria-label="empno"
                           name="loginEmpNo">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">비밀번호</div>
                <div class="col col-4">
                    <input type="password" class="form-control" id="loginPassword" placeholder="비밀번호 입력, admin&manager pw = 1234"
                           aria-label="password" name="loginPassword">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col col-4">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
            </div>
        </form>
    </div>
</div>