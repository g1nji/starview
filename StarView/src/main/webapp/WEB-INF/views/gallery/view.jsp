<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	var uid = '<%=session.getAttribute("uId") %>'
	
	$("#btnReport").click(function() {
		
		if(confirm("덧글을 신고하시겠습니까?") == true ) {
			alert("신고가 완료되었습니다");
		} else {
			return;
		}
	})
	
// 	$(".heart-click").click(function() {
		
// 		let no = $(this).attr('idx');
		
// 		if($(this).children('img').attr('class') == )
// 	})
	
	$(".BtnDelete").click(function() {
		if(confirm("게시글을 삭제하시겠습니까?") == true) {
			alert("게시글이 삭제되었습니다");
			location.href = "/gallery/delete?galleryNo=${viewGallery.galleryNo }"
		} else {
			return;
		}
	})
	
	$(".BtnCmDelete").click(function() {
		if(confirm("덧글을 삭제하시겠습니까?") == true) {
			alert("덧글이 삭제되었습니다");
		} else {
			return;
		}
	})
	
})

// /* 좋아요 */
// function like_func(){
//   var frm_read = $('#frm_read');
//   var boardno = $('#boardno', frm_read).val();
//   //var mno = $('#mno', frm_read).val();
//   //console.log("boardno, mno : " + boardno +","+ mno);
  
//   $.ajax({
//     url: "/gallery/like",
//     type: "GET",
//     cache: false,
//     dataType: "json",
//     data: 'boardno=' +boardno,
//     success: function(data) {
//       var msg = '';
//       var like_img = '';
//       msg += data.msg;
//       alert(msg);
      
//       if(data.like_check == 0){
//         like_img = "./images/dislike.png";
//       } else {
//         like_img = "./images/like.png";
//       }      
//       $('#like_img', frm_read).attr('src', like_img);
//       $('#like_cnt').html(data.like_cnt);
//       $('#like_check').html(data.like_check);
//     },
//     error: function(request, status, error){
//       alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//     }
//   });
// }

</script>

<style type="text/css">
.tags {
	background-color: #FFEBBA;
	margin-top: 10px;
    margin-right: 5px;
    padding: 0 10px;
    border-radius: 10px;
    height: 20px;
    display: inline-block;
    font-weight: 300;
}

.like_img {
	height: 25px;
	float: right;
}
</style>

<h2>${viewGallery.galleryTitle }</h2>
${viewGallery.uNick }

<%-- 좋아요 버튼 --%>
<c:choose>
  <c:when test="${uId ne null}">
    <a href='javascript: like_func();'><img src='/resources/image/heart-empty.png' class="like_img"></a>
  </c:when>
  <c:otherwise>
    <a href='javascript: login_need();'><img src='/resources/image/heart-empty.png' class="like_img"></a>
  </c:otherwise>
</c:choose>

<!-- 게시글 수정, 삭제 버튼 -->
<c:if test="${uId eq viewGallery.uId }">
<a href="/gallery/update?galleryNo=${viewGallery.galleryNo }" style="color:#5BC0CF; padding-left:10px;">수정</a>
<a class="BtnDelete" style="color:#E64556; padding-left:10px; cursor:pointer;">삭제</a>
</c:if>
<br>

<fmt:formatDate value="${viewGallery.galleryDate }" pattern="yyyy-MM-dd" />
<hr>

<img src="/imagepath/${galleryFile.storedName }" style="width:100%;">
${viewGallery.galleryContent }

<hr>

<span class="glyphicon glyphicon-map-marker"></span>
<span>${viewGallery.galleryLoc }</span><br>
<c:forEach items="${tags }" var="tags">
	<div class="tags">${tags.tagName }</div>
</c:forEach>
<%-- <span>${tags.tagName }</span> --%>

<hr>

<div class="comment-list">

	<h4>댓글</h4>
	
	<c:forEach items="${comment }" var="comment">
		<div style="border-bottom:1px solid #eee; padding-top: 20px;">
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
					<a href="/comment/modify?cmNo=${comment.cmNo }" style="color:#5BC0CF;">수정</a>
					</td>
				</c:if>
				<c:if test="${uId eq comment.uId }">
					<td style="padding-left:10px;">
					<a href="/comment/delete?cmNo=${comment.cmNo }" class="BtnCmDelete" style="color:#E64556;">삭제</a>
					</td>
				</c:if>
			</tr>
		</table>
		</div>
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