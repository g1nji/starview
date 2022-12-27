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

<h1>댓글 리스트</h1>
<hr>

<form id="searchForm" action="./search" method="get" style="float: right;">
    <input id="keyword" name="keyword" type="text" placeholder="검색할 아이디를 입력하세요" value="">
	<button class="btnSearch">검색</button>
</form>

<br><br>

<table class="table table-hover">
<thead>
	<tr class="warning">
		<th><input type='checkbox' name='all' value='selectall' onclick='selectAll(this)'/></th>
		<th style="width: 10%; text-align: left;">작성자</th>
		<th style="width: 30%;">내용</th>
		<th style="width: 20%;">원글</th>
		<th style="width: 20%;">등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${commentList }" var="c">
	<tr>
		<td><input id="select" type="checkbox" name="select" value="${c.cmNo }"></td>
		<td>
			<strong style="font-size: 17px;">${c.uNick }</strong>
			<br> ${c.uId }
		</td>
		<td>${c.cmContent }</td>
		<td><a href="../gallery/view?galleryNo=${c.galleryNo }">원글</a>${c.galleryContent }</td>
		<td><fmt:formatDate value="${c.cmDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button id="delOk" class="btn btn-danger" style="float: right">삭제</button><br>

<c:import url="../layout/footer.jsp" />