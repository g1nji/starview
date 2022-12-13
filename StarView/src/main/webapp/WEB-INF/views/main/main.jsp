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

<!-- JS -->
<script type="text/javascript">
var hour = function() {
	var fname = "";
	var today = new Date();
	var hh = today.getHours();
	
	/* 오전 7시부터 오후 3시 59분까지 낮 이미지 */
	if(hh>=7 && hh<16) {
		document.getElementById("day").style.backgroundImage = "url('/resources/image/day1.png')";
		document.getElementById("logoimg").src="/resources/image/logo1.png";
		$('a').mouseover(function() {
			$(this).css("color", "#5BC0CF");
		})
		
		$('a').mouseleave(function() {
			$(this).css("color", "black");
		})
		
		$('ul.mainnav > li > ul').each(function() {
			$(this).css("background-color", "#CCEBF1");
		})
		
	/* 오후 4시부터 오후 7시 59분까지 저녁 이미지 */
	} else if(hh>=16 && hh<=19) {
		document.getElementById("day").style.backgroundImage = "url('/resources/image/day2.png')";
		document.getElementById("logoimg").src="/resources/image/logo2.png";
		$('a').mouseover(function() {
			$(this).css("color", "#E64556");
		})
		
		$('a').mouseleave(function() {
			$(this).css("color", "black");
		})
		
		$('ul.mainnav > li > ul').each(function() {
			$(this).css("background-color", "#F7C8CC");
		})
		
	/* 오후 8시부터 오전 6시 58분까지 밤 이미지 */
	} else {
		document.getElementById("day").style.backgroundImage = "url('/resources/image/day3.png')";
		document.getElementById("logoimg").src="/resources/image/logo.png";
		$('a').mouseover(function() {
			$(this).css("color", "#FFB703");
		})
		
		$('a').mouseleave(function() {
			$(this).css("color", "black");
		})
		
		$('ul.mainnav > li > ul').each(function() {
			$(this).css("background-color", "#FFEBBA");
		})
	}
}
</script>

<style type="text/css">

/* 웹폰트(NotoSans) */
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
body, h1, h2, h3, h4, h5, h6, input, textarea, select {
	font-family: 'Noto Sans KR', sans-serif;
}

/* ----------------- */

body {
	margin: 0;
}

a {
	color: black;
}

a:hover {
	text-decoration: underline;
}

/* ----------------- */

#logo {
	height: 100px;
	padding: 0;
	margin-right: 20px;
}

ul.subnav {
	padding: 0 100px 0 0;
}

ul.subnav > li {
	float: right;
	list-style-type: none;
}

#menu {
	height: 100px;
}

ul.mainnav > li {
	float: left;
	position: relative;
	width: 150px;
	height: 30px;
	text-align: center;
	padding: 50px 10px 5px 10px;
	list-style-type: none;
}

ul.subnav > li {
	padding: 50px 5px 5px 5px;
}

ul.mainnav > li > a {
	text-decoration: none;
    font-size: 17px;
    font-weight: 400;
}

ul.mainnav > li > ul {
	position: absolute;
	display: none;
	padding: 10px 0px;
	width: 150px;
	border-radius: 10px;
}

ul.mainnav > li > ul > li {
	list-style-type: none;
	text-align: left;
	padding: 0 0 10px 20px;
}

ul.mainnav > li > ul > li > a {
	text-decoration: none;
}

ul.mainnav > li:hover > ul {
	display: block;
}

#footer {
	padding: 30px 0;
	background-color: lightgray;
	font-size: 12px;
	text-align: center;
}

.wrap {
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

#day {
	width:80%;
	height: 450px;
	margin: 0 auto;
	background-size: 100%;
	border-radius: 100px;
	background-size : cover;
}

</style>
</head>

<body onload="hour()">

<header>

<div id="menu">
	<ul class="mainnav">
		<li id="logo"><a href="/"><img id="logoimg" src="" style="width:150px; margin-top: 5px;"></a></li>
		<li>
			<a href="">별 정보 확인</a>
			<ul>
				<li><a href="/sunset/time">일몰시간</a></li>
				<li><a href="">날씨</a></li>
				<li><a href="">달 모양</a></li>
				<li><a href="">별 사진 명소</a></li>
				<li><a href="">이달의 천문현상</a></li>
			</ul>
		</li>
		<li><a href="/gallery/list">갤러리</a></li>
		<li><a href="/goods/list">굿즈샵</a></li>
		<li><a href="">스케줄러</a></li>
	</ul>
	<ul class="subnav">
	
		<!-- 비로그인 상태 -->
		<c:if test="${empty login }">
			<li style="padding-top: 53px;"><a href="/users/login">로그인/회원가입</a></li>
			<li><a href=""><img src="/resources/image/shopping-cart.png" style="height:25px;"></a></li>
		</c:if>
		
		<!-- 로그인 상태 -->
		<c:if test="${not empty login }">
			<li style="padding-top: 53px;"><a href="/users/logout">로그아웃</a></li>
			<li><a href="/mypage/mypage"><img src="/resources/image/user.png" style="height:25px;"></a></li>
			<li><a href=""><img src="/resources/image/shopping-cart.png" style="height:25px;"></a></li>
		</c:if>
		
	</ul>
</div>

</header>

<div id="day"></div>

<div class="container">

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