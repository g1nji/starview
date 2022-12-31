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
	    
	   $.ajax({
	    url : "./deleteee",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
		     if(result == 1) {            
		      alert("댓글이 삭제되었습니다");
		      history.go(0);
		     } else {
		      alert("삭제 실패");
		     }
		    }
	   });
	  } 
	 });

})

</script>

<h1 style="text-align: center;">신고 댓글 리스트</h1>
<hr>

<!-- 
<form id="searchForm" action="./search" method="get" style="float: right;">
    <input id="keyword" name="keyword" type="text" placeholder="검색할 아이디를 입력하세요" value="">
	<button class="btnSearch">검색</button>
</form>
 -->
 
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
		
		<th>댓글번호</th>
		<th>신고일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${commList }" var="c">
	<tr>
		<td><input type="checkbox" name="chBox" class="chBox" select_data="${c.cmNo }"></td>
		
		<script>
		 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
		</script>
		
		<td><a href="/gallery/view?galleryNo=${c.galleryNo }">${c.cmNo }</td>
		<td>${c.reportDate }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span><br><br>

<button type="button" class="selectDelete_btn btn btn-danger" style="float: right;">선택 삭제</button> 

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />