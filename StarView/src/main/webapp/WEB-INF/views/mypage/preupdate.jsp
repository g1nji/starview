<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<c:import url="../layout/mymenu.jsp" />
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
.pwcon{
height:600px;
padding-top: 8%;
width:500px;
margin:0 auto;
}
input{
	border: 1px solid #ccc;
}
h4{
margin-bottom: 20px;
}
#uId{
	border: 1px solid transparent;
}
</style>
<script type="text/javascript">
	
	
</script>
</head>
<body>
<div class="pwcon">
<h1>비밀번호 재확인</h1>
<hr>
<h4>안전한 회원정보 수정을 위해 비밀번호를 다시 한 번 입력해주세요.</h4>
<form action="/mypage/preupdate" method="post">
<h3>아이디    <input type="text" id="uId" name="uId" value="${users.uId}" readonly></h3>
<h3>비밀번호 <input type="password" name="uPw"></h3> <%--  value="${users.uPw}" --%>
<div style="color:red;">${msg }</div>

<input type="submit" id="savebtn" value="확인" >



</form> 
</div>
</body>
</html>
<c:import url="../layout/footer.jsp" />