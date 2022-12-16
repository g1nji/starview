<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<div class="wrap">
<h1>주문완료</h1>
<hr>

${uNick }님의 주문이 완료되었습니다.<br>
귀하의 주문확인 번호는 ㅇㅇ입니다.<br>

<hr>

<h3>주문요약정보</h3>
<p>결제방법</p>
<p>결제금액</p>
<p>주문번호</p>
<p>주문자명</p>
<p>연락처</p>
<p>이메일</p>

<button>확인</button>

</div>

<c:import url="../layout/footer.jsp" />