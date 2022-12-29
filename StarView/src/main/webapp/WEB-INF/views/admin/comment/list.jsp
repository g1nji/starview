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

//선택한 input태그 값 가져오기
function getCheckboxValue(e)  {
	  var sel = '';
	  if(e.target.checked)  {
	    sel = e.target.value;
	  } else {
	    sel = '';
	  }
	  
	  //console.log(sel);
}
	  
$(document).ready(function() {
	
	//checkBox 선택된 댓글 삭제
	$(".selectDelete_btn").click(function(){
	  var confirm_val = confirm("[댓글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?");
	  
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
	      alert("댓글이 삭제되었습니다");
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

<h1>갤러리 댓글 리스트</h1>
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
		
		<th>작성자</th>
		<th>내용</th>
		<th>등록일</th>
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
		
		<td>
			<strong style="font-size: 17px;">${c.uNick }</strong>
			<br> ${c.uId }
		</td>
		<td><a href="../gallery/view?galleryNo=${c.galleryNo }">${c.cmContent }</a></td>
		<td><fmt:formatDate value="${c.cmDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span><br><br>

<button type="button" class="selectDelete_btn btn btn-danger" style="float: right;">선택 삭제</button> 

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />