<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<c:import url="../place/map.jsp"/>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8"/>
<title>star star star</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
})
	
</script>

</head>

<body>

<h1>명소 목록 조회</h1>

<table>
<thead>
<tr>
<!-- 	<th>번호</th> -->
	<th>명소</th>
</tr>	
</thead>

<tbody>
<c:forEach items="${starPlaceList }" var="StarPlace">

<tr>
<%-- 	<td>${StarPlace.arrivalNum }</td> --%>
	<td><a href="/place/view?arrivalNum=${StarPlace.arrivalNum }">${StarPlace.arrival }</a></td>
	<td><button id="roadmap" type="button" onclick="">길찾기</button></td>
	<td><button id="findplace" type="button" onclick="">편의시설 조회</button></td>
</tr>

</c:forEach>
</tbody>
</table>
	
	
</body>
</html>

<c:import url="../layout/footer.jsp" />