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
	
	//checkBox 선택된 게시글 삭제
	$(".selectDelete_btn").click(function(){
	  var confirm_val = confirm("[게시글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   $("input[class='chBox']:checked").each(function(){
	    checkArr.push($(this).attr("select_data"));
	   });
	    
	   $.ajax({
	    url : "./deletesel",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
		     if(result == 1) {            
		      alert("게시글이 삭제되었습니다");
		      location.href = "./list";
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
		<th>위치</th>
		<th>태그</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td><input type="checkbox" name="chBox" class="chBox" select_data="${b.galleryNo }"></td>
		
		<script>
		 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
		</script>
		
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

<button type="button" class="selectDelete_btn btn btn-danger" style="float: right;">선택 삭제</button> 

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />