<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-06-10
  Time: 오전 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="../css/bootstrap.min.css" rel="stylesheet">
<script src="../js/bootstrap.bundle.min.js"></script>
<html>
<head>
    <title>Title</title>



</head>
<body>
<!-- Button trigger modal -->
<%--<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">--%>
<%--    Launch static backdrop modal--%>
<%--</button>--%>

<!-- Modal -->
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
                <h1 class="modal-title fs-5" id="staticBackdropLabel">급여정보입력</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>


            <div class="modal-body">
                <form action="../salary/insert" id="modalForm" method="post">
                    <div class="row">
                        <%-- form body --%>
                        <div class="col">대상 사원번호</div>
                        <div class="col col-md-4">
                            <input type="text" class="form-control" placeholder="00008" aria-label="empNo" name="empNo">


                        </div>
                    </div>
                    <div class="row">
                        <%-- form body --%>
                        <div class="col">근무 연월</div>
                        <div class="col col-md-4">
                            <input type="month" class="form-control" id="accountingPeriod" name="accountingPeriod">
                        </div>
                    </div>
                    <div class="row">
                        <%-- form body --%>
                        <div class="col">지급구분</div>
                        <div class="col col-md-4">
                            <select class="form-control" id="paymentType" name="salaryCategory">
                                <option value="지급구분 옵션1">지급구분 옵션 1</option>
                                <option value="지급구분 옵션2">지급구분 옵션 2</option>
                                <option value="지급구분 옵션3">지급구분 옵션 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <%-- form body --%>
                        <div class="col">급여구분</div>
                        <div class="col col-md-4">
                            <select class="form-control" id="paymentType02" name="salaryName">
                                <option value="급여구분 옵션 1">급여구분 옵션 1</option>
                                <option value="급여구분 옵션 2">급여구분 옵션 2</option>
                                <option value="급여구분 옵션 3">급여구분 옵션 3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <%-- form body --%>
                        <div class="col">지급날짜</div>
                        <div class="col col-md-4">
                            <input type="date" class="form-control" id="salaryDay" placeholder="select paymentDay"
                                   name="salaryDay">
                        </div>
                    </div>
                    <div class="row">
                        <%-- form body --%>
                        <div class="col">급여</div>
                        <div class="col col-md-4">
                            <input type="text" class="form-control" placeholder="00008" aria-label="salary"
                                   name="salary">
                        </div>
                    </div>
                    <div class="row">
                        <%-- form body --%>
                        <div class="col">기타 추가급여</div>
                        <div class="col col-md-4">
                            <input type="text" class="form-control" placeholder="00008" aria-label="bonus" name="bonus">
                        </div>
                    </div>

                    <div class="row">
                        <%-- form body --%>
                        <div class="col">급여 대장명칭</div>
                        <div class="col col-md-4">
                            <input type="text" class="form-control" placeholder="00008" aria-label="salaryInfo"
                                   name="salaryInfo">
                        </div>
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

<div class="modal fade" id="modal2" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">두번째 모달 창</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>모달 내용</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>








</body>
</html>
