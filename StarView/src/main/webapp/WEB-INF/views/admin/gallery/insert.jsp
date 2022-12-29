<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//게시글 업로드
	$("#btnUpload").click(function() {
		
		$("form").submit();
	})
	
	//게시글 리스트로 돌아가기
	$("#btnList").click(function() {
		location.href = "./list"
	})
	
})

</script>

<h1>사진 갤러리 업로드</h1>
<hr>

<!-- <form action="./insert" method="post"> -->
<form action="./insert" method="post" enctype="multipart/form-data">

<!-- <div class="form-group">
	<label for="galleryNo">번호</label>
	<input type="text" id="galleryNo" name="galleryNo" class="form-control">
</div> -->

<!-- <div class="form-group">
	<label for="cateCode">카테고리</label>
	<input type="text" id="cateCode" name="cateCode" class="form-control">
</div> -->

<!-- 아이디 불러오도록 수정 -->
<div class="form-group">
	<label for="uId">작성자</label>
	<input type="text" id="uId" name="uId" class="form-control">
</div>

<div class="form-group">
	<label for="galleryTitle">제목</label>
	<input type="text" id="galleryTitle" name="galleryTitle" class="form-control">
</div>
<div class="form-group">
	<label for="galleryContent">내용</label>
	<textarea rows="10" style="width: 100%;" id="galleryContent" name="galleryContent"></textarea>
</div>

<div class="form-group">
	<label for="galleryLoc">위치</label>
	<input type="text" id="galleryLoc" name="galleryLoc" class="form-control">
</div>

<div class="form-group">
	<label for="galleryTag">태그</label>
	<input type="text" id="galleryTag" name="galleryTag" class="form-control">
</div>

<div class="form-group">
	<label for="file">게시글 사진 첨부</label>
	 <input type="file" id="file" name="file">
</div>

<div class="text-center">
	<button class="btn btn-default btn-sm" id="btnList">목록</button>
	<button class="btn btn-primary btn-sm" id="btnUpload">업로드</button>
	<input type="reset" id="cancel" class="btn btn-danger btn-sm" value="작성 취소">
</div>
</form>

<c:import url="../layout/footer.jsp" />