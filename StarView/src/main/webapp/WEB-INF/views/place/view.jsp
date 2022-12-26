<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "/place/main"
	})
	
})
</script>

<style type="text/css">

#expln{
	width:600px;
	float:right;
}

</style>

</head>
<body>

<h1>명소 상세 페이지</h1>
<hr>

<div>
	<h3>${viewStarplace.arrival}</h3>
	<p>${viewStarplace.pAdr }</p>
	
	<div id="expln">
	<p>${viewStarplace.pExpln }</p>
	</div>
	
</div>

<button id="btnList">⬅</button>

<c:import url="./review.jsp" />

</body>
</html>
<c:import url="../layout/footer.jsp" />