<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .employee-card {
        border: 1px solid #ddd;
        padding: 20px;
    }
    .profile-container {
        display: flex;
    }
    .profile-upload {
        flex: 0 0 200px;
        text-align: center;
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
    .preview img {
        max-width: 100%;
        max-height: 100%;
        display: block;
    }
    .profile-upload-text {
        margin-top: 10px;
        font-size: 14px;
        color: #777;
    }
</style>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
                        <div class="profile-upload">
                            <img id="profileImagePreview" src="../../../images/profile01.jpg" alt="Profile Image" style="width: 100%; height: auto; border: 1px solid #ddd;">
                            <input type="file" id="profile" name="profile" accept="image/jpg, image/png, image/gif" class="form-control mt-2">
                            <div class="profile-upload-text">업로드할 이미지를 선택해주세요</div>
                        </div>
                        <div class="profile-details">
                            <form action="../hrm/board" id="modalForm" method="post" enctype="multipart/form-data">
                                <div class="form-row">
                                    <div class="col">입사일자</div>
                                    <div class="col"><input type="date" class="form-control" name="hireDate"></div>
                                    <div class="col">주민등록번호</div>
                                    <div class="col"><input type="text" class="form-control" name="idNumber"></div>
                                </div>
                                <div class="form-row">
                                    <div class="col">성명</div>
                                    <div class="col"><input type="text" class="form-control" name="eName"></div>
                                    <div class="col">부서</div>
                                    <div class="col">
                                        <select class="form-select" name="deptNo">
                                            <option value="10">회계팀</option>
                                            <option value="20">기획팀</option>
                                            <option value="30">인사팀</option>
                                            <option value="40">개발팀</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col">Email</div>
                                    <div class="col"><input type="email" class="form-control" name="email"></div>
                                    <div class="col">생년월일</div>
                                    <div class="col"><input type="date" class="form-control" name="birthDate"></div>
                                </div>
                                <div class="form-row">
                                    <div class="col">주소</div>
                                    <div class="col"><input type="text" class="form-control" name="address"></div>
                                    <div class="col">전화</div>
                                    <div class="col"><input type="text" class="form-control" name="phone"></div>
                                </div>
                                <div class="form-row">
                                    <div class="col">직위/직급</div>
                                    <div class="col">
                                        <select class="form-select" name="positionNo">
                                            <option value="10">사원</option>
                                            <option value="20">대리</option>
                                            <option value="30">과장</option>
                                            <option value="40">차장</option>
                                            <option value="50">대표이사</option>
                                        </select>
                                    </div>
                                    <div class="col">직책</div>
                                    <div class="col">
                                        <select class="form-select" name="role">
                                            <option value="팀원">팀원</option>
                                            <option value="팀장">팀장</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="col">연락처</div>
                                    <div class="col"><input type="text" class="form-control" name="contact"></div>
                                </div>
                                <div class="form-row">
                                    <div class="col">병역구분</div>
                                    <div class="col"><input type="text" class="form-control" name="militaryStatus"></div>
                                    <div class="col">군별</div>
                                    <div class="col"><input type="text" class="form-control" name="militaryBranch"></div>
                                    <div class="col">미필사유</div>
                                    <div class="col"><input type="text" class="form-control" name="militaryExemption"></div>
                                    <div class="col">계급</div>
                                    <div class="col"><input type="text" class="form-control" name="militaryRank"></div>
                                </div>
                                <div class="form-row">
                                    <div class="col">추천인</div>
                                    <div class="col"><input type="text" class="form-control" name="referrerName"></div>
                                    <div class="col">회사</div>
                                    <div class="col"><input type="text" class="form-control" name="referrerCompany"></div>
                                    <div class="col">관계</div>
                                    <div class="col"><input type="text" class="form-control" name="referrerRelation"></div>
                                    <div class="col">연락처</div>
                                    <div class="col"><input type="text" class="form-control" name="referrerContact"></div>
                                </div>
                                <div class="form-row">
                                    <div class="col-sm-12">
                                        <label for="remarks" class="form-label">비고</label>
                                        <textarea class="form-control" id="remarks" name="remarks">...</textarea>
                                    </div>
                                </div>
                                <div class="text-end mt-3">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                    <button type="reset" class="btn btn-danger">Reset</button>
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
