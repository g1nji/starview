<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<h1>게시글 작성</h1>
<hr>

<form action="./write" method="post">
제목 <input type="text" name="title"><br>
<hr>
사진 첨부<br>
내용 입력 <input type="text" name="content"><br>
<hr>
장소 입력<br>
태그 입력<br>

<button>업로드</button>
</form>

<c:import url="../layout/footer.jsp" />