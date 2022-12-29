<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<h1>'${keyword }'의 검색 결과</h1>
<hr>

<table class="table table-hover">
<thead>
	<tr class="warning">
		<th><input type='checkbox' name='all' value='selectall' onclick='selectAll(this)'/> 전체선택</th>
		<th>작성자</th>
		<th>제목</th>
		<th>내용</th>
		<th>위치</th>
		<th>태그</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>

<c:forEach items="${searchList }" var="b">
	<tr>
		<td><input id="select" type="checkbox" name="select" value="${b.galleryNo }"></td>
		<td>${b.uId }</td>
		<td><a href="./view?galleryNo=${b.galleryNo }">${b.galleryTitle }</a></td>
		<td>${b.galleryContent }</td>
		<td>${b.galleryLoc }</td>
		<td>${b.galleryTag }</td>
		<td><fmt:formatDate value="${b.galleryDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button class="btnBack" onclick="location.href='./list'">다시 검색하기</button>

<c:import url="../layout/footer.jsp" />