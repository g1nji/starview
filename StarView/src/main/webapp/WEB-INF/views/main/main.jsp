<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">

.imageslider {
	width: 100%;
	height: 500px;
	border: 1px solid red;
	text-align: center;
}

.wrap {
	width: 1350px;
	margin: 0 auto;
}

.monthly {
	width: 55%;
	height: 200px;
	margin: 15px 30px 15px 0;
	border: 1px solid black;
	display: inline-block;
}

.weather {
	width: 20%;
	height: 200px;
	margin: 0 20px 0 0;
	border: 1px solid black;
	display: inline-block;
}

.moon {
	width: 20%;
	height: 200px;
	border: 1px solid black;
	display: inline-block;
}

</style>

<div class="imageslider">
갤러리 이미지
</div>

<div class="wrap">

<div class="monthly">
이달의 천문현상
	<div>
	천문현상 글
	</div>
</div>

<div class="weather">
현재 날씨
	<div>
	현재 날씨 상태
	</div>
</div>

<div class="moon">
오늘의 달 모양
	<div>
	오늘의 달 모양
	</div>
</div>

</div>
<c:import url="../layout/footer.jsp" />