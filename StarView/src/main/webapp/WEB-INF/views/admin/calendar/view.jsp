<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	
	//추천일 리스트로 이동
	$("#btnList").click(function() {
		location.href = "./list"
	})
	
	//추천일 수정
	$("#btnUpdate").click(function() {
		location.href = "./update?recomCode=${viewBoard.recomCode }"
	})
	
	//추천일 삭제
	$("#btnDelete").click(function() {
		if(confirm('[추천일] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?') == true) {
			alert("추천일이 삭제되었습니다")
			location.href = "./delete?recomCode=${viewBoard.recomCode }"
		}
	})
	
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
<tr class="warning">
	<td>지역</td>
	<td>${viewBoard.recomLoc }</td>
</tr>
<tr>
	<td>추천일</td>
	<td>${viewBoard.recomDate }</td>
</tr>
<tr>
	<td>추천 시간</td>
	<td>${viewBoard.recomTime }</td>
</tr>
<tr>
	<td>강수 확률</td>
	<td>${viewBoard.rain }</td>
</tr>
<tr>
	<td>하늘 상태</td>
	<td>${viewBoard.sky }</td>
</tr>
</table>

<div class="btns" style="text-align: center">
<button id="btnUpdate" class="btn btn-primary" style="display: inline-block;">수정</button>
<button id="btnDelete" class="btn btn-danger" style="display: inline-block;">삭제</button>
</div>

<c:import url="../layout/footer.jsp" />