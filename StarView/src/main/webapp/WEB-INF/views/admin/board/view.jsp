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
	<td class="info">글번호</td><td>${viewBoard.galleryNo }</td>
</tr>
<tr>
	<td class="info">작성자</td><td>${viewBoard.uId}</td>
</tr>
<tr>
	<td class="info">제목</td><td>${viewBoard.galleryTitle }</td>
</tr>
<tr>
	<td class="info">내용</td><td>${viewBoard.galleryContent }</td>
</tr>
<tr>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.galleryDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewBoard.galleryHit }</td>
</tr>
<tr>
	<td class="info">추천수</td><td>${viewBoard.galleryLike }</td>
</tr>
<tr>
	<td class="info">사진번호</td><td>${viewBoard.photoNo }</td>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
</div>

<c:import url="../layout/footer.jsp" />