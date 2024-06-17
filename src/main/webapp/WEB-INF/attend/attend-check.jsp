<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp" %>
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
    <div class="attend-check-request-list-area col-12">
        <h2>내용</h2>
        <h2>내용</h2>
        <h2>내용</h2>
        <h2>내용</h2>
        <h2>내용</h2>
        <h2>내용</h2>
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
                                weekRow += '<td><h5 class="calendar-day">' + day + '</h5>근무시간</td>';
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