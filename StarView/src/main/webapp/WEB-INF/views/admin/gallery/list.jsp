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
	
	var searchForm = $('#searchForm');
	$('#searchForm button').on('click', function(e) {
		/* if (!searchForm.find('option:selected').val()) {
			alert('검색항목을 선택하세요');
			return false;
		} */
		if (!searchForm.find('input[name="keyword"]').val()) {
			alert('검색어를 입력하세요');
			return false;
		}
		e.preventDefault();
		
		//var option = $('#option option:selected').val();
		//var keyword = document.getElementById('keyword').value;
		//var keyword = $('input[name="keyword"]:checked').val();
		searchForm.submit();
		//location.href = "./search?option=" + $('#option option:selected').val() + "&keyword=" document.getElementById('keyword').value;
		//location.href = "./search?" + $('#option option:selected').val() + "=" + document.getElementById('keyword').value;
		location.href = "./search?keyword=" + document.getElementById('keyword').value;
	});
	
})

</script>

<h1>갤러리 리스트</h1>
<hr>

<select id="category" name="category" required onchange="window.open(value,'_self')">
    <option value="" disabled selected>카테고리</option>
    <option value="/admin/gallery/list">갤러리</option>
    <option value="/admin/goods/list">상품리뷰</option>
    <option value="/admin/place/list">명소후기</option>
</select>

<form id="searchForm" action="./search" method="get" style="float: right;">
    <!-- <select id="option" name="option">
        <option value="">검색 항목</option>
        <option value="galleryTitle">제목</option>
        <option value="galleryContent">내용</option>
        <option value="uId">작성자</option>
    </select> -->
    <input id="keyword" name="keyword" type="text" placeholder="검색할 아이디를 입력하세요" value="">
	<button class="btnSearch">검색</button>
</form>
<br><br>

<table class="table table-hover">
<thead>
	<tr class="warning">
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

<button id="delOk" class="btn btn-danger" style="float: right">삭제</button><br>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />