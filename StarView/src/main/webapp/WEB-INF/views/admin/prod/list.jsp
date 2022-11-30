<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>상품 리스트</h1>
<hr>

<table>
<thead>
	<tr>
		<th>상품 번호</th>
		<th>상품명</th>
		<th>상품 가격</th>
		<th>상품 설명</th>
		<th>배송비</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${prodList }" var="p">
	<tr>
		<td>${p.gId }</td>
		<td>${p.gName }</td>
		<td>${p.gPrice }</td>
		<td>${p.gDetail }</td>
		<td>${p.delPrice }</td>
		<td><fmt:formatDate value="${p.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

</body>
</html>