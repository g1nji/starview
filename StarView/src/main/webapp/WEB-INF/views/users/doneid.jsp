<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
html {
	text-align: center;
	margin: 0 auto;
	padding: 0 auto;
}

div {
	text-align: center;
	width: 1200px;
	height: 800px;
	margin: 0 auto;
	paddin: 0 auto;
}

fieldset{
	width: 800px;
	height: 400px;
	margin: 0 auto;
	paddin: 0 auto;
	
}

button{
	margin-left: 10px;
	border:2px solid  #6b80f1;
    color:#fff;
    background-color: #6b80f1;
    
    padding: 4px 8px;
    height: 32px;
    font-size: 14px;
    line-height: 20px;
    
    display: inline-block;
    box-sizing: border-box;
    text-align: center;

}
</style>

</head>
<body>

<h1>별보러가자</h1>
<hr>


<div>

<h2>환영합니다!</h2>
<br><br>
<fieldset>

<legend>회원가입 완료</legend>
<br><br>

<h3>${users.uName }님의 회원가입을 축하합니다.</h3>
<h3>아이디는 ${users.uId }입니다.</h3>
<br><br>

<button type="button" onclick="location.href='/'">메인화면</button>
<button type="button" onclick="location.href='/users/login' ">로그인하기</button>


</fieldset>
</div>

</body>
</html>
<c:import url="../layout/footer.jsp" />