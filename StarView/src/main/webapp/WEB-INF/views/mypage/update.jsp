<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html {
	text-align: center;
	margin: 0 auto;
	padding: 0 auto;
}
</style>
<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }
				var addup = '';
				
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
                $('#uAddress').val($('#sample6_address').val() + " " + $('#sample6_detailAddress').val());
            }
        }).open();
    }
</script>
<!-- 휴대전화 입력 유효성 검사 -->
<script type="text/javascript">
$(document).ready(function () {
	$("form").submit(function() {
		$("#addressSubmit").val( $("#sample6_address").val() + " " + $("#sample6_detailAddress").val() )
	})
	
})


const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
</script>

</head>
<body>

<h1>마이페이지 수정</h1>
<hr>
<form action="/mypage/update" method="post" id="form">
<h3>아이디:<input type="text" name="uId" value="${users.uId}" readonly></h3>
<h3>비밀번호:<input type="password" value="${users.uPw}" name="uPw"></h3>
<h3>이름:<input type="text" value="${users.uName}" name="uName"></h3>
<h3>닉네임:<input type="text" value="${users.uNick}" name="uNick"></h3>
<h3>주소:<input type="text" id="uAddress" value="${users.uAddress}" name="uAddress">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
</h3>


<h3>생년월일:<input type="text" value="${users.uBirth}" name="uBirth"readonly></h3>
<h3>성별:<input type="text" value="${users.uGender}" name="uGender"readonly></h3>
<h3>이메일:<input type="text" value="${users.uEmail }" name="uEmail"></h3>
<h3>전화번호:<input type="text" value="${users.uPhone }" name="uPhone" oninput="autoHyphen2(this)" maxlength="13"></h3>

<a href="./main"><button>메인</button></a>
<input type="submit" id="savebtn" value="저장" ><!-- onclick='save()' -->
<input type="text" id="sample6_postcode" placeholder="우편번호" hidden="hidden">
<input type="text" id="sample6_address" name="uAdd1" hidden="hidden"><br>
<input type="text" id="sample6_detailAddress" name="uAdd2" hidden="hidden"><br>
<input type="text" id="sample6_extraAddress" hidden="hidden">



</form>
</body>
</html>
<c:import url="../layout/footer.jsp" />