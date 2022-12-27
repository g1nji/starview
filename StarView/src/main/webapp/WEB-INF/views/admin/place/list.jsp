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
		//console.log(sel)
		
		//하지만 해당 게시글의 delete기능을 아직 구현하지 않았다
		//삭제
		$('#delOk').click(function() {
			if (confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')) {
				location.href = "./delete?sreviewNo=" + sel
			}
		})
	})

})

</script>

<h1>명소 후기리스트</h1>
<hr>

<select id="category" name="category" required onchange="window.open(value,'_self')">
    <option value="" disabled selected>카테고리</option>
    <option value="/admin/gallery/list">갤러리</option>
    <option value="/admin/goods/list">상품리뷰</option>
    <option value="/admin/place/list">명소후기</option>
</select>
<br><br>

<table class="table table-hover">
<thead>
	<tr class="warning">
		<th><input type='checkbox' name='all' value='selectall' onclick='selectAll(this)'/> 전체선택</th>
		<th>작성자</th>
		<th>내용</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td><input id="select" type="checkbox" name="select" value="${b.sreviewNo }"></td>
		<td>${b.uId }</td>
		<td>${b.sreviewContent }</td>
		<td><fmt:formatDate value="${b.sreviewDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span><br><br>

<button id="delOk" class="btn btn-primary" style="float: right">삭제</button><br>

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />