<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-06-11
  Time: 오후 5:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="../hrm/delete" method="post">
    <div class="col-sm-6">
        <label for="empNo" class="form-label">사원번호 : ${hrmDeleteDto.empNo} 삭제</label>
        <input type="text" class="form-control" id="empNo" placeholder="사원 삭제하려면 사원번호 재입력" name="empNo">
        <input type="hidden" name="targetEmpNo" value="${hrmDeleteDto.empNo}">
    </div>
</form>