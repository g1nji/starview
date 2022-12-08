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

<style type="text/css">
html {
	text-align: center;
	margin: 0 auto;
	padding: 0 auto;
	display: 
}
</style>

</head>
<body>

<h1>별보러가자</h1>
<br>
<h3>아이디 찾기</h3>
<br>
<br>


<div>

<fieldset style="width:1200px; height: 300px; margin: 0 auto; padding: 0 auto; vertical-align: middle;">

<legend>결과 확인</legend>

<br>
<c:forEach items="${userId }" var="user">

<h3>${user.uName }님의 아이디는 ${user.uId }입니다</h3>

</c:forEach>

</fieldset>

<a href=""><button>비밀번호 찾기</button></a>
<a href="/"><button>메인으로</button></a>
<a href="./login"><button>로그인</button></a>

</div>

</body>
</html>