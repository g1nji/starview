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

</style>

<script type="text/javascript">

$(document).ready(function() {
	
	//검색
	$("#btnSearch").click(function() {
		location.href = "./search?keyword" + $('input[name="keyword"]:checked').val();
	})
	
	var searchForm = $('#searchForm');
	$('#searchForm button').on('click', function(e) {
		if (!searchForm.find('input[name="keyword"]').val()) {
			alert('검색어를 입력하세요');
			return false;
		}
		e.preventDefault();
		searchForm.submit();
		location.href = "./search?keyword=" + document.getElementById('keyword').value;
	});

})

</script>

<h1>상품 리뷰 리스트</h1>
<hr>

<select id="category" name="category" required onchange="window.open(value,'_self')">
    <option value="" disabled selected>카테고리</option>
    <option value="/admin/gallery/list">갤러리</option>
    <option value="/admin/goods/list">상품리뷰</option>
    <option value="/admin/place/list">명소후기</option>
</select>

<form id="searchForm" action="./search" method="get" style="float: right;">
    <input id="keyword" name="keyword" type="text" placeholder="검색할 상품명을 입력하세요" value="">
	<button class="btnSearch">검색</button>
</form>

<br><br>

<table class="table table-hover">
<thead>
	<tr class="warning">
		<th style="width: 10%"><input type='checkbox' name='all' value='selectall' onclick='selectAll(this)'/></th>
		<th style="width: 15%;">작성자</th>
		<th>제목</th>
		<th>내용</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td style="width: 10%"><input id="select" type="checkbox" name="select" value="${b.rId }"></td>
		<td style="width: 20%">${b.uId }</td>
		<td><a href="./view?rId=${b.rId }">${b.rTitle }</a></td>
		<td>${b.rContent }</td>
		<td><fmt:formatDate value="${b.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span><br><br>

<button id="delOk" class="btn btn-danger" style="float: right">삭제</button><br>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />