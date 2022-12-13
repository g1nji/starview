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
</style>

<script type="text/javascript">
function del(){
	if(confirm("사용하고 계신 아이디(${info.uId })를 탈퇴하시면 복구가 불가하오니 신중하게 선택하시기 바랍니다. 탈퇴하시겠습니까?")){
		location.href="./predelete";		
	}
	}
	
function up(){
	if(confirm("회원정보를 수정하시겠습니까?")){
		location.href="./preupdate";		
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
<input type="button" id="btn" value="탈퇴" onclick='del()'>
<input type="button" id="savebtn" value="수정" onclick='up()'>


</body>
</html>
<c:import url="../layout/footer.jsp" />