<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>


<div class="content-area d-flex flex-column flex-shrink-0 position-relative col-12">
    <%--     style="width: calc(100% - 520px);">--%>
    <div class="board-title"><h2 class="title">출퇴근 list</h2></div>

    <div class="attend-content-area p-3 bg-body-tertiary">
<%--        <form id="myForm" action="../workSchedule/empWorkBoard" method="post">--%>
<%--            <button id="workRecord" class="btn btn-primary">출/퇴근</button>--%>
<%--        </form>--%>


        <%--보드--%>
        <table class="table table-striped">
            <thead>
            <tr>

                <th scope="col">날짜</th>
                <th scope="col">사원번호</th>
                <th scope="col">부  서</th>
                <th scope="col">사원 이름</th>
                <th scope="col">출근 시간</th>
                <th scope="col">퇴근 시간</th>
                <th scope="col">상태</th>
                <th scope="col">수정/삭제</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${adminWorkList}" var="adminWorkDto" varStatus="loop">
                <tr>
                    <td>${adminWorkDto.workDate}</td>
                    <td>${adminWorkDto.empNo}</td>
                    <td>${adminWorkDto.deptName}</td>
                    <td>${adminWorkDto.ename}</td>
                    <td>${adminWorkDto.startTime}</td>
                    <td>${adminWorkDto.endTime}</td>
                    <td>${adminWorkDto.status}</td>
                    <td><button type="button" class="btn btn-primary">수정</button>
                        <button type="button" class="btn btn-danger">삭제</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var workRecordBtn = document.getElementById('workRecord');
            var form = document.getElementById('myForm');

            workRecordBtn.addEventListener('click', function (event) {
                // 현재 시각 가져오기
                var today = new Date();
                var hours = String(today.getHours()).padStart(2, '0');
                var minutes = String(today.getMinutes()).padStart(2, '0');
                var formattedTime = hours + ':' + minutes;

                // 팝업 창 띄우기
                var confirmRecord = confirm('현재시각: ' + formattedTime + '\n기록하시겠습니까?');

                // 확인 버튼을 눌렀을 때
                if (confirmRecord) {


                    form.submit();
                } else {
                    // 취소 버튼을 눌렀을 때
                    event.preventDefault(); // 기본 동작 (submit) 막기
                    console.log('기록 취소');
                }
            });
        });
    </script>


