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

<style type="text/css">
p {
	margin: 0 10px 10px 10px;
    top: 4px;
    position: relative;
}

#Ptable {
	background-color: transparent;
    position: relative;
    bottom: 378px;
	right: 30px;
    float: right;
/*     border-collapse: separate; */
/*     border: 2px solid #535353; */
/*     border-radius: 5px; */
    color: #535353;
    font-size: 15px;
}

span {
    font-size: 12px;
    bottom: 3px;
    position: relative;
    margin-left: 10px;
}

tr:hover {
	background-color: #FFEBBA;
}

</style>
</head>

<body>

<h2 style="position: relative; bottom: 416px; left: 70px; color: #535353;">🌠 별 사진 명소</h2>
<h4 style=" float: right; bottom: 422px; right: 475px; position: relative; color: #535353;">추천 명소</h4>
<table id="Ptable">
<thead>
<tr>
</tr>	
</thead>

<tbody>
<c:forEach items="${starPlaceList }" var="StarPlace">

<tr>
<%-- 	<td>${StarPlace.arrivalNum }</td> --%>
	<td><span>⭐	</span><a href="/place/view?arrivalNum=${StarPlace.arrivalNum }">${StarPlace.arrival }</a></td>
	<td><p>${StarPlace.pAdr }</p></td>
	<td><a style="margin-right: 10px;" href="https://map.kakao.com/link/to/${StarPlace.arrival },${StarPlace.eLttd },${StarPlace.eLngtd }">길찾기</a></td>
<!-- 	<td><button id="findplace" type="button" onclick="">편의시설 조회</button></td> -->
</tr>

</c:forEach>
</tbody>
</table>
	
	
</body>
</html>

<c:import url="../layout/footer.jsp" />