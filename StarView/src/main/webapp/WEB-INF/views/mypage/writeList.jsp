<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="wrap">
<h1>내가 작성한 글 리스트</h1>

<table class="table">
<tr>
	<th>글 번호</th>
	<th>글 제목</th>
	<th>작성일</th>
	<th>좋아요 수</th>
	<th>조회수</th>
</tr>

<tr>
	<td>숫자</td>
	<td>제목</td>
	<td>작성일</td>
	<td>좋아요 수</td>
	<td>조회수</td>
</tr>
</table>

</div>

<c:import url="../layout/footer.jsp" />