<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<h2>${viewGallery.galleryTitle }</h2>
${viewGallery.uNick }

<!-- 게시글 작성자가 아닐 때 -->
좋아요

<!-- 게시글 작성자일 때 -->
<c:if test="${uId eq viewGallery.uId }">
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

<div class="comment-list">

<ul>

	<c:forEach items="${comment }" var="comment">
		<li>
			<p>작성자 ${comment.uNick }</p>
			<p>작성일 ${comment.cmDate }</p>
			<p>덧글내용 ${comment.cmContent }</p>
		</li>
	</c:forEach>
</ul>

</div>


<div class="comment">
	
	<form action="/comment/write" method="post">
	
		<p>
			작성자 : ${uNick }
		</p>

		<p>
			<input type="hidden" name="galleryNo" value="${viewGallery.galleryNo }">
			<input type="hidden" name="uId" value="${uId }">
			<input type="hidden" name="uNick" value="${uNick }">
			<textarea rows="5" cols="50" name="cmContent"></textarea>
		</p>
		
		<p>
			<button type="submit">댓글 작성</button>
		</p>
	</form>

</div>

<c:import url="../layout/footer.jsp" />