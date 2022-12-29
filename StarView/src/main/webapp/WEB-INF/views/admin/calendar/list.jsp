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

<h1>추천일 조회</h1>
<hr>

<table class="table table-hover">
<thead>
	<tr class="warning">
		<th>지역</th>
		<th>날짜</th>
		<th>시간</th>
	</tr>
</thead>	
<tbody>
	<tr>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</tbody>
</table>

<c:import url="../layout/footer.jsp" />