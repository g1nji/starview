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
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
</div>

<c:import url="../layout/footer.jsp" />