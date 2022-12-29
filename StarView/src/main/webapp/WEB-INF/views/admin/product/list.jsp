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
	
	//구현중
	//선택
	$('#select').click(function() {
		var sel = $('input[name="select"]:checked').val()
		//console.log(sel)
		
		//삭제
		$('#delOk').click(function() {
			if (confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')) {
				location.href = "./delete?gId=" + sel
			}
		})
	})

})

</script>

<h1>상품 리스트</h1>
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
		<th>상품명</th>
		<th>상품 가격</th>
		<th>상품 설명</th>
		<th>배송비</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${prodList }" var="p">
	<tr>
		<td><input id="select" type="checkbox" name="select" value="${p.gId }"></td>
		<td><a href="./view?gId=${p.gId }">${p.gName }</a></td>
		<td>${p.gPrice }</td>
		<td>${p.gDetail }</td>
		<td>${p.delPrice }</td>
		<td><fmt:formatDate value="${p.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<%-- <td>${p.fileName }</td> --%>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span><br><br>

<button id="delOk" class="btn btn-danger" style="float: right">삭제</button><br>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />