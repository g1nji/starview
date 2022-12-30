<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	var u_id = '<%=session.getAttribute("uId") %>'
	var likeval = ${like }
	
	if( u_id == "null" ) {
		
		$("textarea#content").attr("placeholder", "로그인 후 이용가능합니다.");
		$("textarea#content").attr("readonly", true);
		$("textarea#content").click(function() {
			alert("로그인 후 이용가능합니다");
			location.href = "/users/login"
		})
		
		$(".filebox").addClass("noClick");
		
	} else {
		
		$("textarea#content").attr("placeholder", "내용을 작성해 주세요.");
		
		$(".filebox").addClass("Click");
		$(".filebox").mouseover(function() {
			$(this).addClass("fmo");
		});
		$(".filebox").mouseleave(function() {
			$(this).removeClass("fmo");
		});
	}
	
	if(likeval > 0 ) {
		$(".like_img").attr("src", "/resources/image/heart-fill.png")
		$(".like_img").click(function() {
			console.log("좋아요 클릭")
			
			if(u_id != "null" ) {
				$.ajax({
					url : "/gallery/likedown",
					type : "post",
					data : {
						galleryNo : ${viewGallery.galleryNo },
						uId : '<%=session.getAttribute("uId") %>'
					},
					success : function() {
						$(".like_img").attr("src", "/resources/image/heart-empty.png")
						console.log("좋아요 취소")
						location.reload();
					},
					error : function() {
						console.log("실패")
					}
				})
			} else {
				alert("로그인 후 이용 가능합니다")
				location.href="/users/login"
			}
		})
		
	} else {
		
		$(".like_img").click(function() {
			console.log("좋아요 클릭")
			
			if(u_id != "null" ) {
				$.ajax({
					url : "/gallery/likeup",
					type : "post",
					data : {
						galleryNo : ${viewGallery.galleryNo },
						uId : '<%=session.getAttribute("uId") %>'
					},
					success : function() {
						$(".like_img").attr("src", "/resources/image/heart-fill.png")
						console.log("좋아요 성공")
						location.reload();
					},
					error : function() {
						console.log("실패")
					}
				})
			} else {
				alert("로그인 후 이용 가능합니다")
				location.href="/users/login"
			}
		})
	}
	
	
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
	
	$("#btnReport").click(function() {
		
		if(confirm("덧글을 신고하시겠습니까?") == true ) {
			alert("신고가 완료되었습니다");
		} else {
			return;
		}
	})
	
})

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

.noClick {
	border: none;
    border-radius: 10px;
    display: flex;
    font-size: 16px;
    align-items: center;
    width: 100px;
    height: 46px;
    background-color: #FFEBBA;
    justify-content: center;
    font-weight: 500;
	opacity: 0.6;
	cursor: not-allowed;
}

.Click {
	border: none;
    border-radius: 10px;
    display: flex;
    font-size: 16px;
    align-items: center;
    width: 100px;
    height: 46px;
    background-color: #FFEBBA;
    justify-content: center;
    font-weight: 500;
    cursor: pointer;
}

.fmo {
	background-color: #FFB703;
    font-weight: 700;
    cursor: pointer;
}
</style>

<h2>${viewGallery.galleryTitle }</h2>
${viewGallery.uNick }

<%-- 좋아요 버튼 --%>
<span style="float:right;">${getLike }</span> <a style="cursor:pointer;"><img src="/resources/image/heart-empty.png" class="like_img"></a>

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
	
		<table style="width:100%;">
			<tr>
				<th>${uNick }</th>
			</tr>

			<tr>
				<td style="width:90%">
					<input type="hidden" name="galleryNo" value="${viewGallery.galleryNo }">
					<input type="hidden" name="uId" value="${uId }">
					<input type="hidden" name="uNick" value="${uNick }">
					<textarea style="width:100%;" id="content" name="cmContent"></textarea>
				</td>
				<td style="width:15%; padding-left: 10px;"><button type="submit" class="filebox">댓글 작성</button></td>
			</tr>
		</table>
	</form>

</div>

<c:import url="../layout/footer.jsp" />