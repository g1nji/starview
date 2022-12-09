<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnList").click(function() {
		location.href = "./list"
	})
	
	$("#btnUpdate").click(function() {
		location.href = "./update?galleryNo=${viewBoard.galleryNo }"
	})
	
	$("#btnDelete").click(function() {
		location.href = "./delete?galleryNo=${viewBoard.galleryNo }"
	})
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}
</style>

<h1>게시글 상세 조회</h1>
<hr>

<table class="table table-bordered">
<tr>
	<td class="info">글번호</td><td>${viewBoard.galleryNo }</td>
</tr>
<tr>
	<td class="info">작성자</td><td>${viewBoard.uId}</td>
</tr>
<tr>
	<td class="info">제목</td><td>${viewBoard.galleryTitle }</td>
</tr>
<tr>
	<td class="info">내용</td><td>${viewBoard.galleryContent }</td>
</tr>
<tr>
	<td class="info">작성일</td><td><fmt:formatDate value="${viewBoard.galleryDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="info">조회수</td><td>${viewBoard.galleryHit }</td>
</tr>
<tr>
	<td class="info">추천수</td><td>${viewBoard.galleryLike }</td>
</tr>
<tr>
	<td class="info">사진번호</td><td>${viewBoard.photoNo }</td>
</tr>
<tr>
	<td colspan="2" height="200" valign="top" style="padding:20px; line-height:160%">
		<div id="file">
			<div>
				<!-- 주소를 다시 제대로 -->
				<img src='/boardphoto/${photofile.originName }' style="width: 200px; height: 200px;" /><br>
			</div>
			${photofile.storedName }
		</div>
	</td>
</tr>
</table>

<div class="text-center">
	<button id="btnList" class="btn btn-default">목록</button>
	
	<!-- 아이디 추가 -->
	<button id="btnUpdate" class="btn btn-primary">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

<c:import url="../layout/footer.jsp" />