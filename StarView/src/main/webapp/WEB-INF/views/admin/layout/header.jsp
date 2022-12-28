<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- jQuery 3.3.1 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">

@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
body, h1, h2, h3, h4, h5, h6, input, textarea, select {
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	margin: 0;
}

#logo {
	/* background-color: #506EA5; */
	z-index: 9999;
	background-color: white;
    width: 300px;
    border-radius: 200px;
    padding: 0;
    margin-top: 50px;
}

#logo > a {
	color: black;
	text-decoration: none;
	font-size: 25px;
}

ul.subnav {
	padding: 0;
}

ul.subnav > li {
	float: right;
	list-style-type: none;
}

#main-menu {
	position: fixed;
	width: 200px;
	height: 100%;
}

ul.nav {
	/* background-color: #506EA5; */
}

ul.nav > li {
	position: relative;
	width: 250px;
	height: 150px;
	margin-top: 20px;
	text-align: center;
	list-style-type: none;
}


ul.nav > li > a {
	text-align: center;
	text-decoration: none;
	background-color: #FCF8E3;
	color: black;
	font-size: 19px;
	border-radius: 10%;
	border: 3px solid #FCF8E3;
	margin-left: 60px;
	pointer-events: none;
}

/* ul.nav > li > a:hover {
	text-align: center;
	border-radius: 10%;
	background-color: #FCF8E3;
} */

ul.nav > li > ul {
	position: absolute;
	padding-left: 70px;
	display: none;
}

ul.nav > li > ul > li {
	list-style-type: none;
	text-align: left;
}

ul.nav > li > ul > li > a {
	text-decoration: none;
	color: black;
	font-size: 17px;
}

ul.nav > li > ul > li > a:hover {
	color: #F3EBAC;
}

ul.nav > li > ul {
	display: block;
} 

#header {
	position: fixed;
  	top: 0;
  	left: 0;
  	right: 0;
  	height: 60px;
	/* background-color: #506EA5; */
	text-align: center;
	z-index: 999;
}

#footer {
	position: fixed;
	z-index: 999;
	background-color: #FCF8E3;
	font-size: 12px;
	text-align: center;
	height: 60px;
	width: 100%;
	bottom: 0;
	padding: 20px 0;
}

.container {
	position: relative;
	z-index: 2;
	margin-left: 350px;
	padding-top: 100px;
    padding-bottom: 110px;
    min-height: 100%;
}

html .container {
	position: relative;
	z-index: 2;
}

::-webkit-scrollbar {
    width: 15px;
}

::-webkit-scrollbar-thumb {
  background-color: #FCF8E3;
}

::-webkit-scrollbar-track {
  background-color: grey;
}

</style>

</head>
<body>

<header id="header">

<div id="sub-menu">
	<div id="logo"><a href="/"><img src="/resources/image/logo.png" style="width:100px; margin-top: 5px;">&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;관리자</a></div>
	<ul class="subnav">
	</ul>
</div>

<div id="main-menu">
	<ul class="nav">
	<!-- <br>
		<h3 style="text-align: center;">관리자 메뉴</h3>
		<br> -->
		<br>
		<li>
			<a>회원 관리</a>
			<br>
			<ul>
				<li><a href="../user/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 조회</a></li>
			</ul>
		</li>
		<li>
			<a>게시글 관리</a>
			<br>
			<ul>
				<li><a href="../gallery/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 글 조회</a></li>
				<li><a href="../comment/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원 댓글 조회</a></li>
				<li><!-- <a href="../report/list"> --> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;신고사항 조회</a></li>
			</ul>
		</li>
		<li>
			<a>캘린더 관리</a>
			<br>
			<ul>
				<li><a href="../calendar/date">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;추천일 등록</a></li>
				<li><a href="../calendar/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;추천일 목록</a></li>
			</ul>
		</li>
		<li>
			<a>상품 관리</a>
			<br>
			<ul>
				<li><a href="../product/insert">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품 등록</a></li>
				<li><a href="../product/list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품 목록</a></li>
			</ul>
		</li>
	</ul>
</div>

</header>

<div class="container">