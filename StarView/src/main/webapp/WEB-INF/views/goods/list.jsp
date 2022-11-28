<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: 굿즈샵 :::</title>

<style type="text/css">

.thumb {
	width: 200px;
	height: 200px;
}

</style>
</head>
<body>

<h3>굿즈샵</h3>
<table>
<c:forEach items="${goodsList }" var="goods">
<tr><td><img class="thumb" src="${goods.fileName }"></td></tr>
<tr><td>${goods.gName}</td></tr>
<tr><td>${goods.gPrice}</td></tr>
</c:forEach>

</table>
</body>
</html>