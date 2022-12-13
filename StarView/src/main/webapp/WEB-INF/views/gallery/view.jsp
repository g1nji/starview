<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<h2>${viewGallery.galleryTitle }</h2>
작성자

<!-- 게시글 작성자가 아닐 때 -->
좋아요

<!-- 게시글 작성자일 때 -->
<c:if test="${uId } == ${viewGallery.uId }">
	<a href="./update?galleryNo=${viewGallery.galleryNo }">수정</a>
	<a href="./delete?galleryNo=${viewGallery.galleryNo }">삭제</a>
</c:if>

<br>

<fmt:formatDate value="${viewGallery.galleryDate }" pattern="yyyy-MM-dd" />
<hr>

<img src="/imagepath/${galleryFile.storedName }" style="width:100%;">
${viewGallery.galleryContent }

<span>장소</span>
<span>태그</span>

<hr>

<div class="comment">

</div>

<c:import url="../layout/footer.jsp" />