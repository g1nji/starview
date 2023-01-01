<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<style type="text/css">
h2 {
	text-align: center;
}

.step {
	width: 60%;
	margin: 0 auto;
	padding-top: 20px;
	text-align: center;
}

.stepImg {
	margin: 0 auto;
	width: 70px;
	height: 70px;
	border-radius: 50px;
	background-color: #f6f6f6;
}

.stepImg2 {
	margin: 0 auto;
	width: 75px;
	height: 75px;
	border-radius: 50px;
	background-color: #FFB703;
}

.th {
	height: 50px;
    text-align: center;
    width: 20%;
    background-color: #f6f6f6;
    border-bottom: #eee
}

.td {
	text-align: left;
	padding-left: 20px;
}
</style>

<div class="wrap">
<h2>주문완료</h2>
<div class="step">
	<table style="width:100%;">
		<tr>
			<td><div class="stepImg"><img src="/resources/image/shopping-cart.png" style="width:45%; padding-top: 10px;"></div></td>
			<td>></td>
			<td><div class="stepImg"><img src="/resources/image/credit.png" style="width:50%; margin-top: 23px;"></div></td>
			<td>></td>
			<td><div class="stepImg2"><img src="/resources/image/order-finish.png" style="width:50%; margin-top: 21px;"></div></td>
		</tr>
		<tr>
			<td style="padding-top: 10px;">장바구니</td>
			<td></td>
			<td style="padding-top: 10px;">주문/결제</td>
			<td></td>
			<td style="padding-top: 10px;">주문완료</td>
		</tr>
	</table>
</div>

<div style="text-align: center; font-size: 16px; font-weight: 500; margin: 30px 0;">
<c:if test="${uId eq null }">
비회원님의 주문이 완료되었습니다.<br>
</c:if>
<c:if test="${uId ne null }">
${uNick }님의 주문이 완료되었습니다.<br>
</c:if>
주문확인 번호는 <span style="color:#FFB703;">${orderList.perchantUid }</span> 입니다.<br>
</div>

<h3>주문요약정보</h3>
<table style="border-top: 2px solid black; border-bottom: 1px solid #eee; width: 100%; text-align: center;">
	<tr>
		<th class="th">결제방법</th>
		<td class="td">카카오페이</td>
	</tr>
	<tr>
		<th class="th">결제금액</th>
		<td class="td">${orderList.paymentAmount }</td>
	</tr>
	<tr>
		<th class="th">주문자명</th>
		<td class="td">${orderList.buyerName }</td>
	</tr>
	<tr>
		<th class="th">연락처</th>
		<td class="td">${orderList.buyerPhone }</td>
	</tr>
	<tr>
		<th class="th">이메일</th>
		<td class="td">${orderList.buyerEmail }</td>
	</tr>
</table>

</div>

<c:import url="../layout/footer.jsp" />