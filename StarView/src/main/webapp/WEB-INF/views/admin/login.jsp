<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>관리자 로그인</h1>
<hr>

<form action="./login" method="post">
	<label>아이디</label> <input type="text" name="uId" placeholder="아이디를 입력하세요" required="required"> <br>
	<label>비밀번호</label> <input type="password" name="uPw" placeholder="비밀번호를 입력하세요" required="required"> <br>
	
	<button>로그인</button>
</form>

</body>
</html>