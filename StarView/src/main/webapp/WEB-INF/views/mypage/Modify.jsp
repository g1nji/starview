<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>회원정보</h1>

<form>
<table border="1">
<tr>
	<td>아이디</td>
	<td>${Users.uId }</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td>${Users.uPw }</td>
</tr>
<tr>
	<td>이메일</td>
	<td>${Users.uEmail }</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>{Users.uPhone}</td>
</tr>



</table>

</form>



<%-- <form method="post" action="/Modify">
    <table>
        <tr>
            <td>아디</td>
            <td><input type="text" name="id" value="${users.uId}" readonly></td>
        </tr>
        <tr>
            <td>비번</td>
            <td><input type="text" name="pw" value="${users.uPw}"></td>
        </tr>
    </table>
    <input type="submit" value="수정">
    <input type="submit" value="회원탈퇴" formaction="/withDraw">
</form> --%>

</body>
</html>