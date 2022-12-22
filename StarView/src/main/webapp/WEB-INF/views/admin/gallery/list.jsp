<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
}
</style>

<script type="text/javascript">

//전체 선택
function selectAll(selectAll)  {
	var checkboxes 
	   = document.querySelectorAll('input[type="checkbox"]');
	
	checkboxes.forEach((checkbox) => {
	  checkbox.checked = selectAll.checked
	})
}

$(document).ready(function() {
	
	//선택
	$('#select').click(function() {
		var sel = $('input[name="select"]:checked').val()
		console.log(sel)
		
		//왜 위의 2개만 인식하지...
		//삭제
		$('#delOk').click(function() {
			if (confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')) {
				location.href = "./delete?galleryNo=" + sel
			}
		})
	})

	$("#btnSearch").click(function() {
		location.href = "./search?keyword" + $('input[name="keyword"]:checked').val();
	})
	
})

</script>

<h1>갤러리 게시글 리스트</h1>
<hr>

<select id="category" name="category" required onchange="window.open(value,'_self')">
    <option value="" disabled selected>카테고리</option>
    <option value="/admin/gallery/list">갤러리</option>
    <option value="/admin/goods/list">상품리뷰</option>
    <option value="/admin/place/list">명소후기</option>
</select>

<form action="./search" method="get" style="float: right;">
	<input id="search" type="text" placeholder="검색어를 입력하세요" name="keyword">
	<button class="btnSearch">검색</button>
</form>

<br><br>

<table class="table table-striped table-hover table-condensed">
<thead>
	<tr>
		<th><input type='checkbox' name='all' value='selectall' onclick='selectAll(this)'/> 전체선택</th>
		<th>작성자</th>
		<th>제목</th>
		<th>내용</th>
		<th>위치</th>
		<th>태그</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td><input id="select" type="checkbox" name="select" value="${b.galleryNo }"></td>
		<td>${b.uId }</td>
		<td><a href="./view?galleryNo=${b.galleryNo }">${b.galleryTitle }</a></td>
		<td>${b.galleryContent }</td>
		<td>${b.galleryLoc }</td>
		<td>${b.galleryTag }</td>
		<td><fmt:formatDate value="${b.galleryDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span><br><br>

<button id="delOk" class="btn btn-primary" style="float: right">삭제</button><br>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />