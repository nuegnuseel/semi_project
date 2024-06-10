<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>JSP - Hello World</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container">
    <table class="table">
        <thead>
        <tr>
            <%-- 10개 --%>
            <th scope="col"><input type="checkbox" id="check-all"></th>
            <th scope="col">입사일자</th>
            <th scope="col">사원번호</th>
            <th scope="col">성명</th>
            <th scope="col">부서번호(명)</th>
            <th scope="col">직위/직급명</th>
            <th scope="col">Email</th>
            <th scope="col">계좌번호</th>
            <th scope="col">새로운 항목 추가???</th>
            <th scope="col">인쇄</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <%--            <c:forEach items="${hrmList}" var="hrmDto" varStatus="loop">--%>
            <%--                <td scope="row"><input type="checkbox">${loop.count}</td>--%>
            <%--                <td>${hrmList.hireDate}</td>--%>
            <%--                <td><a href="">${hrmList.empNo}</a></td>--%>
            <%--                <td><a href="">${hrmList.eName}</a></td>--%>
            <%--                <td>${deptDto.deptName}</td>--%>
            <%--                <td>${hrmList.직위/직급명}</td>--%>
            <%--                <td>${hrmList.email}</td>--%>
            <%--                <td>${hrmList.account}</td>--%>
            <%--                <td><textarea></textarea></td>--%>
            <%--                <td><a href="">인쇄</a> </td>--%>
            <%--            </c:forEach>--%>
            <td><input type="checkbox"></td>
            <td>입사일자</td>
            <td><a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop">사원번호</a></td>
            <td><a href="#" data-bs-toggle="modal" data-bs-target="#staticBackdrop">성명</a></td>
            <td>부서명</td>
            <td>직위/직급명</td>
            <td>Email</td>
            <td>계좌번호</td>
            <td>새로운 항목 추가???</td>
            <td>인쇄</td>
        </tr>
        </tbody>
    </table>

    <!-- Scrollable modal -->
    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary" style="width: 100px" data-bs-toggle="modal"
            data-bs-target="#staticBackdrop">신규
    </button>
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
         tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">인사카드등록</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/url" id="modalForm" method="post" enctype="multipart/form-data">
                        <div class="row mt-3">
                            <div class="col">사원번호</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="00008" aria-label="empno" name>
                            </div>
                            <div class="col">성명</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="Name" aria-label="name">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">영문성명</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="00008" aria-label="empno">
                            </div>
                            <div class="col">부서번호</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="부서코드" aria-label="deptno">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">직위/직급</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="" aria-label="">
                            </div>
                            <div class="col">직책</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="" aria-label="">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">휴대폰번호</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="00008" aria-label="empno">
                            </div>
                            <div class="col">여권번호</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="Name" aria-label="name">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">Email</div>
                            <div class="col col-md-4">
                                <input type="email" class="form-control" placeholder="" aria-label="">
                            </div>
                            <div class="col">입사일자</div>
                            <div class="col col-md-4">
                                <input type="date" class="form-control" placeholder="" aria-label="">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">입사구분</div>
                            <div class="col col-md-4">
                                <input type="text" class="form-control" placeholder="" aria-label="">
                            </div>
                            <div class="col">퇴사일자</div>
                            <div class="col col-md-4">
                                <input type="date" class="form-control" placeholder="" aria-label="">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col">퇴사사유</div>
                            <div class="col col-md-10">
                                <input type="text" class="form-control" placeholder="" aria-label="">
                            </div>
                        </div>
                        <div class="row mt-3">
                            <label for="bankAccount" class="form-label">급여통장</label>
                            <div class="input-group input-group-sm mb-3">
                                <span class="input-group-text" name="bankAccount" id="bankAccount">은행명</span>
                                <input type="text" class="form-control" aria-label="Sizing example input"
                                       aria-describedby="inputGroup-sizing-sm">
                                <span class="input-group-text">통장번호</span>
                                <input type="text" class="form-control" aria-label="Sizing example input"
                                       aria-describedby="inputGroup-sizing-sm">
                                <span class="input-group-text">예금주</span>
                                <input type="text" class="form-control" aria-label="Sizing example input"
                                       aria-describedby="inputGroup-sizing-sm">
                            </div>
                        </div>
                        <div class="row g-3 mt-3 mb-3">
                            <label for="postCode" class="form-label">POST CODE</label>
                            <div class="row">
                                <div class="col-auto"><input type="text" class="form-control" id="postCode"
                                                             placeholder="post code"
                                                             name="postCode" readonly></div>
                                <div class="col-auto">
                                    <button type="button" id="btn-postcode" class="btn btn-dark">우편번호 찾기</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <label for="address" class="form-label">ADDRESS</label>
                            <input type="text" class="form-control" id="address" placeholder="address" name="address"
                                   readonly>
                        </div>
                        <div class="col-sm-6">
                            <label for="detail-address" class="form-label">DETAIL ADDRESS</label>
                            <input type="text" class="form-control" id="detail-address" placeholder="detail address"
                                   name="addressDetail">
                        </div>
                        <div class="mb-3">
                            <label for="profile" class="form-label">PROFILE</label>
                            <input class="form-control" type="file" id="profile" name="profile"
                                   accept="image/jpg, image/png, image/gif">
                        </div>
                        <div class="mb-3 preview">
                            <div id="preview">프로필 미리보기</div>
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
</div>
</body>
</html>

<script>
    /* postcode 버튼 눌러서 주소 팝업창 불러옴 */
    $("#btn-postcode").on("click", makePostCode);
    // $("#btn-postcode").on("click", ()=>{ // 위에걸로 줄여쓸 수 있음
    //     makePostCode();
    // })

    function makePostCode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ""; // 주소 변수
                let extraAddr = ""; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    $("#extra-address").val(extraAddr);

                } else {
                    $("#extra-address").val("");
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $("#postCode").val(data.zonecode);
                $("#address").val(addr);

                // 커서를 상세주소 필드로 이동한다.
                $("#detail-address").focus();
            }
        }).open()({});
    }
</script>