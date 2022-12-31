<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

table {
	table-layout: fixed;
	border-collapse: collapse;
    border-radius: 1em;
    overflow: hidden;
    border-radius: 10px;
    width: 1150px;
    box-shadow: 0 0 20px rgb(0 0 0 / 10%);
    height: auto;
}

table, th {
	text-align: center;
}

th {
    background-color: #191970;
    color: white;
}

</style>

<script>
$(document).ready(() => {

	//결과 화면 지우기
	resultLayout.innerHTML = '';
	
	var d = "<h4 style='color: #191970; text-align: center; color: #FFB703;'> 추천일 조회는 오늘(" +ymd+ ")로부터 10일 이내만 가능합니다</h4><br>";
	document.getElementById("resultLayout").innerHTML=d;
})

//함수 정의 방법1
function func1(a,b) {
	return a + b;
}

//함수 정의 방법2
var func2 = (a, b) => {
	return a + b;
}

//날짜
var today = new Date();

//연도
var year = today.getFullYear();

//월
var month = today.getMonth() + 1;

//일
var date = today.getDate();

//오늘 날짜
var ymd = year + "년 " + month + "월 " +date + "일";

</script>
</head>
<body>

<div class="container">

<h2 style="text-align: center;">추천일 🔭</h2>

<br>

<div id="resultLayout"></div>
 
<br>
 
<table class="table table-hover">
<thead>
	<tr>
		<th style="width: 10%;">지역</th>
		<th style="width: 15%;">추천일</th>
		<th style="width: 30%;">추천 시간</th>
		<th>내용</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td>${b.recomLoc }</td>
		<td>${b.recomDate }</td>
		<td>${b.recomTime }</td>
		<td><span style="color: #FF9494;">${b.rain}%</span>의 강수 확률로 예상되며, 기상 상태는 <span style="color: #FF9494;">${b.sky}</span>으로 예상됩니다.</td>
	</tr>
</c:forEach>
</tbody>
</table>

</div><!-- .container end -->

</body>
</html>