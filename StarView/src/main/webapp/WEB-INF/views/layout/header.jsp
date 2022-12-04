<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html></html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<style type="text/css">

body {
	margin: 0;
}

#logo {
	width: 200px;
	background-color: lightgray;
	z-index: 9999;
	margin: 0 auto;
	text-align: center;
}

ul.subnav {
	padding: 0;
}

ul.subnav > li {
	float: right;
	list-style-type: none;
}

#main-menu {
	height: 40px;
}

ul.nav {
	padding: 0;
}

ul.nav > li {
	float: left;
	position: relative;
	width: 100px;
	height: 30px;
	text-align: center;
	padding: 5px 10px;
	list-style-type: none;
}

ul.nav > li > a {
	text-decoration: none;
}

ul.nav > li > ul {
	position: absolute;
	display: none;
	padding: 5px 10px;
	width: 100px;
}

ul.nav > li > ul > li {
	list-style-type: none;
	text-align: left;
}

ul.nav > li > ul > li > a {
	text-decoration: none;
}

ul.nav > li:hover > ul {
	display: block;
}

#footer {
	padding: 30px 0;
	background-color: lightgray;
	font-size: 12px;
	text-align: center;
}

</style>

</head>
<body>

<header>

<div id="sub-menu">
	<div id="logo"><a href="/">별 보러 가자</a></div>
	<ul class="subnav">
		<li><button type="button" onclick="location.href='/users/login';">로그인/회원가입</button></li>
		<li><button>장바구니</button>
	</ul>
</div>

<div id="main-menu">
	<ul class="nav">
		<li>
			<a href="">별 정보 확인</a>
			<ul>
				<li><a href="">일몰시간</a></li>
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
</div>

</header>

<div class="container">