<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp"%>
<%@include file="../include/left_side_menu.jsp"%>

<div class="container content-area d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary position-absolute top-0 col-8" style="width: calc(100% - 520px);">
    <h2 class="mt-5 mb-5">Attend list</h2>
    <form action="../board/delete-all" method="post">
        <table class="table table-striped">
            <thead>
            <tr>
                <%-- 10개 --%>
                <th scope="col">사원번호</th>
                <th scope="col">근태번호</th>
                <th scope="col">사원명</th>
                <th scope="col">근태코드</th>
                <th scope="col">근태수</th>
                <th scope="col">근태기간</th>
                <th scope="col">휴가명</th>
                <th scope="col">휴가사유</th>
                <th scope="col">인쇄</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${attendList}" var="attendDto" varStatus="loop">
                <tr>
                    <td>${attendDto.empNo}</td>
                    <td>${attendDto.atdNo}</td>
                    <td>${attendDto.ename}</td>
                    <td>${attendDto.atdCode}</td>
                    <td>${attendDto.atdNum}</td>
                    <td>${attendDto.atdDate}</td>
                    <td>${attendDto.offDay}</td>
                    <td>${attendDto.offDayRs}</td>
                    <td>${attendDto.print}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
    <div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" data-bs-backdrop="static"
         tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalToggleLabel">근태 입력</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="../attend/insert" id="modalForm" method="post">
                        <div class="row mb-3">
                            <label for="empNo" class="col-sm-2 col-form-label">사원번호</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="empNo">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="attendCount" class="col-sm-2 col-form-label">근태번호</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attendCount">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="eName" class="col-sm-2 col-form-label">사원명</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="ename">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="attendNo" class="col-sm-2 col-form-label">근태코드</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attendNo">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="num" class="col-sm-2 col-form-label">근태수</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="num">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="attendNo" class="col-sm-2 col-form-label">근태기간</label>
                            <div class="col-sm-10 col-auto">
                                <input type="date" class="form-control" id="startAttendDate"> ~ <input type="date" class="form-control" id="endAttendDate">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="offday" class="col-sm-2 col-form-label">휴가명</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="offday">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="detailOffday" class="col-sm-2 col-form-label">휴가사유</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="detailOffday">
                            </div>
                        </div>

                        <legend class="col-form-label col-sm-2 pt-0">인쇄</legend>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="print" id="printY" value="printY" checked>
                            <label class="form-check-label" for="printY">
                                Y
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="print" id="printN" value="printN">
                            <label class="form-check-label" for="printN">
                                N
                            </label>
                        </div>
                    </form>
                </div>


                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" form="modalForm" class="btn btn-primary">Submit</button>
                    <button type="reset" form="modalForm" class="btn btn-danger">Reset</button>
                </div>
            </div>
        </div>
    </div>
    <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">신규</button>
</div>
<%@include file="../include/right_side_info.jsp"%>