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
	if(confirm("탈퇴?")){
		location.href="/delete";		
	}
	}
</script>
</head>
<body>

<h1>마이페이지</h1>
<hr>

<h3>아이디:${info.id }</h3>
<h3>패스워드:${info.pw }</h3>
<h3>이메일:${info.email }</h3>
<h3>전화번호:${info.phone }</h3>

<a href="./main"><button>메인</button></a>
<!-- <a href="/delete"> --><input type="button" id="btn" value="탈퇴" onclick='del()'><!-- </a> -->

</body>
</html>