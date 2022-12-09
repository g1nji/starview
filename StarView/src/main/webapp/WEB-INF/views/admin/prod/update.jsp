<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<h1>상품 수정</h1>
<hr>

<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="gId" value="${updateProd.gId }">

<div class="form-group">
	<label for="gName">상품명</label>
	<input type="text" id="gName" name="gName" class="form-control" value="${updateProd.gName }">
</div>

<div class="form-group">
	<label for="gPrice">상품 가격</label>
	<input type="text" id="gPrice" name="gPrice" class="form-control" value="${updateProd.gPrice }">
</div>
	
<div class="form-group">
	<label for="gDetail">상품 설명</label>	
	<textarea rows="10" style="width: 100%;" id="gDetail" name="gDetail">${updateProd.gDetail}</textarea>
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