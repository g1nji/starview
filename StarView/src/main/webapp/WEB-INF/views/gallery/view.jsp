<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnReport").click(function() {
		
		if(confirm("덧글을 신고하시겠습니까?") == true ) {
			alert("신고가 완료되었습니다");
		} else {
			return;
		}
	})
	
})
</script>

<h2>${viewGallery.galleryTitle }</h2>
${viewGallery.uNick }

<!-- 게시글 작성자가 아닐 때 -->
<c:if test="${uId ne viewGallery.uId }">
<!-- 좋아요 버튼 -->
<%-- <c:choose> --%>
<%-- 	<c:when test="${ }" --%>
<%-- </c:choose> --%>
</c:if>

<c:if test="${uId eq viewGallery.uId }">
<a href="/gallery/update" style="color:#5BC0CF; padding-left:10px;">수정</a>
<a href="/gallery/delete" style="color:#E64556; padding-left:10px;">삭제</a>
</c:if>
<br>

<fmt:formatDate value="${viewGallery.galleryDate }" pattern="yyyy-MM-dd" />
<hr>

<img src="/imagepath/${galleryFile.storedName }" style="width:100%;">
${viewGallery.galleryContent }

<hr>

<span>${viewGallery.galleryLoc }</span>
<%-- <span>${tags.tagName }</span> --%>

<hr>

<div class="comment-list">

	<h4>댓글</h4>
	
	<c:forEach items="${comment }" var="comment">
		<table style="margin-bottom:20px;">
			<tr>
				<th>${comment.uNick }</th>
			</tr>
			<tr>
				<td>${comment.cmContent }</td>
			</tr>
			<tr>
				<td style="color:gray;"><fmt:formatDate value="${comment.cmDate }" pattern="yyyy.MM.dd hh:mm" /></td>
				<c:if test="${uId ne comment.uId}">
					<td style="padding-left:10px;">
						<form action="/comment/report" method="post" style="display:none;" id="reportform">
							<input type="text" name="uId" value="${comment.uId }">
							<input type="text" name="cmContent" value="${comment.cmContent }">
							<input type="text" name="cmDate" value="${comment.cmDate }">
							<input type="text" name="reporter" value="${uId }">
						</form>
						<a href="" id="btnReport" style="color:gray;">신고</a>
					</td>
				</c:if>
				<c:if test="${uId eq comment.uId }">
					<td style="padding-left:10px;">
					<a href="" style="color:#5BC0CF;">수정</a>
					</td>
				</c:if>
				<c:if test="${uId eq comment.uId }">
					<td style="padding-left:10px;">
					<a href="" style="color:#E64556;">삭제</a>
					</td>
				</c:if>
			</tr>
		</table>
	</c:forEach>

</div>


<div class="comment">
	
	<form action="/comment/write" method="post">
	
		<table>
			<tr>
				<th>${uNick }</th>
			</tr>

			<tr>
				<td>
					<input type="hidden" name="galleryNo" value="${viewGallery.galleryNo }">
					<input type="hidden" name="uId" value="${uId }">
					<input type="hidden" name="uNick" value="${uNick }">
					<textarea rows="5" cols="50" name="cmContent"></textarea>
				</td>
			</tr>
			
			<tr>
				<td><button type="submit">댓글 작성</button></td>
			</tr>
		</table>
	</form>

</div>

<c:import url="../layout/footer.jsp" />