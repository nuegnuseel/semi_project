<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionDto eq null}">
<div class="modal fade" id="loginModalToggle" data-bs-backdrop="static" tabindex="-1"
     aria-labelledby="loginModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">로그인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../hrm/login-logout" id="loginModal" method="post">
                    <div class="row mt-3">
                        <div class="col">사원번호</div>
                        <div class="col col-md-4">
                            <input type="text" class="form-control" id="empNo" placeholder="사원번호 입력" aria-label="empno" name="empNo">
                        </div>
                        <div class="col">비밀번호</div>
                        <div class="col col-md-4">
                            <input type="password" class="form-control" id="password" placeholder="비밀번호 = empNo"
                                   aria-label="password" name="password">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="loginModal" class="btn btn-primary" id="btn-insert">Submit</button>
                <button type="reset" form="loginModal" class="btn btn-danger">Reset</button>
            </div>
        </div>
    </div>
</div>
        <button type="button" class="btn btn-primary" style="width: 100px" data-bs-toggle="modal"
                data-bs-target="#loginModalToggle">로그인
        </button>
    </c:when>
    <c:otherwise>
        <div class="d-flex">
        <form action="../hrm/login-logout" method="post" id="logout">
            <input type="hidden" value="${sessionDto.empNo}" name="sessionEmpNo">
            <button class="btn btn-outline-primary ms" form="logout">로그아웃</button>
        </form>
        <form action="../hrm/mypage" method="post" id="mypage">
            <input type="hidden" value="${sessionDto.empNo}" name="sessionEmpNo">
            <button class="btn btn-outline-primary ms-1" form="mypage">마이페이지</button>
        </form>
        </div>
    </c:otherwise>
</c:choose>