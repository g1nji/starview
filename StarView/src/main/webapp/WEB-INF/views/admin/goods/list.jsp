<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>

<h1>상품 리뷰 게시글 리스트</h1>
<hr>

<select id="category" name="category" required onchange="window.open(value,'_self')">
    <option value="" disabled selected>카테고리</option>
    <option value="/admin/gallery/list">갤러리</option>
    <option value="/admin/goods/list">상품리뷰</option>
    <option value="/admin/place/list">명소후기</option>
</select>
<br><br>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;"><input type="checkbox"> 전체선택</th>
		<th style="width: 10%;">번호</th>
		<th style="width: 10%;">작성자</th>
		<th style="width: 10%;">제목</th>
		<th style="width: 20%;">내용</th>
		<th style="width: 20%;">등록일</th>
		<th style="width: 10%;">상품번호</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td><input type="checkbox"></td>
		<td>${b.rId}</td>
		<td>${b.uId }</td>
		<td><a href="./view?rId=${b.rId }">${b.rTitle }</a></td>
		<td>${b.rContent }</td>
		<td><fmt:formatDate value="${b.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td>${b.gId }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />