<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp" %>
<%@include file="../include/left_side_menu.jsp" %>
<div class="container content-area d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary position-absolute top-0 col-8">
    <table class="table table-sm">
        <thead>
        <tr>
            <%-- 9개 --%>
            <th scope="col">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="check-all">
                    <label class="form-check-label" for="check-all"></label>
                </div>
            </th>
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
        <c:forEach items="${hrmList}" var="hrmDto" varStatus="loop">
            <c:choose>
                <%-- 현재 주소창에 '?page=' param이 없을시 page=1로 설정 --%>
                <c:when test="${param.page == null}"><c:set var="page" value="1"></c:set></c:when>
                <c:otherwise><c:set var="page" value="${param.page}"></c:set></c:otherwise>
            </c:choose>
            <tr>
                <td>
                    <div class="form-check form-check-inline">
                        <input class="chk form-check-input" type="checkbox" id="${loop.count}" value="option1">
                        <label class="chk form-check-label"
                               for="${loop.count}">${((page -1) * listPerPage) + loop.count}</label>
                    </div>
                </td>

                    <%--                <td><input type="checkbox" class="chk btn-check" id="btn-check-${loop.count}" autocomplete="off">--%>
                    <%--                    <label class="btn btn-outline-secondary"--%>
                    <%--                           for="btn-check-${loop.count}">${((page -1) * listPerPage) + loop.count}</label></td>--%>
                <td>${hrmDto.hireDate}</td>
                <td><a href="">${hrmDto.empNo}</a></td>
                <td><a href="">${hrmDto.EName}</a></td>
                <td>${hrmDto.deptName}</td>
                <td>${hrmDto.position}</td>
                <td>${hrmDto.email}</td>
                <td>${hrmDto.account}</td>
                <td><input type="text" value="일단빈칸"></td>
                <td><a href="">인쇄</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <c:choose>
            <c:when test="${empty search}">
                <c:set var="firstPage" value="../hrm/board?page=1"></c:set>
                <c:set var="prePage" value="../hrm/board?page=${previousPage}"></c:set>
                <c:set var="selectPage" value="../hrm/board?page="></c:set>
                <c:set var="nextPage" value="../hrm/board?page=${nextPage}"></c:set>
                <c:set var="lastPage" value="../hrm/board?page=${totalPage}"></c:set>
            </c:when>
            <c:otherwise>
                <c:set var="firstPage" value="../hrm/board?search=${search}&searchWord=${searchWord}&page=1"></c:set>
                <c:set var="prePage"
                       value="../hrm/board?search=${search}&searchWord=${searchWord}&page=${previousPage}"></c:set>
                <c:set var="selectPage" value="../hrm/board?search=${search}&searchWord=${searchWord}&page="></c:set>
                <c:set var="nextPage"
                       value="../hrm/board?search=${search}&searchWord=${searchWord}&page=${nextPage}"></c:set>
                <c:set var="lastPage"
                       value="../hrm/board?search=${search}&searchWord=${searchWord}&page=${totalPage}"></c:set>
            </c:otherwise>
        </c:choose>
        <nav aria-label="Page navigation example" class="mt-5 mb-5">
            <ul class="pagination d-flex justify-content-center">
                <c:if test="${startPage ne 1}">
                    <li class="page-item">
                        <a class="page-link" href="${firstPage}" aria-label="Previous">
                            First
                        </a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="${prePage}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
                    <c:choose>
                        <c:when test="${page eq i}">
                            <li class="page-item active"><span class="page-link">${i}</span></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="${selectPage}${i}">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${endPage ne totalPage}">
                    <li class="page-item">
                        <a class="page-link" href="${nextPage}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="${lastPage}" aria-label="Next">
                            Last
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
        <form action="../hrm/board" class="row g-3 d-flex align-items-center">
            <div class="col-sm-7">
                <div class="row g-3">
                    <div class="col">
                        <select class="form-select" aria-label="Default select example" name="search">
                            <option value="empno" ${search eq "empno" ? "selected": ""}>사원번호</option>
                            <option value="ename" ${search eq "ename" ? "selected": ""}>사원명</option>
                            <option value="deptname" ${search eq "deptname" ? "selected": ""}>부서명</option>
                            <option value="email" ${search eq "email" ? "selected": ""}>이메일</option>
                            <option value="all" ${search eq "all" ? "selected": ""}>all</option>
                        </select>
                    </div>
                    <div class="col w-auto">
                        <input type="text" name="searchWord" class="form-control" value="${searchWord}">
                    </div>
                </div>
            </div>
            <div class="col-sm-3">
                <button class="btn btn-primary w-100">SEARCH</button>
            </div>
        </form>

        <!-- Scrollable modal -->
        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" style="width: 100px" data-bs-toggle="modal"
                data-bs-target="#staticBackdrop">신규
        </button>
    </div>
    <!-- Modal -->
    <jsp:include page="include/insert-modal123.jsp" flush="true"/>
    <%--                <form action="../hrm/board-update" method="post" enctype="multipart/form-data">--%>
    <%--                    <input type="hidden" value="${hrmDto.empNo}" name="empNo">--%>
    <%--                </form>--%>
</div>
</div>
<script>
    $("#check-all").on("change", function () {

        //  is(":checked") - 제이쿼리에서 체크박스 감지할때 씀
        if ($(this).is(":checked")) {
            $(".chk").prop("checked", true);
            // while문 안의 checkbox들 class명으로 접근
        } else {
            $(".chk").prop("checked", false);
        }
    })

    $("#profile").on("change", function (e) {
        const file = e.currentTarget.files[0];
        if (!file) { // 파일이 선택되지 않은 경우 (지운 경우)
            $("#preview").html(""); // 미리보기 영역 비우기
            return false;
        }
        const extension = file.name.substring(file.name.lastIndexOf(".") + 1).toLowerCase(); // +1 안하면 .png, +1 하면 png 나옴
        console.log(file);
        if (!(extension === "png" || extension === "jpg" || extension === "gif")) {
            alert("이미지 파일만 업로드 가능합니다.");
            $(this).val("");
            return false;
        } else {
            const profileReader = new FileReader();
            profileReader.onload = function (e) {
                console.log(e)
                // currentTarget or target에의 result 가 image임
                const img = e.currentTarget.result;
                /* jsp의 자바스크립트에서 달러{} 을 쓰려면 $앞에 \를 넣어줘야함 = \$ {} */
                $("#preview").html(`<img src="\${img}">`)
            }
            profileReader.readAsDataURL(file);
        }
    })

    /* postcode 버튼 눌러서 주소 팝업창 불러옴 */
    $("#btn-postcode").on("click", makePostCode);

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
<%@include file="../include/right_side_info.jsp" %>