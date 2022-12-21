<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<c:import url="../layout/mymenu.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	
	$("td").mouseover(function() {
		$(this).parent().find("td").addClass("backg")
		$(this).parent().find("td > a").addClass("backg")
	})
	
	$("td").mouseleave(function() {
		$(this).parent().find("td").removeClass("backg")
		$(this).parent().find("td > a").removeClass("backg")
	})
	
})
</script>

<style type="text/css">

.backg {
 	color: #FFB703;
}

th, td {
	text-align: center;
}

.wrap{
	height: 100%;
	margin-left: 200px;
	margin-top: 80px;
}

</style>

<div class="wrap">
<h1>내가 작성한 글 리스트</h1>
<hr>

<table class="table">
<tr>
	<th style="width:5%;">No</th>
	<th style="width:65%; text-align:left;">글 제목</th>
	<th style="width:10%;">추천수</th>
	<th style="width:10%;">조회수</th>
	<th style="width:10%; text-align:right;">작성일</th>
</tr>

<c:forEach items="${list }" var="gallery" varStatus="status">
<tr>
	<td>${list.size() - status.index }</td>
	<td style="text-align:left;" onclick="location.href='/gallery/view?galleryNo=${gallery.galleryNo }'"><a href="/gallery/view?galleryNo=${gallery.galleryNo }">${gallery.galleryTitle }</a></td>
	<td>${gallery.galleryLike }</td>
	<td>${gallery.galleryHit }</td>
	<td style="text-align:right;"><fmt:formatDate value="${gallery.galleryDate }" pattern="yyyy-MM-dd" /></td>
</tr>
</c:forEach>
</table>

<c:import url="../layout/paging.jsp" />

</div>


<c:import url="../layout/footer.jsp" />