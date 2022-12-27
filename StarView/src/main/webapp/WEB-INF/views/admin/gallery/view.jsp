<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//게시글 리스트로 돌아가기
	$("#btnList").click(function() {
		location.href = "./list"
	})
	
	//게시글 수정 버튼
	/* $("#btnUpdate").click(function() {
		location.href = "./update?galleryNo=${viewBoard.galleryNo }"
	}) */
	
	//게시글 삭제 버튼
	$("#btnDelete").click(function() {
		if(confirm('[게시글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?') == true) {
			alert("게시글이 삭제되었습니다")
			document.location.href = "./delete?galleryNo=${viewBoard.galleryNo }"
		}
	})
	
	//댓글 신고 버튼
	$("#btnReportComment").click(function() {
		if(confirm("[댓글] \n신고하시겠습니까?") == true ) {
			alert("댓글이 신고되었습니다");
			document.location.href = ""
		} 
	})
	
	//댓글 삭제 버튼
	$("#btnDeleteComment").click(function() {
		if(confirm("[댓글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?") == true ) {
			alert("댓글이 삭제되었습니다");
			document.location.href = ""
		}
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

<table class="table">
<tr>
	<!-- 파일이 있는 경우 -->
	<c:if test="${not empty boardFile}">
	<td rowspan="10">
		<img src='/boardFile/${boardFile.storedName }' style="width: 500px; height: 500px;" /><br>
	</td>
	</c:if>
	<td class="warning" style="width: 7%">글번호</td>
	<td>${viewBoard.galleryNo }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">작성자</td>
	<td>${viewBoard.uId}</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">제목</td>
	<td>${viewBoard.galleryTitle }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">내용</td>
	<td>${viewBoard.galleryContent }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">작성일</td>
	<td><fmt:formatDate value="${viewBoard.galleryDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<tr>
	<td class="warning" style="width: 10%">조회수</td>
	<td>${viewBoard.galleryHit }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">추천수</td>
	<td>${viewBoard.galleryLike }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">위치</td>
	<td>${viewBoard.galleryLoc }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">태그</td>
	<td>${viewBoard.galleryTag }</td>
</tr>
</table>

<div class="btns" style="text-align: center">
<%-- <a href="admin/gallery/download?photoNo=${boardFile.photoNo }">${boardFile.storedName } 다운로드</a> --%>
<button id="btnList" class="btn btn-default" style="display: inline-block;">목록</button>

<!-- 아이디 추가 -->
<!-- <button id="btnUpdate" class="btn btn-primary">수정</button> -->
<button id="btnDelete" class="btn btn-danger" style="display: inline-block;">삭제</button>
</div>

<hr>
<h4><strong>댓글 목록</strong></h4>
<c:forEach items="${commentList }" var="c">
	<table class="table">
		<tr>
			<td class="warning" style="width: 20%"><strong>${c.uNick }</strong> ( <fmt:formatDate value="${c.cmDate }" pattern="yy-MM-dd HH:mm:ss" /> )</td>
			<td colspan="2" style="width: 70%">${c.cmContent }</td>
	
			<td>
				<button id="btnReportComment" class="btn btn-primary btn-sm">신고</button>
				<form action="../comment/report" method="post" id="reportform" style="display:none;">
					<input type="text" name="uId" value="${c.uId }">
					<input type="text" name="cmContent" value="${c.cmContent }">
					<input type="text" name="cmDate" value="${c.cmDate }">
					<input type="text" name="reporter" value="${uId }">
				</form>
				
				<button id="btnDeleteComment" class="btn btn-danger btn-sm">삭제</button>
			</td>
		</tr>
	</table>
</c:forEach>

<c:import url="../layout/footer.jsp" />