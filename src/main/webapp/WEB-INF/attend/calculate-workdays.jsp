<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>

<div class="content-area d-flex flex-column flex-shrink-0 position-relative col-12">
    <div class="board-title">
        <h2 class="title">근무 일수 및 연차 계산</h2>
    </div>
    <div class="attend-content-area p-3 bg-body-tertiary">
        <%-- 오류 메시지 표시 --%>
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" role="alert">
                    ${errorMessage}
            </div>
        </c:if>

        <%-- 입력 폼 - 근무 일수 계산 --%>
        <form action="/attend/calculate-workdays" method="post" class="mb-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="date" class="form-control" name="hireDate" placeholder="입사일 선택" required>
                        <button type="submit" class="btn btn-primary">근무 일수 계산</button>
                    </div>
                </div>
            </div>
        </form>

        <%-- 근무 일수 계산 결과 표시 --%>
        <c:if test="${not empty workDays}">
            <div class="row mt-3">
                <div class="col-md-6">
                    <h5>입사일로부터 근무한 일수 계산 결과</h5>
                    <p>입사일로부터 ${workDays}일 동안 근무하셨습니다.</p>
                </div>
            </div>
        </c:if>

        <%-- 입력 폼 - 연차 계산 --%>
        <form action="/attend/calculate-annual-leave" method="post" class="mb-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group">
                        <input type="date" class="form-control" name="hireDate" placeholder="입사일 선택" required>
                        <button type="submit" class="btn btn-primary">연차 계산</button>
                    </div>
                </div>
            </div>
        </form>

        <%-- 연차 계산 결과 표시 --%>
        <c:if test="${not empty annualLeaveDays}">
            <div class="row mt-3">
                <div class="col-md-6">
                    <h5>근속 연수에 따른 연차 계산 결과</h5>
                    <p>${annualLeaveDays}일의 연차를 사용할 수 있습니다.</p>
                </div>
            </div>
        </c:if>
    </div>
</div>
