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
            <tbody>
            <c:forEach items="${weekDates}" var="week">
                <tr>
                    <c:forEach items="${week}" var="day">
                        <td><c:if test="${day != 0}">${day}</c:if></td>
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
                <tbody>
                <c:forEach begin="1" end="${numberOfWeeks}" var="week" varStatus="loop">
                    <tr>
                        <td>${loop.index}주차 기본 근무시간</td>
                        <td>${loop.index}주차 초과 근무시간</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
