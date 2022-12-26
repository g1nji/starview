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
		if(confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')) {
			document.location.href = "./delete?galleryNo=${viewBoard.galleryNo }"
		}
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
	<td rowspan="3" colspan="2">
		<img src='/prodFile/${prodFile.fileName }' style="width: 300px; height: 300px;" /><br>
	</td>
	<th class="info">상품명</th><td>${viewProd.gName}</td>
	<th class="info">상품 등록일</th><td><fmt:formatDate value="${viewProd.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	<tr>
	<th class="info">상품 가격</th><td>${viewProd.gPrice }</td>
	<th class="info">배송비</th><td>${viewProd.delPrice }</td>
	</tr>
	<tr>
	<th class="info">상품 설명</th><td colspan="3">${viewProd.gDetail }</td>
	</tr>
	<tr>
	</tr>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<!-- 아이디 추가 -->
	<button id="btnUpdate" class="btn btn-primary">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

<c:import url="../layout/footer.jsp" />