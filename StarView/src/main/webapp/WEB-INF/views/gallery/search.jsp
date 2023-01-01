<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="wrap">
<h1>서치리스트</h1>

<c:forEach items="${gallery }" var="gallery">
<table>
	<tr>
		<td>이미지</td>
		<td>${gallery.galleryTitle }</td>
		<td>${gallery.galleryContent }</td>
		<td>${gallery.uNick }</td>
	</tr>
</table>
</c:forEach>
</div>

<c:import url="../layout/footer.jsp" />"G:/공부/★파이널프로젝트/별 보러 가자_05.pptx"