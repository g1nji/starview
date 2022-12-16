<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "./list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "./update?gId=${viewProd.gId }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "./delete?gId=${viewProd.gId }"
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}
</style>

<h1>상품 상세 조회</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${viewProd.gId }</td>
</tr>
<tr>
	<td class="info">상품명</td><td>${viewProd.gName}</td>
</tr>
<tr>
	<td class="info">상품 가격</td><td>${viewProd.gPrice }</td>
</tr>
<tr>
	<td class="info">상품 설명</td><td>${viewProd.gDetail }</td>
</tr>
<tr>
	<td colspan="2">
		<div id="file">
			<div>
				<img src='/prodFile/${prodFile.fileName }' style="width: 200px; height: 200px;" /><br>
			</div>
		</div>
	</td>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<!-- 아이디 추가 -->
	<button id="btnUpdate" class="btn btn-primary">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

<c:import url="../layout/footer.jsp" />