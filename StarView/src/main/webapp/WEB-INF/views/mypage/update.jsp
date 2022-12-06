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
/* function save(){
	if(confirm("완료?")){
		location.href="/login/mypage";		
	}
	} */
</script>
</head>
<body>

<h1>마이페이지 수정</h1>
<hr>
<form action="/mypage/update" method="post">
<h3>아이디:<input type="text" name="uId" value="${users.uId}" readonly></h3>
<h3>비밀번호:<input type="password" value="${users.uPw}" name="uPw"></h3>
<h3>이름:<input type="text" value="${users.uName}" name="uName"></h3>
<h3>닉네임:<input type="text" value="${users.uNick}" name="uNick"></h3>
<h3>주소:<input type="text" value="${users.uAddress}" name="uAddress"></h3>
<h3>생년월일:<input type="text" value="${users.uBirth}" name="uBirth"readonly></h3>
<h3>성별:<input type="text" value="${users.uGender}" name="uGender"readonly></h3>
<h3>이메일:<input type="text" value="${users.uEmail }" name="uEmail"></h3>
<h3>전화번호:<input type="text" value="${users.uPhone }" name="uPhone"></h3>

<a href="./main"><button>메인</button></a>
<input type="submit" id="save" value="저장" ><!-- onclick='save()' -->
<input type="button" id="btn" value="탈퇴" onclick='del()'>

</form>
</body>
</html>
<c:import url="../layout/footer.jsp" />