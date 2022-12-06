<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

</script>

</head>
<body>

<h1>일몰 시간 확인하기</h1>

<table>

<thead>
<tr>
	<th style="idth: 10%;">날짜</th>
	<th style="idth: 10%;">지역</th>
	<th style="idth: 10%;">일몰 시간</th>
	<th style="idth: 45%;">위도</th>
	<th style="idth: 10%;">경도</th>
</tr>
</thead>
<tbody>
<c:forEach items="${sunset }" var="sunset">


	<tr>
	   <td>${sunset.sunsetNum }</td>
	   <td>${sunset.latitudeNum }</td>
	   <td>${sunset.longitudeNum }</td>
	   <td>${sunset.locdate }</td>
	   <td>${sunset.location }</td>
	</tr>
	
</c:forEach>
</tbody>
</table>

</body>
</html>

<c:import url="../layout/footer.jsp" />