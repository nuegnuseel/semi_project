<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp"%>
<div class="content-area d-flex flex-column flex-shrink-0 position-relative col-12">
    <div class="board-title">
        <h2 class="title">새로운 공지 등록</h2>
    </div>
    <div class="notice-content-area p-3 bg-body-tertiary">
        <%--새로운 공지 입력 폼--%>
            <form action="../notice/insert" id="noticeInsert" method="post">
                <div class="row mb-3">
                    <label for="title" class="col-sm-2 col-form-label">제목</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="title" name="title">
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="author" class="col-sm-2 col-form-label">작성자</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="author" name="author">
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="content" class="col-sm-2 col-form-label">내용</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" id="content" name="content" rows="30"></textarea>
                    </div>
                </div>

            </form>

            <button type="submit" form="noticeInsert" id="noticeInsertBtn" class="btn btn-primary justify-content-end">등록</button>
    </div>

</div>

<script>

</script>
