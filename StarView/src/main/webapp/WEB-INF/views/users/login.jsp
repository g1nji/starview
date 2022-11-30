<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>

</head>
<body>
<h1>별보러가자</h1>
<hr>
<h3>로그인</h3>
<hr>

<form action="./login" method="post">

<label>아이디: <input type="text" name="uId"></label><br><br>
<label>비밀번호: <input type="password" name="uPw"></label><br><br>
<label><input type="checkbox" name="box">아이디 저장</label><br><br>
<button>로그인</button>

</form>

<br>

<button>소셜 로그인</button><br><br>

<a>아이디 찾기</a> | <a>비밀번호 찾기</a> | <a href="/users/agree">회원가입</a>


</body>
</html>