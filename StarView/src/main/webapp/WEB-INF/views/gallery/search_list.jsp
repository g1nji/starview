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
		<td><img src="/imagepath/${gallery.storedName }" style="width:150px;"></td>
		<td>${gallery.galleryTitle }</td>
		<td>${gallery.galleryContent }</td>
		<td>${gallery.uNick }</td>
	</tr>
</table>
</c:forEach>
</div>

<c:import url="../layout/footer.jsp" />