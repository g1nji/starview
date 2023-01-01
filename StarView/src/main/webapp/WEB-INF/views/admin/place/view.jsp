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
	
	//게시글 삭제
	$("#btnDelete").click(function() {
		if(confirm('[게시글] \n삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?') == true) {
			alert("게시글이 삭제되었습니다")
			location.href = "./delete?sreviewNo=${viewBoard.sreviewNo }"
		}
	})
	
})

</script>

<h1 style="text-align: center;">명소 후기 상세 조회</h1>
<hr>

<table class="table">
<tr>
	<td class="warning" style="width: 15%">작성자</td>
	<td>${viewBoard.uNick} (아이디: ${viewBoard.uId})
	</td>
</tr>
<tr>
	<td class="warning">내용</td>
	<td>${viewBoard.sreviewContent }</td>
</tr>
<tr>
	<td class="warning" style="width: 10%">작성일</td>
	<td><fmt:formatDate value="${viewBoard.sreviewDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
</tr>
</table>

<div class="btns" style="text-align: center">
<button id="btnList" class="btn btn-default" style="display: inline-block;">목록</button>
<button id="btnDelete" class="btn btn-danger" style="display: inline-block;">삭제</button>
</div>

<c:import url="../layout/footer.jsp" />




