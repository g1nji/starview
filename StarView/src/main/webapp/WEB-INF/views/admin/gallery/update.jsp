<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<h1>게시글 수정</h1>
<hr>

<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="GalleryNo" value="${updateBoard.galleryNo }">

<div class="form-group">
	<label for="galleryTitle">제목</label>
	<input type="text" id="galleryTitle" name="galleryTitle" class="form-control" value="${updateBoard.galleryTitle }">
</div>

<div class="form-group">
	<label for="galleryContent">본문</label>
	<textarea rows="10" style="width: 100%;" id="galleryContent" name="galleryContent">${updateBoard.galleryContent }</textarea>
</div>

<div class="form-group">

	<div id="fileBox">
		파일 삭제 및 추가
	</div>

</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>
</form>

<c:import url="../layout/footer.jsp" />