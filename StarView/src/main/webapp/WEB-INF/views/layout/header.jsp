<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	color: #FFB703;
	text-decoration: underline;
}

/* ----------------- */

#logo {
	height: 100px;
	padding: 0;
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
	background-color: #FFF2CC;
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
</style>
</head>

<body>

<header>

<div id="menu">
	<ul class="mainnav">
		<li id="logo"><a href="/"><img src="/resources/image/logo.png" style="width:100px;"></a></li>
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
		<li><a href="/users/login"><img src="/resources/image/user.png" style="height:25px;"></a></li>
		<li><a href=""><img src="/resources/image/shopping-cart.png" style="height:25px;"></a></li>
	</ul>
</div>

</header>

<div class="container">