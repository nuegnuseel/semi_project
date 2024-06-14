<%--
  Created by IntelliJ IDEA.
  User: JHTA
  Date: 2024-06-12
  Time: 오후 2:50
  To change this template use File | Settings | File Templates.
--%>
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
</style>

<div class="modal fade" id="viewModal" data-bs-backdrop="static" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">사원 카드</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="employee-card">
                    <h1 class="text-center">사원 카드</h1>
                    <div class="profile-container">
                        <li class="nav-item">
                            <img src="../../images/profile01.jpg">
                        </li>
                        <div class="profile-details">
                            <div class="row mb-sm-1 reduce-gap">
                                <label for="hireDate" class="col-sm col-form-label">입사일</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="hireDate" value="${hrmViewDto.hireDate}"
                                           readonly>
                                </div>
                                <label for="birth" class="col-sm col-form-label">생일</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="birth" value="생일없음" readonly>
                                </div>
                            </div>
                            <div class="row mb-sm-1 reduce-gap">
                                <label for="ename_view" class="col-sm col-form-label">성명</label>
                                <div class="col-sm-4">
<%--                                    <input type="text" class="form-control" id="ename" value="${hrmViewDto.ename}"--%>
<%--                                           readonly>--%>
                                    <input type="text" class="form-control" placeholder="사원 이름" aria-label="ename"
                                           readonly id="ename_view" name="ename_view" value="">
                                </div>
                                <label for="deptName_view" class="col-sm col-form-label">부서명</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="deptName_view"
                                           readonly>
                                </div>
                            </div>
                            <div class="row mb-sm-1 reduce-gap">
                                <label for="email_view" class="col-sm col-form-label">Email</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="email_view"
                                           readonly>
                                </div>
                                <label for="postCode_view" class="col-sm col-form-label">우편</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="postCode_view"
                                           readonly>
                                </div>
                            </div>
                            <div class="row mb-3-sm-1">
                                <label for="long" class="col-sm-2 col-form-label">주소</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="long"
                                           value="${hrmViewDto.address}" readonly>
                                </div>
                            </div>
                            <div class="row mb-sm-1 reduce-gap">
                                <label for="mobile" class="col-sm col-form-label">전화</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="mobile" value="${hrmViewDto.mobile}"
                                           readonly>
                                </div>
                                <label for="position" class="col-sm col-form-label">직급</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="position" value="${hrmViewDto.position}"
                                           readonly>
                                </div>
                            </div>
                            <div class="row mb-sm-1 reduce-gap">
                                <label for="passport" class="col-sm col-form-label">여권</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="passport" value="${hrmViewDto.passport}"
                                           readonly>
                                </div>
                                <label for="role" class="col-sm col-form-label">직책</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" id="role" value="${hrmViewDto.role}"
                                           readonly>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-sm-12">
                                    <label for="remarks" class="form-label">비고</label>
                                    <textarea class="form-control" id="remarks" name="remarks"
                                              value="${hrmViewDto.remarks}"
                                              readonly>비고란</textarea>
                                </div>
                            </div>
                            <div class="text-end mt-3">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">인쇄</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>