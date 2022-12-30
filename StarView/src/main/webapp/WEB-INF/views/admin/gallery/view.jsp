<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//게시글 리스트로 이동
	$("#btnList").click(function() {
		location.href = "./list"
	})
	
	//신고 기능 구현 후 여기서는 주석 처리할 것
	//게시글 신고
	$("#btnReport").click(function(){
	  var confirm_val = confirm("[게시글] \n정말로 신고하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   checkArr.push($(this).attr("select_data"));
	   
	   $.ajax({
	    url : "./reportt",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
	     if(result == 1) {            
	      alert("게시글이 신고되었습니다");
	     } else {
	      alert("신고 실패");
	     }
		}
	   });
	  } 
	 });
	
	//게시글 삭제
	$("#btnDelete").click(function() {
		if(confirm('[게시글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?') == true) {
			alert("게시글이 삭제되었습니다")
			location.href = "./delete?galleryNo=${viewBoard.galleryNo }"
		}
	})
	
	//신고 기능 구현 후 여기서는 주석 처리할 것
	//댓글 신고
	$(".report_btn").click(function(){
	  var confirm_val = confirm("[댓글] \n정말로 신고하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = $(this).attr("select_data");
	   console.log(checkArr);
	   
	   $.ajax({
	    url : "../comment/reportt",
	    type : "post",
	    data : { checkArr },
	    success : function(result){
	     if(result == 1) {            
	      alert("댓글이 신고되었습니다");
	     } else {
	      alert("신고 실패");
	     }
		}
	   });
	  } 
	 });
	
	//댓글 삭제
	$(".delete_btn").click(function(){
	  var confirm_val = confirm("[댓글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = $(this).attr("select_data");
	   console.log(checkArr);
	   
	   $.ajax({
	    url : "../comment/delete",
	    type : "post",
	    data : { checkArr },
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


<style type="text/css">

table {
	table-layout: fixed;
}

</style>

<h1>게시글 상세 조회</h1>
<hr>

<table class="table">
<tr>
	<!-- 파일이 있는 경우만 -->
	<c:if test="${not empty boardFile}">
	<td rowspan="6">
		<img src='/boardFile/${boardFile.storedName }' style="width: 500px; height: 500px;" /><br>
	</td>
	</c:if>
	<td class="warning" style="width: 7%">작성자</td>
	<td>${viewBoard.uNick} (아이디: ${viewBoard.uId})
	</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">제목</td>
	<td>${viewBoard.galleryTitle }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">내용</td>
	<td>${viewBoard.galleryContent }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">작성일</td>
	<td><fmt:formatDate value="${viewBoard.galleryDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
<!-- <tr>
	<td class="warning" style="width: 10%">조회수</td>
	<td>${viewBoard.galleryHit }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">추천수</td>
	<td>${viewBoard.galleryLike }</td>
</tr> -->
<tr>
	<td class="warning" style="width: 10%">위치</td>
	<td>${viewBoard.galleryLoc }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">태그</td>
	<td>${viewBoard.galleryTag }</td>
</tr>
</table>

<!-- 아이디 추가 -->
<div class="btns" style="text-align: center">
<button id="btnReport" class="btn btn-primary" style="display: inline-block;" value="${viewBoard.galleryNo }" select_data="${viewBoard.galleryNo }">신고</button>
<button id="btnDelete" class="btn btn-danger" style="display: inline-block;">삭제</button>
</div>

<hr>
<h4><strong>댓글 목록</strong></h4>
<c:forEach items="${viewComm }" var="c">
	<table class="table">
		<tr>
			<td class="warning" style="width: 20%"><strong>${c.uNick }</strong> ( <fmt:formatDate value="${c.cmDate }" pattern="yy/MM/dd HH:mm" /> )</td>
			<td colspan="2" style="width: 68%">${c.cmContent }</td>
	
			<td>
				<button type="button" class="report_btn btn-primary btn-sm" value="${c.cmNo }" select_data="${c.cmNo }">신고</button>
				<button type="button" class="delete_btn btn-danger btn-sm" value="${c.cmNo }" select_data="${c.cmNo }">삭제</button>
			</td>
		</tr>
	</table>
</c:forEach>

<c:import url="../layout/footer.jsp" />