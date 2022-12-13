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
.pwcon{
height:520px;
padding-top: 6%;
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
<h3>아이디:<input type="text" name="uId" value="${users.uId}" readonly></h3>
<h3>비밀번호:<input type="password" name="uPw"></h3> <%--  value="${users.uPw}" --%>
<div style="color:red;">${msg }</div>

<a href="./main"><button>메인</button></a>
<input type="submit" id="savebtn" value="확인" ><!-- onclick='chk()' -->



</form> 
</div>
</body>
</html>
<c:import url="../layout/footer.jsp" />