<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/gallery/write"
	})
})
</script>

<style type="text/css">
.title {
	text-align: center;
}

.gallerylist {
	float: left;
	margin: 0 0 20px 5px;
	width: 280px;
	border: 1px solid #ccc;
}

.img {
	height: 285px;
}

#btnWrite {
	float: right;
}


</style>

<h2 class="title">갤러리</h2>
<button id="btnWrite">글쓰기</button>
<div class="clearfix"></div>
<hr>
<div class="clearfix"></div>

<!-- 게시글이 존재하지 않을 때 -->
<c:if test="${empty list}">
<h3>게시글이 존재하지 않습니다</h3>
</c:if>

<!-- 게시글 존재 -->
<!-- 게시글이 12개 이하일 경우 리스트 갯수만큼 반환 -->
<c:if test="${list.size() < 12 }">
	<c:forEach items="${list }" var="gallery">
		<table class="gallerylist">
		<tr class="img">
			<td></td>
		</tr>
		<tr>
			<td>
				<a href="/gallery/view?galleryNo=${gallery.galleryNo }">${gallery.galleryTitle }
				<img src="/imagepath/${galleryFile.originName }"></a>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
		</tr>
		<tr>
			<td><fmt:formatDate value="${gallery.galleryDate }" pattern="yyyy-MM-dd" /></td>
			<td>덧글수</td>
<%-- 			<td>조회수 ${gallery.galleryHit }</td> --%>
			<td>좋아요수</td>
		</tr>
		</table>
	</c:forEach>
</c:if>

<!-- 게시글이 12개 이상일 경우 한 페이지에 12개만 보이기 -->
<c:forEach items="${list }" var="gallery">
	<table class="gallerylist">
	<tr class="img">
		<td></td>
	</tr>
	<tr>
		<td>
			<a href="/gallery/view?galleryNo=${gallery.galleryNo }">${gallery.galleryTitle }
			<img src="/imagepath/${galleryFile.originName }"></a>
		</td>
	</tr>
	<tr>
		<td>작성자</td>
	</tr>
	<tr>
		<td><fmt:formatDate value="${gallery.galleryDate }" pattern="yyyy-MM-dd" /></td>
		<td>덧글수</td>
		<td>조회수 ${gallery.galleryHit }</td>
		<td>좋아요수</td>
	</tr>
	</table>
</c:forEach>

<div class="clearfix"></div>

<div class="search">검색</div>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />