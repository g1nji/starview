<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	//checkBox 선택된 추천일 삭제
	$(".selectDelete_btn").click(function(){
	  var confirm_val = confirm("[추천일] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?");
	  
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
	      alert("추천일이 삭제되었습니다");
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

<h1 style="text-align: center;">추천일 리스트</h1>
<hr>

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
		
		<th style="width: 10%;">지역</th>
		<th style="width: 20%;">추천일</th>
		<th style="width: 20%;">추천 시간</th>
		<th>내용</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td><input type="checkbox" name="chBox" class="chBox" select_data="${b.recomCode }"></td>
		
		<script>
		 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
		</script>
		
		<td>${b.recomLoc }</td>
		<td>
			<a href="../calendar/view?recomCode=${b.recomCode }">${b.recomDate }</a>&nbsp;
			<button id="btnUpdate" class="btn btn-primary btn-xs" onclick="location.href='./update?recomCode=${b.recomCode }'" style="display: inline-block;">수정</button>
		</td>
		<td>${b.recomTime }</td>
		<td><span style="color: #FF9494;">${b.rain}%</span>의 강수 확률로 예상되며, 기상 상태는 <span style="color: #FF9494;">${b.sky}</span>으로 예상됩니다.</td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-right">total : ${paging.totalCount }</span><br><br>

<button type="button" class="selectDelete_btn btn btn-danger" style="float: right;">선택 삭제</button> 

<c:import url="../layout/paging.jsp" />

<c:import url="../layout/footer.jsp" />