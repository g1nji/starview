<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function del(){
	if(confirm("탈퇴하시겠습니까?")){
		location.href="/mypage/delete";		
	}
	}
	
function up(){
	if(confirm("수정?")){
		location.href="/mypage/update";		
	}
	}
</script>
</head>
<body>

<h1>마이페이지</h1>
<hr>

<h3>아이디:${info.uId }</h3>
<h3>패스워드:${info.uPw }</h3>
<h3>이름:${info.uName }</h3>
<h3>닉네임:${info.uNick }</h3>
<h3>주소:${info.uAddress }</h3>
<h3>생년월일:${info.uBirth }</h3>
<h3>성별:${info.uGender }</h3>
<h3>이메일:${info.uEmail }</h3>
<h3>전화번호:${info.uPhone }</h3>

<a href="./main"><button>메인</button></a>
<!-- <a href="/delete"> --><input type="button" id="btn" value="탈퇴" onclick='del()'><!-- </a> -->
<input type="button" id="btnup" value="수정" onclick='up()'>
</body>
</html>