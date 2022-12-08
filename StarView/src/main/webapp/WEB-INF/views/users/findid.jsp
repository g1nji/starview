<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

<style type="text/css">
html {
	text-align: center;
	margin: 0 auto;
	padding: 0 auto;
	display: 
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	if($('#phone').val() != ""){
		$('#phone').attr("checked", true);
	}
	
	$('#phone').click(function() {
		
		var chkValue = $('#phone').is(":checked");
		
		if( chkValue ) {
			$('#phoneDiv').css('display', 'block');
			$('#emailDiv').css('display', 'none')
		}
		
		
	})
	
	$('#email').click(function() {
		
		var chkValue = $('#email').is(":checked");
		
		if( chkValue ) {
			$('#phoneDiv').css('display', 'none');
			$('#emailDiv').css('display', 'block')
		}
		
		
	})
	
	
	
	
})
</script>

<!-- 휴대전화 입력 유효성 검사 -->
<script type="text/javascript">
const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
</script>

</head>
<body>

<h1>별보러가자</h1>
<br>
<h3>아이디 찾기</h3>
<br>
<br>

<form action="./findid" method="post">

<input type="radio" name="find" id="phone" checked="checked" value="phone">전화번호로 찾기<br><br>

<div id="phoneDiv">

<label for="name">이름</label>
<input type="text" id="phoneName" name="phoneName"><br>

<label for="uPhone">전화번호</label>
<input type="text" id="uPhone" name="uPhone" oninput="autoHyphen2(this)" maxlength="13" placeholder="전화번호를 입력해보세요!">
<button type="button">인증번호</button><br>
<input type="text" id="passPhone" name="passPhone">

</div>


<br>

<input type="radio" name="find" id="email" value="email">이메일로 찾기<br><br>

<div id="emailDiv" style="display: none;">

<label for="name">이름</label>
<input type="text" id="mailName" name="mailName"><br>

<label for="name">이메일</label>
<input type="text" id="uEmail" name="uEmail">
<button type="button">인증번호</button><br>
<input type="text" id="passMail" name="passMail">

</div>

<button>찾기</button>

</form>

</body>
</html>