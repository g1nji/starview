<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
html {
	text-align: center;
	margin: 0 auto;
	padding: 0 auto;
	display: 
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
    margin-top: 20px;

}

#idcon{
margin-bottom: 200px;
}

fieldset{
width:500px;
border:1px solid #ccc;
height:200px;
margin: 0 auto;
padding: 0 auto;
vertical-align: middle;
}
</style>

</head>
<body>

<br>
<h2 id="idfind">아이디 찾기 결과</h2>
<br>
<br>


<div id="idcon">

<fieldset>

<br>
<c:forEach items="${userId }" var="user">
<br>
<h3>${user.uName }님의 아이디는 ${user.uId }입니다</h3>

</c:forEach>

</fieldset>

<a href=""><button>비밀번호 찾기</button></a>
<a href="/"><button>메인으로</button></a>
<a href="./login"><button>로그인</button></a>

</div>

</body>
</html>
<c:import url="../layout/footer.jsp" />