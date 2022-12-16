<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="wrap">

<h1>주문/결제</h1>
<hr>

<form action="/order/result">
<h3>주문내역</h3>
<p>주문상품정보</p>
상품이미지 / 상품명 / 단가 / 수량 / 소계금액<br>
<p>총 주문금액</p>

<hr>

<h3>주문자 정보</h3>
주문자명 / 전화번호 / 이메일

<hr>

<h3>수취인 정보</h3>
받으실 분 / 받으실 곳 / 전화번호 / 배송요청사항

<hr>

<h3>결제 수단</h3>
~결제수단 목록~

<h3>결제 금액</h3>
<p>주문금액</p>
<p>배송비</p>
<p>총 결제금액</p>

<button>다음으로</button>
</form>

</div>

<c:import url="../layout/footer.jsp" />