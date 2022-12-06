<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />


<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		location.href = "/gallery/write"
	})
})
</script>

<style type="text/css">
.gallerylist {
	float: left;
	margin: 0 0 20px 5px;
	width: 285px;
	border: 1px solid #ccc;
}

.img {
	height: 285px;
}

#btnWrite {
	float: right;
}


</style>

<h1>갤러리</h1>
<button id="btnWrite">글쓰기</button>
<hr>

<!-- 게시글이 존재하지 않을 때 -->
<c:if test="${empty list}">
<h3>게시글이 존재하지 않습니다</h3>
</c:if>

<!-- 게시글 존재 -->
<!-- 게시글이 8개 이하일 경우 리스트 갯수만큼 반환 -->
<c:if test="${list.size() < 8 }">
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
			<td>날짜</td>
			<td>조회수</td>
<%-- 			<td><fmt:formatDate value="${gallery.galleryDate }" pattern="yy-MM-dd HH:mm:ss" /></td></td> --%>
<%-- 			<td>${gallery.hit }</td> --%>
		</tr>
		</table>
	</c:forEach>
</c:if>

<div class="clearfix"></div>



<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />