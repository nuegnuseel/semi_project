<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp" %>
<style>

</style>
<div class="content-area d-flex flex-column flex-shrink-0 position-relative col-12">
    <div class="board-title">
        <h2 class="title">근태 조회</h2>
    </div>
    <div class="attend-check-area d-flex col-12">
        <div class="attend-check-profile position-relative">
            <h2>프로필?</h2>
        </div>
        <div class="attend-check-info position-relative">
            <table>
                <tbody>
                <tr>
                    <td>이름</td>
                </tr>
                <tr>
                    <td>내용</td>
                </tr>
                <tr>
                    <td>내용</td>
                </tr>
                <tr>
                    <td>내용</td>
                </tr>
                <tr>
                    <td>내용</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="attend-check-search-area col-12">
        <div class="left-section col-2">
            <h2>검색</h2>
            <div class="d-flex">
                <input type="text" placeholder="ex)202406" id="attend-check-search-text" name="attendCheckSearchText">
                <input type="hidden"  id="attend-check-search-empNo" name="attendCheckEmpNo" value="1">
                <button id="attend-check-search-btn">검색</button>
            </div>
        </div>
        <div class="center-section col-8">
            <h1 class="sattend-check-calendar-date" id="attend-check-calendar-date">2024 06월 근태표</h1>
        </div>
    </div>
    <div class="attend-check-calendar-area d-flex">
        <table class="attend-check-calendar">
            <thead>
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
            </thead>
            <tbody id="calendar-body">
            <c:forEach items="${weekDates}" var="week">
                <tr>
                    <c:forEach items="${week}" var="day">
                        <td><c:if test="${day != 0}"><h5 class="calendar-day">${day}</h5></c:if></td>
                    </c:forEach>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <br><br><br>

    <div>
        <h3> 휴가 신청 내역 </h3>
    </div>
<%--신규 버튼--%>
    <button class="attend-check-Insert-btn btn btn-primary w-20" data-bs-target="#insertAttendCheckModal" data-bs-toggle="modal">휴가 신청</button>


    <div class="attend-check-request-list-area col-12">
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">사원번호</th>
                <th scope="col">근태번호</th>
                <th scope="col">사원명</th>
                <th scope="col">근태코드</th>
                <th scope="col">근태수</th>
                <th scope="col">근태기간</th>
                <th scope="col">휴가명</th>
                <th scope="col">휴가사유</th>
                <th scope="col">인쇄</th>
                <th scope="col">승인여부</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${attendList}" var="attendDto" varStatus="loop">
                <tr>
                    <td>${attendDto.empNo}</td>
                    <td>${attendDto.atdNo}</td> <%--근태번호 수정키--%>
                    <td>${attendDto.ename}</td>
                    <td>${attendDto.atdCode}</td>
                    <td>${attendDto.atdNum}</td>
                    <td>${attendDto.atdDate}</td>
                    <td>${attendDto.offDay}</td>
                    <td>${attendDto.offDayRs}</td>
                    <td>${attendDto.print}</td>
                    <td>${attendDto.approval}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <%--attend insert 모달--%>
    <div class="modal fade" id="insertAttendCheckModal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" data-bs-backdrop="static"
         tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalToggleLabel">휴가 신청</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <form action="../attend/check/insert" id="insertAttendCheck" method="post">
                        <div class="row mb-3">
                            <label for="insertEmpNo" class="col-sm-2 col-form-label">사원번호</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="insertEmpNo" name="insertEmpNo">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="atdNo" class="col-sm-2 col-form-label">근태번호</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="atdNo" name="atdNo">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="eName" class="col-sm-2 col-form-label">사원명</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="ename" name="ename">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="atdCode" class="col-sm-2 col-form-label">근태코드</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="atdCode" name="atdCode">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="atdNum" class="col-sm-2 col-form-label">근태수</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" id="atdNum" name="atdNum" step="0.1">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">근태기간</label>
                            <div class="col-sm-10 col-auto">
                                <input type="date" class="form-control" id="startAtdDate" name="startAtdDate"> ~ <input type="date" class="form-control" id="endAtdDate" name="endAtdDate">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="offDay" class="col-sm-2 col-form-label">휴가명</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="offDay" name="offDay">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="offDayRs" class="col-sm-2 col-form-label">휴가사유</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="offDayRs" name="offDayRs">
                            </div>
                        </div>

                        <legend class="col-form-label col-sm-2 pt-0">인쇄</legend>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="print" id="printY" value="Y" checked>
                            <label class="form-check-label" for="printY">
                                Y
                            </label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="print" id="printN" value="N">
                            <label class="form-check-label" for="printN">
                                N
                            </label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" form="insertAttendCheck" id="AttendInsertSubmitBtn" class="btn btn-primary">신청</button>
                    <button type="reset" form="insertAttendCheck" class="btn btn-danger">리셋</button>
                </div>
            </div>
        </div>
    </div>


</div>
<script>
    $(document).ready(function (){
        $("#attend-check-search-btn").on("click",function (){
            var searchValue = $("#attend-check-search-text").val();
            const attendCheckEmpNo = $("#attend-check-search-empNo").val();
            const attendCheckSearchText = $("#attend-check-search-text").val();
            var message = "";
            $.ajax({
                url:"/attend/check",
                method:"POST",
                data:{
                    empNo:attendCheckEmpNo,
                    accountingPeriod:attendCheckSearchText,
                },
                success:function (response){
                    var year = searchValue.substring(0, 4);
                    var month = searchValue.substring(4, 6);
                    $("#attend-check-calendar-date").text(year + " " + month + "월 근무표");

                    var calendarBody=$("#calendar-body");
                    var totalBody = $("#total-body");

                    calendarBody.empty();
                    totalBody.empty();

                    response.weekDates.forEach(function(week){
                        var weekRow = '<tr>';
                        week.forEach(function(day) {
                            if (day != 0) {
                                weekRow += '<td><h5 class="calendar-day">' + day + '</h5>바꿈</td>';
                            } else {
                                weekRow += '<td></td>';
                            }
                        });
                        weekRow += '</tr>';
                        calendarBody.append(weekRow);
                    })
                },
                error:function (){
                    message="검색값은 6자리 정수여야합니다. \n 예)202405"
                    $("#attend-check-search-text").val("");
                    $("#attend-check-search-text").focus();
                    alert(message)
                }
            })
        })
    })
</script>