<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>로그인 메인</h1>
<hr>

<%--비로그인 상태 --%>
<c:if test="${empty isLogin}">
<a href="./join">회원가입</a>
<a href="./login">로그인</a>
</c:if>

<c:if test="${not empty isLogin }">
<a href="./mypage">마이페이지</a>
<a href="./logout">로그아웃</a>
</c:if>

</body>
</html>