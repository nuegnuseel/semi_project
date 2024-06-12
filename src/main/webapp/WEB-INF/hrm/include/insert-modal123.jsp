<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .employee-card {
        border: 1px solid #ddd;
        padding: 10px;
    }
    .profile-container {
        display: flex;
    }
    .profile-details {
        flex: 1;
        margin-left: 20px;
    }
    .profile-details .form-row {
        display: flex;
        margin-bottom: 10px;
    }
    .profile-details .form-row .col {
        flex: 1;
        padding: 5px;
    }
    .reduce-gap {
        margin-bottom: 0.25rem; /* 기본 마진보다 작게 설정 */
    }

    .reduce-gap .col-form-label {
        margin-bottom: 0; /* 레이블 하단 마진 제거 */
    }

    .reduce-gap .col-sm-2, .reduce-gap .col-sm-4 {
        padding-left: 0.25rem; /* 왼쪽 패딩 줄이기 */
        padding-right: 0.25rem; /* 오른쪽 패딩 줄이기 */
    }
</style>
<div class="modal fade" id="staticBackdropViw" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">사원 카드 등록</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="employee-card">
                    <h1 class="text-center">사원 카드</h1>
                    <div class="profile-container">
                            <li class="nav-item">
                                <img src="../../../images/profile01.jpg">
                            </li>
                        <div class="profile-details">
                            <form action="../hrm/board" id="modalForm" method="post" enctype="multipart/form-data">
                                <div class="row mb-sm-1 reduce-gap">
                                    <label for="hireDate" class="col-sm col-form-label">입사일</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="hireDate" value="$hiredate" readonly>
                                    </div>
                                    <label for="birth" class="col-sm col-form-label">생일</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="birth" value="$birth" readonly>
                                    </div>
                                </div>
                                <div class="row mb-sm-1 reduce-gap">
                                    <label for="eName" class="col-sm col-form-label">성명</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="ename" value="$ename" readonly>
                                    </div>
                                    <label for="deptName" class="col-sm col-form-label">부서명</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="deptName" value="$deptname" readonly>
                                    </div>
                                </div>
                                <div class="row mb-sm-1 reduce-gap">
                                    <label for="email" class="col-sm col-form-label">Email</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="email" value="$email" readonly>
                                    </div>
                                    <label for="postcode" class="col-sm col-form-label">우편</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="postcode" value="$postcode" readonly>
                                    </div>
                                </div>
                                <div class="row mb-3-sm-1">
                                    <label for="long" class="col-sm-2 col-form-label">주소</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="long" value="address + address detail" readonly>
                                    </div>
                                </div>
                                <div class="row mb-sm-1 reduce-gap">
                                    <label for="mobile" class="col-sm col-form-label">전화</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="mobile" value="$mobile" readonly>
                                    </div>
                                    <label for="position" class="col-sm col-form-label">직급</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="position" value="$postion" readonly>
                                    </div>
                                </div>
                                <div class="row mb-sm-1 reduce-gap">
                                    <label for="passport" class="col-sm col-form-label">여권</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="passport" value="$passport" readonly>
                                    </div>
                                    <label for="role" class="col-sm col-form-label">직책</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="role" value="$role" readonly>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col-sm-12">
                                        <label for="remarks" class="form-label">비고</label>
                                        <textarea class="form-control" id="remarks" name="remarks" readonly>비고란</textarea>
                                    </div>
                                </div>
                                <div class="text-end mt-3">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">사원정보변경</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('profile').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('profileImagePreview').src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });
</script>
