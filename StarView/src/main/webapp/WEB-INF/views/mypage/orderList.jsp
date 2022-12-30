<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />
<c:import url="../layout/mymenu.jsp" />

<script type="text/javascript">
$(document).ready(function(){
	
	$('.detail').hide();
	
	$('.detailBtn').click(function() {
		$('.detail').toggle();
	})
	
})
</script>

<style type="text/css">

th, td {
	border:1px solid; border-collapse: collapse;
}

.wrap{
	height: 100%;
	margin-left: 200px;
	margin-top: 80px;
}

</style>

<div class="wrap">
<h1>주문내역/배송조회</h1>
<hr>

<table style="width:100%;">
	<tr>
		<td>주문일 : </td>
		<td>주문번호 : </td>
		<td>주문진행 : </td>
		<td>배송조회</td>
	</tr>
	<tr>
		<td rowspan="3">상품이미지</td>
		<td colspan="3">상품명</td>
	</tr>
	<tr>
		<td colspan="3">갯수</td>
	</tr>
	<tr>
		<td colspan="3">금액</td>
	</tr>
	<tr>
		<td colspan="4">합계 : </td>
	</tr>
	<tr>
		<td colspan="4"><button class="detailBtn">주문 상세보기</button></td>
	</tr>
	<tr class="detail">
		<td colspan="2">주소</td>
		<td>결제방법</td>
		<td>취소</td>
	</tr>
</table>


</div>


<c:import url="../layout/footer.jsp" />