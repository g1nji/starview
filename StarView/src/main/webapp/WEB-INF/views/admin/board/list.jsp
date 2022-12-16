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

<h1>공지사항 리스트</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;"><input type="checkbox"> 전체선택</th>
		<th style="width: 20%;">작성자</th>
		<th style="width: 2%;">번호</th>
		<th style="width: 20%;">제목</th>
		<th style="width: 20%;">내용</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td><input type="checkbox"></td>
		<td>${b.uId }</td>
		<td>${b.noticeCode }</td>
		<td>${b.noticeTitle }</td>
		<td>${b.noticeContent }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />