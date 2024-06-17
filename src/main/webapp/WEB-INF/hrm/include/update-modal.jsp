<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--수정 모달  수정 모달 수정 모달 수정 모달 수정 모달 수정 모달--%>
<div class="modal fade" id="modifyModal" aria-hidden="true" aria-labelledby="modifyModalToggleLabel"
     data-bs-backdrop="static"
     tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="modifyModalToggleLabel">사원 정보 수정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../hrm/update" id="modifyModalForm" method="post" enctype="multipart/form-data">
                    <%--                    <input type="text" hidden="hidden" id="salary_No_orig" name="salary_No_orig">--%>
                    <%--                    <input type="text" hidden="hidden" id="empNo_orig" name="empNo_orig">--%>
                    <%--                    <input type="text" hidden="hidden" id="ename_orig" name="ename_orig">--%>
                    <%--                    <input type="date" hidden="hidden" id="accountingPeriod_orig" name="accountingPeriod_orig">--%>
                    <%--                    <input type="text" hidden="hidden" id="paymentType_orig" name="salaryCategory_orig">--%>
                    <%--                    <input type="text" hidden="hidden" id="paymentType02_orig" name="salaryName_orig">--%>
                    <%--                    <input type="date" hidden="hidden" id="salaryDay_orig" name="salaryDay_orig">--%>
                    <%--                    <input type="text" hidden="hidden" id="salary_orig" name="salary_orig">--%>
                    <%--                    <input type="text" hidden="hidden" id="salaryInfo_orig" name="salaryInfo_orig">--%>

                    <div class="row mt-3">
                        <div class="col">사원번호</div>
                        <div class="col col-md-4">
                            <input type="text" id="empNo_update" class="form-control is-valid" placeholder="사원번호"
                                   aria-label="empno" name="empNo" readonly>

                        </div>
                        <div class="col">성명</div>
                        <div class="col col-md-4">
                            <input type="text" id="ename_update" class="form-control" placeholder="이름"
                                   aria-label="ename" name="ename">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">영문성명</div>
                        <div class="col col-md-4">
                            <input type="text" id="foreignName_update" class="form-control" placeholder="영문이름"
                                   aria-label="empno"
                                   name="foreignName">
                        </div>
                        <div class="col">부서</div>
                        <div class="col col-md-4">
                            <select class="form-select form-select" aria-label="select" name="deptNo">
                                <option value="10">부서코드:10 | 부서명:개발팀</option>
                                <option value="20">부서코드:20 | 부서명:기획팀</option>
                                <option value="30">부서코드:30 | 부서명:인사팀</option>
                                <option value="40">부서코드:40 | 부서명:회계팀</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">직위/직급</div>
                        <div class="col col-md-4">
                            <select class="form-select form-select" aria-label="select" name="positionNo">
                                <option value="10">직급코드:10 | 직급명:사원</option>
                                <option value="20">직급코드:20 | 직급명:대리</option>
                                <option value="30">직급코드:30 | 직급명:과장</option>
                                <option value="40">직급코드:40 | 직급명:차장</option>
                                <option value="50">직급코드:50 | 직급명:대표이사</option>
                            </select>
                        </div>
                        <div class="col">직책</div>
                        <div class="col col-md-4">
                            <select class="form-select form-select" aria-label="select" name="role">
                                <option value="팀원">직책 | 팀원</option>
                                <option value="팀장">직책 | 팀장</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">휴대폰번호</div>
                        <div class="col col-md-4">
                            <input type="text" id="mobile_update" class="form-control" placeholder="휴대폰번호"
                                   aria-label="empno"
                                   name="mobile" value="">
                        </div>
                        <div class="col">여권번호</div>
                        <div class="col col-md-4">
                            <input type="text" id="passport_update" class="form-control" placeholder="여권번호"
                                   aria-label="passport"
                                   name="passport">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">Email</div>
                        <div class="col col-md-4">
                            <input type="email" id="email_update" class="form-control" placeholder="Email"
                                   aria-label="email"
                                   name="email">
                        </div>
                        <div class="col">입사일자</div>
                        <div class="col col-md-4">
                            <input type="date" id="hireDate_update" class="form-control" aria-label="hiredate"
                                   name="hireDate">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">입사구분</div>
                        <div class="col col-md-4">
                            <select class="form-select form-select" id="hireType_update" aria-label="hireType"
                                    name="hireType" value="">
                                <option value="10">신입</option>
                                <option value="20">경력</option>
                            </select>
                        </div>
                        <div class="col">퇴사일자</div>
                        <div class="col col-md-4">
                            <input type="date" class="form-control" aria-label="resigndate" name="resignDate">
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
                            <select class="form-select form-select-sm" aria-label="bankname" name="bankName">
                                <option value="한국은행">은행명: 한국은행</option>
                                <option value="산업은행">은행명: 산업은행</option>
                                <option value="기업은행">은행명: 기업은행</option>
                                <option value="국민은행">은행명: 국민은행</option>
                                <option value="외환은행">은행명: 외환은행</option>
                                <option value="수협중앙회">은행명: 수협중앙회</option>
                                <option value="수출입은행">은행명: 수출입은행</option>
                                <option value="농협은행">은행명: 농협은행</option>
                                <option value="지역농.축협">은행명: 지역농.축협</option>
                                <option value="우리은행">은행명: 우리은행</option>
                            </select>
                            <span class="input-group-text">통장번호</span>
                            <input type="text" id="account_update" class="form-control"
                                   aria-label="Sizing example input"
                                   aria-describedby="inputGroup-sizing-sm" name="account"
                                   value="">
                            <span class="input-group-text">예금주</span>
                            <input type="text" id="accountHolder_update" class="form-control"
                                   aria-label="Sizing example input"
                                   aria-describedby="inputGroup-sizing-sm" name="accountHolder"
                                   value="">
                        </div>
                    </div>
                    <div class="row g-3 mt-3 mb-3">
                        <label for="postCode_update" class="form-label">POST CODE</label>
                        <div class="row">
                            <div class="col-auto"><input type="text" id="postCode_update" class="form-control postCode"
                                                         value=""
                                                         placeholder="post code"
                                                         name="postCode" readonly></div>
                            <div class="col-auto">
                                <button type="button" id="btn-postcode" class="btn btn-dark btn-post">우편번호 찾기</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <label for="address_update" class="form-label address">ADDRESS</label>
                        <input type="text" class="form-control address" id="address_update" placeholder="address" name="address"
                               value=""
                               readonly>
                    </div>
                    <div class="col-sm-6">
                        <label for="addressDetail_update" class="form-label detail-address">DETAIL ADDRESS</label>
                        <input type="text" class="form-control" id="addressDetail_update" placeholder="detail address"
                               value=""
                               name="addressDetail">
                    </div>
                    <div class="mb-3">
                        <label for="profile" class="form-label">PROFILE</label>
                        <input class="form-control" type="file" id="profile" name="profile"
                               value=""
                               accept="image/jpg, image/png, image/gif">
                    </div>
                    <div class="mb-3 preview" style="width: 38px; height: 38px; object-fit: contain">
                        <div id="preview"></div>
                    </div>
                    <div class="col-sm-12">
                        <label for="remarks_update" class="form-label">비고</label>
                        <textarea class="form-control" id="remarks_update" name="remarks"
                                  value="">...</textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                </button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" form="modifyModalForm" class="btn btn-primary" id="btn-update">수정</button>
            </div>
        </div>
    </div>
</div>

<script>
    $("#btn-update").on("click", () => {
        /* 필수 입력 사항 체크 */
        if ($("#ename_update").val().trim() === "") {
            alert("성명은 필수입력 사항입니다.");
            $("#ename_update").focus();
            return false;
        }
        if ($("#mobile_update").val().trim() === "") {
            alert("휴대폰번호는 필수입력 사항입니다.");
            $("#mobile_update").focus();
            return false;
        }
        if ($("#email_update").val().trim() === "") {
            alert("Email은 필수입력 사항입니다.");
            $("#email_update").focus();
            return false;
        }
        // /* 중복 체크 */
        // if (!isIdChecked) {
        //     alert(" 중복 체크 ㄱㄱ")
        //     $("#userID").focus();
        //     return false;
        // }
    });


    $("#ename_update").on("keyup", function () {
        if ($(this).val() === '') {
            $(this).addClass('is-invalid');
        } else {
            $(this).removeClass('is-invalid');
        }
    });
    $("#mobile_update").on("keyup", function () {
        if ($(this).val() === '') {
            $(this).addClass('is-invalid');
        } else {
            $(this).removeClass('is-invalid');
        }
    });
    $("#email_update").on("keyup", function () {
        if ($(this).val() === '') {
            $(this).addClass('is-invalid');
        } else {
            $(this).removeClass('is-invalid');
        }
    });
</script>