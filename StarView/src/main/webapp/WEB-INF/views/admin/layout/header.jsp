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

body {
	margin: 0;
}

#logo {
	background-color: #506EA5;
	z-index: 9999;
	margin: 0 auto;
	text-align: center;
}

#logo > a {
	color: white;
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
}

ul.nav {
	background-color: #506EA5;
	color: white;
}

ul.nav > li {
	position: relative;
	width: 200px;
	height: 150px;
	margin-top: 20px;
	text-align: center;
	list-style-type: none;
}


ul.nav > li > a {
	text-align: center;
	text-decoration: none;
	color: white;
}

ul.nav > li > a:hover {
	background-color: #FFD732;
	color: black;
}

ul.nav > li > ul {
	position: absolute;
	display: none;
}

ul.nav > li > ul > li {
	list-style-type: none;
	text-align: left;
}

ul.nav > li > ul > li > a {
	text-decoration: none;
	color: white;
}

ul.nav > li > ul > li > a:hover {
	background-color: #FFD732;
	color: black;
}

ul.nav > li:hover > ul {
	display: block;
}

#header {
	position: fixed;
  	top: 0;
  	left: 0;
  	right: 0;
  	height: 60px;
	background-color: #506EA5;
	text-align: center;
	z-index: 999;
}

html #header {
	position: absolute;
}

#footer {
	position: fixed;
	z-index: 999;
	background-color: #506EA5;
	font-size: 12px;
	text-align: center;
	height: 60px;
	width: 100%;
	color: white;
}

html #footer {
	position: absolute;
	bottom: -1px;
}

.container {
	position: relative;
	z-index: 2;
	margin-left: 300px;
	padding-top: 110px;
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
  background-color: #2f3542;
}

::-webkit-scrollbar-track {
  background-color: grey;
}

</style>

</head>
<body>

<header id="header">

<div id="sub-menu">
	<div id="logo"><a href="">별 보러 가자(관리자)</a></div>
	<ul class="subnav">
	</ul>
</div>

<div id="main-menu">
	<ul class="nav">
		<h3 style="text-align: center;">관리자 메뉴</h3>
		<li><a href="">회원 관리</a></li>
		<li>
			게시글 관리
			<ul>
				<li><a href="../board/insert"> - 공지사항 등록</a></li>
				<li><a href="../board/list"> - 공지사항 조회</a></li>
				<li><a href="../gallery/list"> - 회원 글 조회</a></li>
				<li><a href=""> - 회원 댓글 조회</a></li>
				<li><a href=""> - 신고사항 조회</a></li>
			</ul>
		</li>
		<li><a href="">캘린더 관리</a></li>
		<li>
			상품 관리
			<ul>
				<li><a href="../prod/insert"> - 상품 업로드</a></li>
				<li><a href="../prod/list"> - 상품 전체 목록</a></li>
			</ul>
		</li>
	</ul>
</div>

</header>

<div class="container">