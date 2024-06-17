<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-06-11
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="insertModal" data-bs-backdrop="static" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">인사카드등록</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../hrm/insert" id="modalForm" method="post" enctype="multipart/form-data">
                    <div class="row mt-3">
                        <div class="col">사원번호</div>
                        <div class="col col-md-4">
                            <input type="text" class="form-control is-valid" id="empNo" placeholder="사원번호"
                                   aria-label="empno" name="empNo"
                                   value="${maxEmpNo + 1}" readonly>
                        </div>
                        <div class="col">성명</div>
                        <div class="col col-md-4">
                            <input type="text" class="form-control is-invalid" id="ename" placeholder="이름"
                                   aria-label="ename" name="ename">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">생년월일</div>
                        <div class="col col-md-4">
                            <input type="date" class="form-control is-invalid" id="birthDate" aria-label="birthdate"
                                   name="birthDate">
                        </div>
                        <div class="col">영문성명</div>
                        <div class="col col-md-4">
                            <input type="text" class="form-control" id="foreignName" placeholder="영문이름"
                                   aria-label="foreignName"
                                   name="foreignName">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">휴대폰번호</div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <input type="text" class="form-control is-invalid" id="mobile" placeholder="휴대폰번호 중복체크넣을예정"
                                       aria-label="empno" name="mobile" aria-describedby="btn-mobile-duplicate">
                                <button class="btn btn-outline-secondary btn-duplicate" type="button" id="btn-mobile-duplicate">확인</button>
                            </div>
                        </div>
                        <div class="col">여권번호</div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="여권번호" aria-label="passport"
                                       name="passport" aria-describedby="btn-passport-duplicate" id="passport">
                                <button class="btn btn-outline-secondary btn-duplicate" type="button" id="btn-passport-duplicate">확인</button>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">Email</div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <input type="email" class="form-control is-invalid" id="email" placeholder="Email 중복체크넣을예정"
                                       aria-label="email" name="email" aria-describedby="btn-email-duplicate">
                                <button class="btn btn-outline-secondary btn-duplicate" type="button" id="btn-email-duplicate">확인</button>
                            </div>
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
                            <select class="form-select form-select" aria-label="select" name="roleName">
                                <option value="팀원">팀원</option>
                                <option value="팀장">팀장</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">입사일자</div>
                        <div class="col col-md-4">
                            <input type="date" class="form-control is-invalid" id="hireDate" aria-label="hiredate"
                                   name="hireDate">
                        </div>
                        <div class="col">입사구분</div>
                        <div class="col col-md-4">
                            <select class="form-select form-select" aria-label="hireType" name="hireType">
                                <option value="10">신입</option>
                                <option value="20">경력</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <label class="col-2">급여통장</label>
                        <div class="col-10">
                            <div class="input-group">
                                <span class="input-group-text" id="bankName">은행명</span>
                                <select class="form-select col-2" aria-label="은행명 선택" name="bankName">
                                    <option value="한국은행">한국은행</option>
                                    <option value="산업은행">산업은행</option>
                                    <option value="기업은행">기업은행</option>
                                    <option value="국민은행">국민은행</option>
                                    <option value="외환은행">외환은행</option>
                                    <option value="수협중앙회">수협중앙회</option>
                                    <option value="수출입은행">수출입은행</option>
                                    <option value="농협은행">농협은행</option>
                                    <option value="지역농.축협">지역농.축협</option>
                                    <option value="우리은행">우리은행</option>
                                </select>
                                <span class="input-group-text">통장번호</span>
                                <input type="text" class="form-control col-6 is-invalid" aria-label="account" name="account" id="account">
                                <span class="input-group-text">예금주</span>
                                <input type="text" class="form-control col-2" aria-label="accountHolder" name="accountHolder">
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <label for="postCode" class="col-md-2 col-form-label is-invalid">우편번호</label>
                        <div class="col-md-6">
                            <div class="input-group">
                                <input type="text" class="form-control postCode is-invalid" id="postCode" placeholder="우편번호" name="postCode" readonly>
                                <button type="button" class="btn btn-dark btn-post">우편번호 찾기</button>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <label for="address" class="col-md-2 col-form-label">주소</label>
                        <div class="col-10">
                            <input type="text" class="form-control address is-invalid" id="address" placeholder="주소"
                                   name="address" readonly>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <label for="detail-address" class="col-md-2 col-form-label">상세 주소</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control detail-address" id="detail-address"
                                   placeholder="상세주소" name="addressDetail">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <label for="profile" class="col-md-2 col-form-label">프로필사진</label>
                        <div class="col-md-7">
                            <input class="form-control" type="file" id="profile" name="profile"
                                   accept="image/jpg, image/png, image/gif">
                        </div>
                        <div class="col-md-4 preview" style="width: 170px; height: 170px; object-fit: contain">
                            <%--                        <div id="preview"></div>--%>
                            <img id="preview" src="../../../images/profile01.jpg">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <label for="remarks" class="col-md-2 col-form-label">비고</label>
                        <div class="col-md-10">
                            <textarea class="form-control" id="remarks" name="remarks">...</textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" form="modalForm" class="btn btn-primary" id="btn-insert">Submit</button>
                <button type="reset" form="modalForm" class="btn btn-danger">Reset</button>
            </div>
        </div>
    </div>
</div>

<script>

    let emailChecked = false;
    let mobileChecked = false;
    let passportChecked = true;

    $("#btn-insert").on("click", () => {
        /* 필수 입력 사항 체크 */
        if ($("#ename").val().trim() === "") {
            alert("성명은 필수입력 사항입니다.");
            $("#ename").focus();
            return false;
        }
        if ($("#mobile").val().trim() === "") {
            alert("휴대폰번호는 필수입력 사항입니다.");
            $("#mobile").focus();
            return false;
        }
        if ($("#email").val().trim() === "") {
            alert("Email은 필수입력 사항입니다.");
            $("#email").focus();
            return false;
        }
        // /* 아이디 중복 체크 */
        // if (!emailChecked) {
        //     alert("이메일 중복확인 필요")
        //     $("#email").focus();
        //     return false;
        // }
        // if (!mobileChecked) {
        //     alert("휴대폰번호 중복확인 필요")
        //     $("#mobile").focus();
        //     return false;
        // }
        // if (!passportChecked) {
        //     alert("아이디 중복 체크 ㄱㄱ")
        //     $("#passport").focus();
        //     return false;
        // }
    });

    // $(".btn-duplicate").on("click", function() {
    //     var inputId = $(this).prev().attr("id");
    //     var checkField;
    //     var checkValue = $("#" + inputId).val();
    //     var url = "../hrm/duplicate-check";
    //     var data = {};
    //
    //     switch (inputId) {
    //         case "email":
    //             if (emailChecked) {
    //                 return; // 이미 중복 확인을 완료한 경우, 추가 확인 방지
    //             }
    //             checkField = "email";
    //             data = { check: checkField, checkValue: checkValue };
    //             break;
    //         case "passport":
    //             if (passportChecked) {
    //                 return;
    //             }
    //             checkField = "passport";
    //             data = { check: checkField, checkValue: checkValue };
    //             break;
    //         case "mobile":
    //             if (mobileChecked) {
    //                 return;
    //             }
    //             checkField = "mobile";
    //             data = { check: checkField, checkValue: checkValue };
    //             break;
    //         default:
    //             console.error("Invalid input ID.");
    //             return;
    //     }
    //     console.log(data);
    //     $.ajax({
    //         url: url,
    //         data: data,
    //         method: "post",
    //         success: function(data) {
    //
    //             console.log(data)
    //             if (data.count === -1){
    //                 alert("중복 확인 해주세요");
    //                 $("#" + inputId).val("");
    //                 $("#" + inputId).focus();
    //                 return;
    //             }
    //             if (data.count > 0) {
    //                 alert("중복");
    //                 $("#" + inputId).val("");
    //                 $("#" + inputId).focus();
    //             } else {
    //                 const used = confirm("사용가능");
    //                 if (used) {
    //                     $("#" + inputId).attr("readonly", true);
    //                     switch (inputId) {
    //                         case "email":
    //                             emailChecked = true;
    //                             break;
    //                         case "passport":
    //                             passportChecked = true;
    //                             break;
    //                         case "mobile":
    //                             mobileChecked = true;
    //                             break;
    //                     }
    //                 } else {
    //                     $("#" + inputId).focus();
    //                 }
    //             }
    //         },
    //         error: function(xhr, status, error) {
    //             console.error("Error:", error);
    //             // 오류 처리
    //         }
    //     });
    // });



    $("#ename").on("keyup", function () {
        if ($(this).val() !== '') {
            $(this).removeClass('is-invalid');
        } else {
            $(this).addClass('is-invalid');
        }
    });
    $("#birthDate").on("keyup", function () {
        if ($(this).val() !== '') {
            $(this).removeClass('is-invalid');
        } else {
            $(this).addClass('is-invalid');
        }
    });
    $("#mobile").on("keyup", function () {
        if ($(this).val() !== '') {
            $(this).removeClass('is-invalid');
        } else {
            $(this).addClass('is-invalid');
        }
    });
    $("#email").on("keyup", function () {
        if ($(this).val() !== '') {
            $(this).removeClass('is-invalid');
        } else {
            $(this).addClass('is-invalid');
        }
    });
    $("#account").on("keyup", function () {
        if ($(this).val() !== '') {
            $(this).removeClass('is-invalid');
        } else {
            $(this).addClass('is-invalid');
        }
    });
    $("#postCode").on("input", function () {
        if ($(this).val() !== '') {
            $(this).removeClass('is-invalid');
        } else {
            $(this).addClass('is-invalid');
        }
    });
    $("#address").on("input", function () {
        if ($(this).val() !== '') {
            $(this).removeClass('is-invalid');
        } else {
            $(this).addClass('is-invalid');
        }
    });
    $("#passport").on("keyup", function () {
        if ($(this).val() !== '') {
            passportChecked = false;
        } else {
            passportChecked = true;
        }
    });
    $(document).ready(function () {
        // 오늘 날짜를 yyyy-mm-dd 형식으로 가져오기
        var today = new Date().toISOString().split('T')[0];

        // max 속성을 오늘 날짜로 설정
        $("#hireDate").attr('max', today);

        $("#hireDate").on("change", function () {
            if ($(this).val() !== '') {
                $(this).removeClass('is-invalid');
                $(".invalid-feedback").hide();
            } else {
                $(this).addClass('is-invalid');
                $(".invalid-feedback").show();
            }
        });
    });

    // var empNoInput = document.getElementById('empNo');
    // var submitBtn = document.getElementById('submitBtn');
    //
    // // 제출 버튼 클릭 시 유효성 검사
    // submitBtn.addEventListener('click', function (event) {
    //     if (empNoInput.value.trim() === '') {
    //         empNoInput.classList.add('is-invalid');
    //     } else {
    //         empNoInput.classList.remove('is-invalid');
    //     }
    // });
</script>