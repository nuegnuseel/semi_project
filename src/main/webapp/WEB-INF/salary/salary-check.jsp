<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp" %>
<div class="content-area d-flex flex-column flex-shrink-0 position-relative col-12">
    <div class="board-title">
        <h2 class="title">급여 조회</h2>
    </div>
    <div class="salary-check-area d-flex col-12">
        <div class="salary-check-profile position-relative">
            <h2>프로필?</h2>
        </div>
        <div class="salary-check-info position-relative">
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
    <div class="salary-check-search-area col-12">
        <div class="left-section col-2">
            <h2>근무 시간표</h2>
            <div class="d-flex">
            <input type="text" placeholder="ex)202406" id="salary-check-search-text" name="salaryCheckSearchText">
            <input type="hidden"  id="salary-check-search-empNo" name="salaryCheckEmpNo" value="1">
            <button id="salary-check-search-btn">검색</button>
            </div>
        </div>
        <div class="center-section col-8">
            <h1 class="salary-check-calendar-date" id="salary-check-calendar-date">2024 06월 근무표</h1>
        </div>
    </div>
    <div class="salary-check-calendar-area d-flex">
        <table class="salary-check-calendar">
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
                        <td><c:if test="${day != 0}"><h5 class="calendar-day">${day}</h5>근무시간 <br>초과근무 시간</c:if></td>
                    </c:forEach>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="salary-check-calendar-total">
            <table>
                <thead>
                    <tr>
                        <th>기본근무시간</th>
                        <th>초과근무시간</th>
                    </tr>
                </thead>
                <tbody id="total-body">
                <c:forEach begin="1" end="${numberOfWeeks}" var="week" varStatus="loop">
                    <tr>
                        <td>0</td>
                        <td>0</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function (){
        $("#salary-check-search-btn").on("click",function (){
            var searchValue = $("#salary-check-search-text").val();
            const salaryCheckEmpNo = $("#salary-check-search-empNo").val();
            const salaryCheckSearchText = $("#salary-check-search-text").val();
            var message = "";
            $.ajax({
                url:"/salary/check",
                method:"POST",
                data:{
                    empNo:salaryCheckEmpNo,
                    accountingPeriod:salaryCheckSearchText,
                },
                success:function (response){
                    var year = searchValue.substring(0, 4);
                    var month = searchValue.substring(4, 6);
                    $("#salary-check-calendar-date").text(year + " " + month + "월 근무표");

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
                    for (var i = 1; i <= response.numberOfWeeks; i++) {
                        totalBody.append('<tr><td>0</td><td>0</td></tr>');
                    }
                },
                error:function (){
                    message="검색값은 6자리 정수여야합니다. \n 예)202405"
                    $("#salary-check-search-text").val("");
                    $("#salary-check-search-text").focus();
                    alert(message)
                }
            })

        })
    })
</script>
