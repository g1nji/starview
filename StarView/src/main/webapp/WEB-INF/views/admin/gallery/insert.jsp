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

<h1>게시글(공지사항?) 업로드</h1>
<hr>

<!-- <form action="./insert" method="post"> -->
<form action="./insert" method="post" enctype="multipart/form-data">

<!-- <div class="form-group">
	<label for="gId">상품번호</label>
	<input type="text" id="gId" name="gId" class="form-control">
</div> -->

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
	<button class="btn btn-primary" id="btnUpload">업로드</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="작성 취소">
</div>
</form>


<c:import url="../layout/footer.jsp" />