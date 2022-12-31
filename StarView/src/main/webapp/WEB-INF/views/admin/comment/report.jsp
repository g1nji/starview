<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<h1 style="text-align: center;">신고 댓글 리스트</h1>
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
		<th>댓글내용</th>
		<th>신고일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${CommList }" var="c">
	<tr>
		<td><input type="checkbox" name="chBox" class="chBox" select_data="${c.cmNo }"></td>
		
		<script>
		 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
		</script>
		
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button type="button" class="selectDelete_btn btn btn-danger" style="float: right;">선택 삭제</button>

<c:import url="../layout/footer.jsp" />