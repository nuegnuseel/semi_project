<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="loginModalToggle" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">로그인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/hrm/login-logout" id="loginModalLabel" method="post">
                    <div class="row mt-8">
                        <div class="col">사원번호</div>
                        <div class="col col-md-8">
                            <input type="text" class="form-control" id="loginEmpNo" placeholder="사원번호 입력" aria-label="loginEmpNo" name="loginEmpNo">
                        </div>
                    </div>
                    <div class="row mt-8">
                        <div class="col">비밀번호</div>
                        <div class="col col-md-8">
                            <input type="password" class="form-control" id="loginPassword" placeholder="비밀번호 = empNo"
                                   aria-label="loginPassword" name="loginPassword">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="loginModalLabel" class="btn btn-primary" id="btn-insert">Submit</button>
                <button type="reset" form="loginModalLabel" class="btn btn-danger">Reset</button>
            </div>
        </div>
    </div>
</div>