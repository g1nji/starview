<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<h1>게시글 수정</h1>
<hr>

<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="recomCode" value="${updateBoard.recomCode }">

<div class="form-group">
	<label for="recomLoc">지역</label>
	<input type="text" id="recomLoc" name="recomLoc" class="form-control" value="${updateBoard.recomLoc }">
</div>
<div class="form-group">
	<label for="recomDate">추천일</label>
	<input type="text" id="recomDate" name="recomDate" class="form-control" value="${updateBoard.recomDate }">
</div>
<div class="form-group">
	<label for="recomTime">추천 시간</label>
	<input type="text" id="recomTime" name="recomTime" class="form-control" value="${updateBoard.recomTime }">
</div>
<div class="form-group">
	<label for="rain">강수 확률</label>
	<input type="text" id="rain" name="rain" class="form-control" value="${updateBoard.rain }">
</div>
<div class="form-group">
	<label for="sky">기상 상태</label>
	<input type="text" id="sky" name="sky" class="form-control" value="${updateBoard.sky }">
</div>

<div class="text-center">
	<button id="update" class="btn btn-primary">수정</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="취소">
</div>
</form>

<c:import url="../layout/footer.jsp" />