<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$(".mo").mouseover(function() {
		$(".mo > a").addClass("yellow")
	})
	
	$(".mo > a").mouseover(function() {
		$(this).addClass("yellow")
	})
	
	$(".mo > a").mouseleave(function() {
		$(this).removeClass("yellow")
	})
	
	$("ul.mainnav > li > ul").mouseover(function() {
		$(".mo > a").addClass("yellow")
	})
	
	$("ul.mainnav > li > ul").mouseleave(function() {
		$(".mo > a").removeClass("yellow")
	})
})
</script>

<!-- 메뉴 스타일 css -->
<link rel="stylesheet" type="text/css" href="../resources/css/headerCss.css">

</head>

<body>

<header>

<div id="menu">
	<ul class="mainnav">
		<li id="logo"><a href="/"><img src="/resources/image/logo.png" style="width:150px; margin-top: 5px;"></a></li>
		<li class="mo">
			<a href="">별 정보 확인</a>
			<ul>
				<li><a href="/sunset/time">일몰시간</a></li>
				<li><a href="/data/weather3">날씨</a></li>
				<li><a href="/data/moonToday">달 모양</a></li>
				<li><a href="">별 사진 명소</a></li>
				<li><a href="/data/astroMonth">이달의 천문현상</a></li>
			</ul>
		</li>
		<li><a href="/gallery/list">갤러리</a></li>
		<li><a href="/goods/list">굿즈샵</a></li>
		<li><a href="/calendar/todolist">스케줄러</a></li>
	</ul>
	<ul class="subnav">
	
		<!-- 비로그인 상태 -->
		<c:if test="${empty login }">
			<li style="padding-top: 53px;"><a href="/users/login">로그인/회원가입</a></li>
			<li><a href="/goods/cart"><img src="/resources/image/shopping-cart.png" style="height:25px;"></a></li>
		</c:if>
		
		<!-- 로그인 상태 -->
		<c:if test="${not empty login }">
			<li style="padding-top: 53px;"><a href="/users/logout">로그아웃</a></li>
			<li><a href="/mypage/mypage"><img src="/resources/image/user.png" style="height:25px;"></a></li>
			<li><a href="/goods/cart"><img src="/resources/image/shopping-cart.png" style="height:25px;"></a></li>
		</c:if>

	</ul>
</div>

</header>

<div class="container">