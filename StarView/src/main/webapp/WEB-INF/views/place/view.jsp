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
	position: relative;
	top: 234px;
    left: 185px;
}

#placename {
	float:right;
	position: relative;	
    top: 106px;
    right: 416px;
}

#btnList {
    float: right;
    position: relative;
    bottom: 365px;
    right: 322px;
}

</style>

</head>
<body>

<h1>명소 상세 페이지</h1>

<div>
	<div id="placebox">
	<div id="placename">
	<h3>${viewStarplace.arrival}</h3>
	<p>${viewStarplace.pAdr }</p>
	</div>
	
	<hr style=" position: relative; width: 605px; top: 216px; left: 360px;">
	
	<div id="expln">
	<span>${viewStarplace.pExpln }</span>
	</div>
	</div>
	
	<div id="placeimg">
	<img src="/resources/starImg/starplace_${viewStarplace.arrivalNum}.jpg" style="width: 500px; height: 400px;"/>
	</div>
	
</div>

<button id="btnList">← 길찾기</button>
<hr>

<c:import url="./review.jsp" />


</body>
</html>
<c:import url="../layout/footer.jsp" />