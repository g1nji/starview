<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<h1 style="text-align: center;">'${keyword }'의 검색 결과</h1>
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
		
		<th>작성자</th>
		<th>내용</th>
		<th>등록일</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${searchList }" var="b">
	<tr>
		<tr>
		<td><input type="checkbox" name="chBox" class="chBox" select_data="${b.sreviewNo }"></td>
		
		<script>
		 $(".chBox").click(function(){
		  $("#allCheck").prop("checked", false);
		 });
		</script>
		<td>${b.uId }</td>
		<td>
			<a href="./view?sreviewNo=${b.sreviewNo }">${b.sreviewContent }</a>
			<br>
			<a href="/place/view?sreviewNo=${b.sreviewNo }">게시글로 이동</a>
		</td>
		<td><fmt:formatDate value="${b.sreviewDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</tbody>
</table>

<button class="btnBack btn btn-default" onclick="location.href='./list'" style="float:right;">다시 검색하기</button>

<c:import url="../layout/footer.jsp" />