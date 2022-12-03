<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$('#agreementAll').click(function(){
		var agreeA = $('#agreementAll').is(':checked');
		
		if(agreeA) {
			$('#agreement1').prop('checked',agreeA);
			$('#agreement2').prop('checked',agreeA);
		}
		if(!agreeA) {
			$('#agreement1').prop('checked',agreeA);
			$('#agreement2').prop('checked',agreeA);
		}

		console.log("agreeA", agreeA);
		
	});
	
	$('#btncancel').click(function(){
		history.back(-1);
	})

	$('#btngo').click(function(){
		var agree1 = document.getElementById('agreement1');
		var agree2 = document.getElementById('agreement2');
		console.log(agree1);
		console.log(agree2);
		
		var chx1 = agree1.checked;
		var chx2 = agree2.checked;
		console.log(chx1);
		console.log(chx2);
			
		if(chx1 == true && chx2 == true) {
			btngo();
		} else {
			alert("약관에 동의해주세요!");
		}
		
	})
		
})

function btngo() {
	location = '/users/join'
}

</script>


<style type="text/css">

html {
	text-align: center;
	margin: 0 auto;
	padding: 0 auto;
}

#agreebox {
	width:1200px;
	text-align: center;
	margin: 0 auto;
}

</style>

</head>
<body>

<h1>별보러가자</h1>
<hr>
<h3>회원가입</h3>

<div id="agreebox">

<label><input type="checkbox" id="agreementAll">전체 동의</label>

<fieldset>
	<legend><span>이용</span>약관</legend>
	<p>
		<label for="agreement1">아래 사항에 동의 합니다.</label>
		<input id="agreement1" type="checkbox" name="agreement1"/><br>
		<textarea id="text1" readonly cols="100" rows="5">
			이용약관
		</textarea>
	</p>
</fieldset>
<br>
<fieldset>
	<legend><span>개인정보</span>취급방침</legend>
	<p>
		<label for="agreement2">아래 사항에 동의 합니다.</label>
		<input id="agreement2" type="checkbox" name="agreement2"/><br>
		<textarea id="text2" readonly cols="100" rows="5">
			개인정보 방침 및 안내
		</textarea>
	</p>
</fieldset>

</div>

<button id="btncancel">취소</button>
<button id="btngo">확인</button>


</body>
</html>