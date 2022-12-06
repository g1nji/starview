
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

<h1>상품 업로드</h1>
<hr>

<!-- <form action="./insert" method="post"> -->
<form action="./insert" method="post" enctype="multipart/form-data">

<!-- <div class="form-group">
	<label for="gId">상품번호</label>
	<input type="text" id="gId" name="gId" class="form-control">
</div> -->

<div class="form-group">
	<label for="gName">상품명</label>
	<input type="text" id="gName" name="gName" class="form-control">
</div>
<div class="form-group">
	<label for="gPrice">상품 가격</label>
	<input type="text" id="gPrice" name="gPrice" class="form-control">
</div>

<div class="form-group">
	<label for="gDetail">상품 내용</label>
	<textarea rows="10" style="width: 100%;" id="gDetail" name="gDetail"></textarea>
</div>

<div class="form-group">
	<label for="file">상품 이미지 첨부</label>
	 <input type="file" id="file" name="file">
</div>

<div class="text-center">
	<button class="btn btn-primary" id="btnUpload">업로드</button>
	<input type="reset" id="cancel" class="btn btn-danger" value="작성 취소">
</div>
</form>


<c:import url="../layout/footer.jsp" />