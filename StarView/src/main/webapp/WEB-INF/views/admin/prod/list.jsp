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

<h1>상품 리스트</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">상품 번호</th>
		<th style="width: 20%;">상품명</th>
		<th style="width: 20%;">상품 가격</th>
		<th style="width: 20%;">상품 설명</th>
		<th style="width: 10%;">배송비</th>
		<th style="width: 20%;">등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${prodList }" var="p">
	<tr>
		<td>${p.gId }</td>
		<td><a href="./view?gId=${p.gId }">${p.gName }</a></td>
		<td>${p.gPrice }</td>
		<td>${p.gDetail }</td>
		<td>${p.delPrice }</td>
		<td><fmt:formatDate value="${p.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />