<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	
	var uid = '<%=session.getAttribute("uId") %>'
	
	$("#btnWrite").click(function() {
		
		if( uid=="null" ) {
			console.log("비로그인상태")
			alert("로그인 후 이용가능합니다");
			location.href = "/users/login"
		} else {
			console.log("로그인상태")
			location.href = "/gallery/write"
		}
	})
	
	$(".GImg").mouseover(function() {
		$(this).parent().parent().next().find(".gtitle > a").addClass("mo2")
	})
	
	$(".GImg").mouseleave(function() {
		$(this).parent().parent().next().find(".gtitle > a").removeClass("mo2")
	})
})

</script>

<style type="text/css">

.mo2 {
	color: #FFB703;
	text-decoration: underline;
}

.title {
	text-align: center;
}

.galleryT {
	margin-left: -20px;
}

.gallerylist {
	float: left;
	margin: 0 0 40px 30px;
}

.GImg {
	width: 255px;
	height: 255px;
	border-radius: 40px;
	overflow: hidden;
	text-align: center;
}

.galleryImg {
	height: 270px;
	transition: all 0.2s linear;
}

.galleryImg:hover {
	transform: scale(1.2);
}

.gtitle {
	padding-top: 5px;
	padding-bottom: 5px;
}

.gtitle > a {
	font-weight: 500;
    font-size: 16px;
}

.galleryInfo > td {
	color: darkgray;
    font-weight: 300;
}

#btnWrite {
    float: right;
    width: 70px;
    height: 30px;
    border-radius: 30px;
    border: none;
    background-color: #FFB703;
    font-weight: 500;
}

</style>

<h1 class="title">갤러리</h1>
<button id="btnWrite">업로드</button>
<div class="clearfix"></div>
<hr>
<div class="clearfix"></div>

<!-- 게시글이 존재하지 않을 때 -->
<c:if test="${empty list}">
<h3>게시글이 존재하지 않습니다</h3>
</c:if>

<!-- 게시글 존재 -->
<!-- 게시글이 12개 이하일 경우 리스트 갯수만큼 반환 -->
<div class="galleryT">
<c:if test="${list.size() < 12 }">
	<c:forEach items="${list }" var="gallery">
		<table class="gallerylist">
		<tr>
			<td colspan="4">
				<div class="GImg">
				<a href="/gallery/view?galleryNo=${gallery.galleryNo }">
				<img class="galleryImg" src="/imagepath/${gallery.storedName }">
				</a>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="gtitle"><a href="/gallery/view?galleryNo=${gallery.galleryNo }">${gallery.galleryTitle }</a></td>
		</tr>
		<tr>
			<td><span style="font-weight:500;">${gallery.uNick }</span></td>
		</tr>
		<tr class="galleryInfo">
			<td><fmt:formatDate value="${gallery.galleryDate }" pattern="yyyy-MM-dd" /></td>
			<td><img src="/resources/image/comment.png" style="width:14px;"> ${gallery.commentCnt }</td>
			<td>조회 ${gallery.galleryHit }</td>
			<td><img src="/resources/image/like.png" style="width:14px;"> ${gallery.galleryLike }</td>
		</tr>
		</table>
	</c:forEach>
</c:if>
</div>

<!-- 게시글이 12개 이상일 경우 한 페이지에 12개만 보이기 -->
<c:if test="${list.size() >= 12 }">
	<c:forEach items="${list }" var="gallery">
		<table class="gallerylist">
		<tr>
			<td colspan="4">
				<div class="GImg">
				<a href="/gallery/view?galleryNo=${gallery.galleryNo }">
				<img class="galleryImg" src="/imagepath/${gallery.storedName }">
				</a>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="gtitle"><a href="/gallery/view?galleryNo=${gallery.galleryNo }">${gallery.galleryTitle }</a></td>
		</tr>
		<tr>
			<td><span style="font-weight:500;">${gallery.uNick }</span></td>
		</tr>
		<tr class="galleryInfo">
			<td><fmt:formatDate value="${gallery.galleryDate }" pattern="yyyy-MM-dd" /></td>
			<td><img src="/resources/image/comment.png" style="width:14px;"> ${gallery.commentCnt }</td>
			<td>조회 ${gallery.galleryHit }</td>
			<td><img src="/resources/image/like.png" style="width:14px;"> ${gallery.galleryLike }</td>
		</tr>
		</table>
	</c:forEach>
</c:if>

<div class="clearfix"></div>

<div class="search">
	<form action="/gallery/search" method="post">
		<input type="text" placeholder="검색어를 입력하세요" id="keyword" name="keywordInput">
		<button class="btn_search" onclick="location.href='/gallery/search'">
		<img src="/resources/image/search.png" style="height:14px;">
		</button>
	</form>
</div>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />