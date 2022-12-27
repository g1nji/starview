<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

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
	text-align: center;
	margin: 0 auto;
}
textarea{
	text-align: center;

}
</style>


<h3>회원가입</h3>

<div id="agreebox">

<label><input type="checkbox" id="agreementAll">전체 동의</label>

<fieldset>
	<legend><span>이용</span>약관</legend>
	<p>
		<label for="agreement1">아래 사항에 동의 합니다.</label>
		<input id="agreement1" type="checkbox" name="agreement1"/><br>
		<textarea id="text1" readonly cols="100" rows="5">
제1조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1) '회원'(회원 또는 유저)라 함은 서비스를 제공받기 위하여 회사와 이용 계약을 체결하고 회원 ID(아이디)를 부여받은 사람을 말합니다.
2) '이용계약'이라 함은 서비스를 제공받기 위하여 회사와 체결하는 계약을 말합니다.
3) '회원(회원 또는 유저) ID(아이디)' 라 함은 회원의 식별과 서비스 이용을 위하여 회원이 선정하고 회사가 승인 또는 부여하는 이메일이나 문자와 숫자의 조합을 말합니다.
4) '비밀번호(암호)'라 함은 회원이 사용하는 회원 ID와 일치된 회원임을 확인하고 회원의 권익보호를 위하여 회원이 선정한 문자와 숫자의 조합을 말합니다.
5) '탈퇴'라 함은 회사와 회원이 이용계약을 더 이상 지속하지 않는 것을 말합니다.
6) '서비스'라 함은 회사의 별보러가자를 통해 제공하는 콘텐츠 등 일체의 행위를 말합니다.
제2조 (서비스 이용계약의 성립)
1) 이용계약은 별보러가자 회원가입 시 등록한 이용 신청에 대하여 회사가 승낙함으로써 성립합니다.
2) 이용약관에 대한 동의는 이용신청 당시 '이용약관에 동의' 버튼을 체크함으로써 이 약관에 동의하는 것으로 간주됩니다.
3) 회사는 회원에게 필요 시 실명확인 및 본인인증을 요청할 수 있으며, 그 절차와 방식은 이용약관 및 관계법령에 따릅니다.
		</textarea>
	</p>
</fieldset>
<br>
<fieldset>
	<legend><span>개인정보</span>취급방침</legend>
	<p>
		<label for="agreement2">아래 사항에 동의 합니다.</label>
		<input id="agreement2" type="checkbox" name="agreement2"/><br>
		<textarea id="text2" readonly cols="100" rows="5" >
제3조 (개인정보의 보호 및 사용)
1) 회사는 회원의 개인정보를 보호하기 위해 노력하여야 하며 관련 법령 및 회사의 개인정보취급방침이 적용됩니다. 단, 회사 이외의 링크된 사이트에서는 회사의 개인정보취급방침이 적용되지 않습니다.
2) 회사는 다음과 같은 경우에 법이 허용하는 범위 내에서 회원의 개인정보를 제3자에게 제공할 수 있습니다.
① 수사기관이나 기타 정부기관으로부터 정보제공을 요청받은 경우
② 회원의 법령 또는 약관의 위반을 포함하여 부정행위 확인 등의 정보보호 업무를 위해 필요한 경우
③ 기타 법률에 의해 요구되는 경우
		</textarea>
	</p>
</fieldset>

</div>

<button id="btncancel">취소</button>
<button id="btngo">확인</button>

<c:import url="../layout/footer.jsp" />