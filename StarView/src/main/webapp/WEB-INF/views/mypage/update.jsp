<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<c:import url="../layout/mymenu.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
<style type="text/css">

/* .titlewrap{
    color: #373f57;
    font-size: 36px;
    font-weight: bold;
    letter-spacing: -3px;
    line-height: 56px;

} */
.myp{
	margin-left: 200px;
	margin-top: 80px;
}

.person_field_legend {
    margin-bottom: 12px;
    height: 24px;
    color: #373f57;
    font-size: 16px;
    letter-spacing: -1.14px;
    line-height: 1.5;
}

.person_field_table {
    width: 400px;
    border-collapse: collapse;
    table-layout: fixed;
    margin: 0 auto;
}
table {
    border-spacing: 0;
    border-collapse: collapse;
    font-family: "Malgun Gothic",dotum,gulim,sans-serif;
    font-size: inherit;
    line-height: 100%;
}

.person_field_table th {
    width: 135px;
    color: #8491a7;
    font-size: 14px;
    letter-spacing: -1px;
    line-height: 40px;
    vertical-align: top;
}
.person_field_table th, .person_field_table td {
    padding: 8px 0;
    border-bottom: 1px solid #eaedf4;
    text-align: left;
}
caption, th {
    text-align: left;
}

.person_field_table th, .person_field_table td {
    padding: 8px 0;
    border-bottom: 1px solid #eaedf4;
    text-align: left;
}
.person_field_body {
   	display: flex;
    padding: 4px 0;
    min-height: 32px;
    box-sizing: border-box;
    color: #373f57;
    font-size: 15px;
    letter-spacing: -1px;
    line-height: 32px;
    vertical-align: top;
}

.person_field_wrap{
	float:left;
	margin-left: 200px;
	margin-bottom: 50px;
}

.person_field_wrap2{
float:right;
}
input{
 	border: 1px solid #ccc;
}
#uGender, #uId, #uBirth{
	border: 1px solid transparent;
}

#addbtn{
	border-radius: 5px;
    position: relative;
    padding: 5px 5px;
    margin-left: 10px;
    text-align: center;
	outline: 0;
	border:0;
	font-weight: 600;
}

#savebtn{
	border-radius: 5px;
    position: relative;
    padding: 15px 5px;
    margin-top:30px;
    margin-left:130px;
    text-align: center;
	outline: 0;
	border:0;
	font-weight: 600;
	width:160px;
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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <script>
    $("#uPwck").on("click", function(){
      toastr.options.escapeHtml = true;
      toastr.options.closeButton = true;
      toastr.options.newestOnTop = false;
      toastr.options.progressBar = true;
      toastr.info('예제', '명월일지', {timeOut: 5000});
    });
  </script>
<!-- 휴대전화 입력 유효성 검사 -->
<script type="text/javascript">

const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
//유효성 검사
function validate() {
	
	if( !validatePW( $("#uPw").val() ) ) { //PW유효성 검증 실패
		return false; //submit 중단
	}
	
	if( !validateEmail( $("#uEmail").val() ) ) { 
		return false; //submit 중단
	}
	
	//모든 유효성 검증 성공	
	return true; //submit 허용하기
}

function validatePW( uPw ) {
	//패스워드 입력값 검증
	if( !/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/.test( uPw ) ) {
		toastr.options.escapeHtml = true;
	    toastr.options.closeButton = true;
	    toastr.options.newestOnTop = false;
		toastr.warning('영어대소문자, 숫자 8~16자만 입력하세요!','비밀번호', {timeOut: 10000}); 
		return false;
	   }
	
	//PW 유효성 검증 완료
	return true;
}	
		function validateEmail(uEmail) {
			 var regexEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 

			 if(!regexEmail.test( uEmail ) ) {
				 console.log("이멜실패")
				toastr.options.escapeHtml = true;
			    toastr.options.closeButton = true;
			    toastr.options.newestOnTop = false;
				toastr.info('이메일 형식을 맞춰주세요!  ex)abc@naver.com','이메일', {timeOut: 10000}); 
				return false;
			   }
				return true;
		}



$(document).ready(function () {
	$("form").submit(function() {
		
		$("#addressSubmit").val( $("#sample6_address").val() + " " + $("#sample6_detailAddress").val() )
		
	
	})
	
})
</script>

</head>
<body>
<div class="myp">
<h1 class="titlewrap">회원정보 수정</h1>
<hr>
</div>
<form action="/mypage/update" method="post" id="form" onsubmit="return validate();">
<div class="person_field_wrap">
                <h2 class="person_field_legend">기본정보</h2>
                <table class="person_field_table">
                    <tbody>
                    <tr class="person_field">
                        <th scope="row">아이디</th>
                        <td>
                            <div class="person_field_body">
                                  <input type="text" id="uId" name="uId" value="${users.uId}" readonly>
                                  </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">비밀번호</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="password" value="${users.uPw}" id="uPw" name="uPw">
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">이름</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${users.uName}" name="uName">
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">닉네임</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${users.uNick}" name="uNick">
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">생년월일</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" id="uBirth" value="${users.uBirth}" name="uBirth"readonly>
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">성별</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" id="uGender" value="${users.uGender}" name="uGender"readonly>
                            </div>
                        </td>
                    </tr>
                    
                    </tbody>
                </table>
            </div>
                    
	<div class="person_field_wrap2">
                <h2 class="person_field_legend">연락처 정보</h2>
                <table class="person_field_table">
                    <tbody>
                    <tr class="person_field">
                        <th scope="row">전화번호</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${users.uPhone }" name="uPhone" oninput="autoHyphen2(this)" maxlength="13">
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">이메일</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${users.uEmail }" name="uEmail" id="uEmail">
                            </div>
                        </td>
                    </tr>
					<tr class="person_field">
                        <th scope="row">주소</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" id="uAddress" value="${users.uAddress}" name="uAddress">
                            	<input type="button" id="addbtn"onclick="sample6_execDaumPostcode()" value="주소 찾기">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
				<input type="submit" id="savebtn" value="저 장" >
            </div>
<input type="text" id="sample6_postcode" placeholder="우편번호" hidden="hidden">
<input type="text" id="sample6_address" name="uAdd1" hidden="hidden"><br>
<input type="text" id="sample6_detailAddress" name="uAdd2" hidden="hidden"><br>
<input type="text" id="sample6_extraAddress" hidden="hidden">            
</form>                    
                    
                    
                     
<%-- <div class="mypagediv">
<form action="/mypage/update" method="post" id="form" onsubmit="return validate();">
<h3>아이디:<input type="text" id="uId" name="uId" value="${users.uId}" readonly></h3>
<h3>비밀번호:<input type="password" value="${users.uPw}" id="uPw" name="uPw"></h3>
<h3>이름:<input type="text" value="${users.uName}" name="uName"></h3>
<h3>닉네임:<input type="text" value="${users.uNick}" name="uNick"></h3>
<h3>주소:<input type="text" id="uAddress" value="${users.uAddress}" name="uAddress">
<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br>
</h3>
<h3>생년월일:<input type="text" value="${users.uBirth}" name="uBirth"readonly></h3>
<h3>성별:<input type="text" value="${users.uGender}" name="uGender"readonly></h3>
<h3>이메일:<input type="text" value="${users.uEmail }" name="uEmail" id="uEmail"></h3>
<h3>전화번호:<input type="text" value="${users.uPhone }" name="uPhone" oninput="autoHyphen2(this)" maxlength="13"></h3>

<input type="submit" id="savebtn" value="저장" ><!-- onclick='save()' -->
<input type="text" id="sample6_postcode" placeholder="우편번호" hidden="hidden">
<input type="text" id="sample6_address" name="uAdd1" hidden="hidden"><br>
<input type="text" id="sample6_detailAddress" name="uAdd2" hidden="hidden"><br>
<input type="text" id="sample6_extraAddress" hidden="hidden">



</form>
</div> --%>
</body>
</html>
<c:import url="../layout/footer.jsp" />