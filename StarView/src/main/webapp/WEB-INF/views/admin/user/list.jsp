<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<c:import url="../layout/header.jsp" />

<div class="container">

<h1>회원 목록</h1>
<hr>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th style="width: 10%;">회원번호</th>
		<th style="width: 10%;">아이디</th>
		<th style="width: 10%;">이름</th>
		<th style="width: 10%;">성별</th>
		<th style="width: 10%;">전화번호</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="users">
	<tr>
		<td>${users.uNo }</td>
		<td>${users.uId }</td>
		<td>${users.uName }</td>
		<td>${users.uGender }</td>
		<td>${users.uPhone }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span>
<div class="clearfix"></div>

<c:import url="/WEB-INF/views/layout/paging.jsp" />

</div><!-- .container -->

<c:import url="../layout/footer.jsp" />






















