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
	
	//checkBox 선택된 게시글 삭제
	$(".selectDelete_btn").click(function(){
	  var confirm_val = confirm("[게시글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   $("input[class='chBox']:checked").each(function(){
	    checkArr.push($(this).attr("select_data"));
	   });
	    
	   $.ajax({
	    url : "./deletee",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
		     if(result == 1) {            
		      alert("상품이 삭제되었습니다");
		      history.go(0);
		     } else {
		      alert("삭제 실패");
		     }
		    }
	   });
	  } 
	 });

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
		<th style="width: 10%;"><input type="checkbox" name="allCheck" id="allCheck" /></th>

		<script>
		$("#allCheck").click(function(){
		 var chk = $("#allCheck").prop("checked");
		 if(chk) {
		  $(".chBox").prop("checked", true);
		 } else {
		  $(".chBox").prop("checked", false);
		 }
		});
		</script>
		
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
		<td><input type="checkbox" name="chBox" class="chBox" select_data="${p.gId }"></td>
		
		<script>
		 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
		</script>
		
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

<button type="button" class="selectDelete_btn btn btn-danger" style="float: right;">선택 삭제</button> 

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />