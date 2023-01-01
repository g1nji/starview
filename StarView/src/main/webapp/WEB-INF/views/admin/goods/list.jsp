<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	//checkBox 선택된 게시글 삭제
	$(".selectDelete_btn").click(function(){
	  var confirm_val = confirm("[게시글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   $("input[class='chBox']:checked").each(function(){
	    checkArr.push($(this).attr("select_data"));
	   });
	    
	   console.log(checkArr);
	   
	   $.ajax({
	    url : "./deletee",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
	     if(result == 1) {            
	      alert("게시글이 삭제되었습니다");
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

<h1 style="text-align: center;">상품 리뷰 리스트</h1>
<hr>

<select id="category" name="category" required onchange="window.open(value,'_self')">
    <option value="" disabled selected>카테고리</option>
    <option value="/admin/gallery/list">갤러리</option>
    <option value="/admin/goods/list">상품리뷰</option>
    <option value="/admin/place/list">명소후기</option>
</select>

<form id="searchForm" action="./search" method="get" style="float: right;">
    <input id="keyword" name="keyword" type="text" placeholder="검색할 아이디를 입력하세요" value="">
	<button class="btnSearch btn btn-default">검색</button>
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
		
		<th>작성자</th>
		<th>제목</th>
		<th>내용</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td><input type="checkbox" name="chBox" class="chBox" select_data="${b.rId }"></td>
		
		<script>
		 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
		</script>
		
		<td>${b.uId }</td>
		<td><a href="./view?rId=${b.rId }">${b.rTitle }</a></td>
		<td>${b.rContent }</td>
		<td><fmt:formatDate value="${b.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span><br><br>

<button type="button" class="selectDelete_btn btn btn-danger" style="float: right;">선택 삭제</button> 

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />