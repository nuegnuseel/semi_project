<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<%--attend 내용 영역--%>
<div class="content-area d-flex flex-column flex-shrink-0 position-relative col-12">
    <%--  제목 영역  --%>
    <div class="board-title">
        <h2 class="title">Attend list</h2>
    </div>
    <%--검색 영역--%>
    <div class="attend-content-area p-3 bg-body-tertiary">
        <form action="../attend/board" class="row d-flex align-items-center justify-content-start m-0">
            <div class="attend-search-area col-sm-5">
                <div class="row">
                    <div class="col">
                        <select class="form-select" aria-label="Default select example" name="search">
                            <option value="all" ${search eq "all" ? "selected": ""}>전체</option>
                            <option value="empNo" ${search eq "empno" ? "selected": ""}>사원번호</option>
                            <option value="aptNo" ${search eq "aptNo" ? "selected": ""}>근태번호</option>
                            <option value="ename" ${search eq "ename" ? "selected": ""}>사원명</option>
                            <option value="atdCode" ${search eq "atdCode" ? "selected": ""}>근태코드</option>
                        </select>
                    </div>
                    <div class="col w-auto">
                        <input type="text" name="searchWord" class="form-control" value="${searchWord}">
                    </div>
                    <div class="col-sm-3">
                        <button class="btn btn-primary w-100">SEARCH</button>
                    </div>
                </div>
            </div>
        </form>

        <%--attend list table--%>
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
                <th scope="col">삭제</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${attendList}" var="attendDto" varStatus="loop">
                <tr>
                    <td>${attendDto.empNo}</td>
                    <td class="updateModal">${attendDto.atdNo}</td>
                        <%--근태번호 수정키--%>
                    <td>${attendDto.ename}</td>
                    <td>${attendDto.atdCode}</td>
                    <td>${attendDto.atdNum}</td>
                    <td>${attendDto.atdDate}</td>
                    <td>${attendDto.offDay}</td>
                    <td>${attendDto.offDayRs}</td>
                    <td>${attendDto.print}</td>
                    <td>
                        <button type="button" class="attend-delete-button btn btn-danger" data-id="${attendDto.atdNo}">
                            삭제
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%--삽입 모달--%>
        <div class="modal fade" id="insertModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
             data-bs-backdrop="static"
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
                                    <input type="number" class="form-control" id="empNo" name="empNo">
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
                                <label for="newOffDay" class="col-sm-2 col-form-label">휴가명</label>
                                <div class="col-sm-10">
                                    <select class="form-select" id="newOffDay" name="offDay"
                                            onchange="updateNewAtdCode()">
                                        <option value="A01" data-offday="A01">연차</option>
                                        <option value="A02" data-offday="A02">반차</option>
                                        <option value="A03" data-offday="A03">병가</option>
                                        <option value="B01" data-offday="B01">경조사</option>
                                        <option value="C01" data-offday="C01">교육</option>
                                        <option value="C02" data-offday="C02">연수</option>
                                        <option value="C03" data-offday="C03">기타</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="newAtdCode" class="col-sm-2 col-form-label">근태코드</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="newAtdCode" name="atdCode" readonly>
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
                                    <input type="date" class="form-control" id="startAtdDate" name="startAtdDate"> ~
                                    <input type="date" class="form-control" id="endAtdDate" name="endAtdDate">
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
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" form="modalForm" class="btn btn-primary">Submit</button>
                        <button type="reset" form="modalForm" class="btn btn-danger">Reset</button>
                    </div>
                </div>
            </div>
        </div>

        <%--신규--%>
        <button class="btn btn-primary insert-btn" data-bs-target="#insertModalToggle" data-bs-toggle="modal">신규
        </button>
    </div>


</div>
<%--수정모달--%>
<!-- 수정 모달 -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">근태 정보 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editForm" action="/attend/update" method="post">
                    <input type="hidden" id="editEmpNo" name="empNo" value="">
                    <div class="mb-3">
                        <label for="editAtdno" class="form-label">근태번호</label>
                        <input type="text" class="form-control" id="editAtdno" name="atdNo" value="" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="editEname" class="form-label">사원명</label>
                        <input type="text" class="form-control" id="editEname" name="ename" value="" readonly>
                    </div>

                    <div class="mb-3">
                        <label for="editOffDay" class="col-sm-2 col-form-label">휴가명</label>
                        <select class="form-select" id="editOffDay" name="offDay">
                            <option value="연차" data-offday="A01">연차</option>
                            <option value="반차" data-offday="A02">반차</option>
                            <option value="병가" data-offday="A03">병가</option>
                            <option value="경조사" data-offday="B01">경조사</option>
                            <option value="교육" data-offday="C01">교육</option>
                            <option value="연수" data-offday="C02">연수</option>
                            <option value="기타" data-offday="C03">기타</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="editAtdCode" class="col-sm-2 col-form-label">근태코드</label>
                        <input type="text" class="form-control" id="editAtdCode" name="atdCode" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="editAtdNum" class="form-label">근태수</label>
                        <input type="number" class="form-control" id="editAtdNum" name="atdNum" value="" step="0.1">
                    </div>
                    <div class="mb-3">
                        <label class="col-sm-2 col-form-label">근태기간</label>
                        <div class="col-sm-10 col-auto">
                            <input type="date" class="form-control" id="editStartAtdDate" name="editStartAtdDate"> ~
                            <input type="date" class="form-control" id="editEndAtdDate" name="editEndAtdDate">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="editOffDayRs" class="form-label">휴가사유</label>
                        <input type="text" class="form-control" id="editOffDayRs" name="offDayRs" value="">
                    </div>
                    <div class="mb-3">
                        <label for="editPrint" class="form-label">인쇄</label>
                        <input type="text" class="form-control" id="editPrint" name="print" readonly value="">
                    </div>
                    <button type="submit" class="btn btn-primary" id="saveButton">저장</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // 수정 모달의 휴가명을 변경할 때 호출되는 함수
    $("#editOffDay").on("change", function () {
        const atdCodeInput = $("#editAtdCode");
        const selectedOffday = $(this).find("option:selected").data("offday");
        console.log("offDay===" + selectedOffday);
        atdCodeInput.val(selectedOffday);
    });


    function updateAtdCode(modalType) {
        const offDaySelect = $("#" + modalType + "OffDay");
        const atdCodeInput = $("#" + modalType + "AtdCode");
        const selectedOffday = offDaySelect.find("option:selected").data("offday"); // 수정: 올바른 방식으로 선택된 값 가져오기
        console.log("offDay===" + selectedOffday);
        atdCodeInput.val(selectedOffday);
    }

    function updateNewAtdCode() {
        const offDaySelect = $("#newOffDay");
        const atdCodeInput = $("#newAtdCode");
        const selectedOffday = offDaySelect.find("option:selected").data("offday"); // 수정: 올바른 방식으로 선택된 값 가져오기
        console.log("offDay===" + selectedOffday);
        atdCodeInput.val(selectedOffday);
    }

    // 문서가 준비되면 실행
    $(document).ready(function () {
        // 수정 모달 열기
        $(document).on("click", ".updateModal", function () {
            const selectName = $(this).text();
            $.ajax({
                url: "/attend/attendUpdateInfo",
                method: "POST",
                data: {ATDNO: selectName},
                success: function (response) {
                    console.log(response);  // 서버 응답 확인
                    $("#editEmpNo").val(response.empNo);
                    $("#editAtdno").val(response.atdNo);
                    $("#editEname").val(response.ename);
                    $("#editOffDay").val(response.offDay);
                    $("#editAtdNum").val(response.atdNum);
                    $("#editStartAtdDate").val(response.startAtdDate);
                    $("#editEndAtdDate").val(response.endAtdDate);
                    $("#editOffDayRs").val(response.offDayRs);
                    $("#editPrint").val(response.print);
                    console.log("startAtdDate===" + editStartAtdDate);
                    console.log("endAtdDate===" + editEndAtdDate);

                    // 휴가명과 근태코드를 설정
                    const offDaySelect = document.getElementById("editOffDay");
                    const atdCodeInput = document.getElementById("editAtdCode");

                    offDaySelect.value = response.atdCode; // 근태코드를 휴가명의 value로 설정
                    atdCodeInput.value = response.atdCode; // 근태코드를 직접 설정

                    // 모달 보여주기
                    $("#editModal").modal("show");
                },
                error: function () {
                    alert("데이터를 불러오는 중 오류가 발생했습니다.");
                }
            });
        });

        // 폼 제출 전에 휴가명 값을 근태코드로 복사
        $('#editForm').submit(function (e) {
            const atdCodeInput = $("#editAtdCode");
            const selectedOffday = $("#editOffDay").find("option:selected").data("offday");
            console.log("offDay===" + selectedOffday);
            atdCodeInput.val(selectedOffday);
            console.log("Form submitted with AtdCode:", atdCodeInput.val());
        });

        // 삽입 모달 폼 제출 전에 휴가명 값을 근태코드로 복사
        $('#modalForm').submit(function (e) {
            const atdCodeInput = $("#newAtdCode");
            const selectedOffday = $("#newOffDay").find("option:selected").data("offday");
            console.log("offDay===" + selectedOffday);
            atdCodeInput.val(selectedOffday);
            console.log("Form submitted with AtdCode:", atdCodeInput.val());
        });

        // 추가할 부분 시작
        $('#newOffDay').change(function () {
            var selectedText = $('#newOffDay option:selected').text();
            $('#displaySelectedText').text(selectedText);
            console.log("New OffDay selected:", selectedText);
        });
        // 추가할 부분 끝

        // 삭제 버튼 처리
        $(document).on("click", ".delete-button", function () {
            const atdNo = $(this).closest("tr").find(".updateModal").text();  // 근태번호 가져오기
            const row = $(this).closest("tr");

            if (confirm("정말로 삭제하시겠습니까?")) {
                $.ajax({
                    url: "/attend/delete",
                    method: "POST",
                    data: {atdNo: atdNo},
                    success: function (response) {
                        if (response.success) {
                            row.remove(); // 성공적으로 삭제되면 해당 행을 제거
                            alert("삭제되었습니다.");
                        } else {
                            alert("삭제에 실패했습니다.");
                        }
                    },
                    error: function () {
                        alert("삭제 중 오류가 발생했습니다.");
                    }
                });
            }
        });

        // 새로운 휴가명 변경 시 선택된 텍스트 표시
        $('#newOffDay').change(function () {
            var selectedText = $('#newOffDay option:selected').text();
            $('#displaySelectedText').text(selectedText);
        });
    });
    // 폼 전송 후 모달 데이터 초기화
    $('#editModal').on('hidden.bs.modal', function () {
        $(this).find('form')[0].reset();
    });

    $('#insertModalToggle').on('hidden.bs.modal', function () {
        $(this).find('form')[0].reset();
    });
    $(document).ready(function () {
        $("#modalForm").on('submit', function (event) {
            var empNo = $('#empNo').val();
            var atdNo = $('#atdNo').val();
            var ename = $('#ename').val();
            var atdCode = $('#atdCode').val();
            var atdNum = $('#atdNum').val();
            var atdDate = $('#atdDate').val();
            var offDay = $('#offDay').val();
            var offDayRs = $('#offDayRs').val();

            //사원번호를 입력하지 않은경우
            if (!empNo) {
                event.preventDefault();
                alert('사원번호를 입력해주세요.');
                $('#empNo').val('');
                $('#empNo').focus();
                return;
            }

            //근태번호를 입력하지 않은경우
            if (!atdNo) {
                event.preventDefault();
                alert('근태번호를 입력해주세요.');
                $('#atdNo').val('');
                $('#atdNo').focus();
                return;
            }

            //사원명을 입력하지 않은경우
            if (!ename) {
                event.preventDefault();
                alert('사원명을 입력해주세요.');
                $('#ename').val('');
                return;
            }

            //존재하지 않는 사원번호를 입력한 경우
            if (empNo && atdNo) {
                event.preventDefault();
                $.ajax({
                    url: '/attend/checkInsert',
                    type: 'POST',
                    data: {
                        empNo: empNo,
                        atdNo: atdNo
                    },
                    dataType: 'json',
                    async: false, // 동기식으로 처리
                    success: function (response) {
                        if (response !== 1) {
                            alert("존재하지 않는 사원번호이거나 중복된 근태번호입니다.")
                        } else {
                            $("#modalForm").unbind('submit').submit();
                        }
                    },
                    error: function () {
                        alert('서버와의 통신에 문제가 발생했습니다.');
                    }

                });
            }
        });
    });
</script>
