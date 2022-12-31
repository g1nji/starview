<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	
	//상품 목록으로 이동
	$("#btnList").click(function() {
		location.href = "./list"
	})
	
	//상품 수정
	$("#btnUpdate").click(function() {
		location.href = "./update?gId=${viewProd.gId }"
	})
	
	//상품 삭제
	$("#btnDelete").click(function() {
		if(confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?') == true) {
			alert("상품이 삭제되었습니다")
			location.href = "./delete?gId=${viewProd.gId }"
		}
	})
})

</script>

<h1 style="text-align: center;">상품 상세 조회</h1>
<hr>

<table class="table">
<tr class="">
	<!-- 파일이 있는 경우만 -->
	<c:if test="${not empty prodFile}">
	<th rowspan="6" colspan="2">
		<img src='/prodFile/${prodFile.fileName }' style="width: 500px; height: 450px;" /><br>
	</th>
	</c:if>
	</tr>
	<tr>
	<th class="warning">상품명</th><td>${viewProd.gName}</td>
	<tr>
	<th class="warning">상품 등록일</th><td><fmt:formatDate value="${viewProd.regDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
	</tr>
	<tr>
	<th class="warning">상품 가격</th><td>${viewProd.gPrice }</td>
	</tr>
	<tr>
	<th class="warning">배송비</th><td>${viewProd.delPrice }</td>
	</tr>
	<tr>
	<th class="warning">상품 설명</th><td>${viewProd.gDetail }</td>
	</tr>
</table>

<br>

<div class="btns" style="text-align: center">
<button id="btnList" class="btn btn-default" style="display: inline-block;">목록</button>
	
	<!-- 아이디 추가 -->
	<button id="btnUpdate" class="btn btn-primary"  style="display: inline-block;">수정</button>
	<button id="btnDelete" class="btn btn-danger" style="display: inline-block;">삭제</button>
</div>

<c:import url="../layout/footer.jsp" />