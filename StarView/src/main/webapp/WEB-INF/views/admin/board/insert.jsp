<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnUpload").click(function() {
		
		$("form").submit();
	})
	
})

</script>

<h1>공지사항 업로드</h1>
<hr>

<!-- <form action="./insert" method="post"> -->
<form action="./insert" method="post" enctype="multipart/form-data">

<!-- <div class="form-group">
	<label for="noticeCode">번호</label>
	<input type="text" id="noticeCode" name="noticeCode" class="form-control">
</div> -->

<!-- 아이디 불러오도록 수정 -->
<!-- <div class="form-group">
	<label for="uId">작성자</label>
	<input type="text" id="uId" name="uId" class="form-control">
</div> -->

<div class="form-group">
	<label for="noticeTitle">제목</label>
	<input type="text" id="noticeTitle" name="noticeTitle" class="form-control">
</div>
<div class="form-group">
	<label for="noticeContent">내용</label>
	<textarea rows="10" style="width: 100%;" id="noticeContent" name="noticeContent"></textarea>
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpload">업로드</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="작성 취소">
</div>
</form>

<c:import url="../layout/footer.jsp" />