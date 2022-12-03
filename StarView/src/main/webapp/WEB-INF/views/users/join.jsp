<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#mainDiv {
	width: 80%;
	border: 1px solid black;
	margin: 0 auto;
}

h4 {
	margin: 0 auto;
	text-align: left;
	padding-left: 35%;
}

input {
	width: 350px;
	height: 40px; 
	margin: 10px;
}

.resultDiv {
	font-size: 10px;
	color: red;
	margin: 0 auto;
    padding-left: 35%;
    text-align: left;
}

select {
    width: 100px;
    height: 40px;
    font-size: 20px;
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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">

//회원가입 버튼
$(document).ready(function() {
	
	$('#btnBack').click(function() {
		console.log("btnBack click")
		location.href = '/users/login';
		
	})
	
	$('#btngo').click(function() {
		//빈칸 검사
		if($('input[name="uId"]').val() == '') {
			$('input[name="uId"]').focus();
			return false;
			} 
		if ($('input[name="uPw"]').val() == '') {
				$('input[name="uPw"]').focus();
				return false;
			} else {
				if(validatePass($('#uPw').val())){
					if( $('#uPw').val() !== $('#uPwchc').val() ) {
						$('input[name="uPw"]').focus();
						return false;
					} 
				} else {
						$('input[name="uPw"]').focus();
						return false;
				}
			}
		if ($('input[name="uName"]').val() == '') {
				$('input[name="uName"]').focus();
				return false;
			}
		if ($('input[name="uNick"]').val() == '') {
				$('input[name="uNick"]').focus();
				return false;
			} 
		if ($('input[name="uAdd1"]').val() == '') {
				alert('주소 찾기를 통해 주소를 입력하세요.');
				$('input[name="uAdd1"]').focus();
				return false;
			}
		if ($('input[name="uAdd2"]').val() == '') {
				$('input[name="uAdd2"]').focus();
				return false;
			} 
		if ($('input[name="uBirth"]').val() == '') {
				$('input[name="uBirth"]').focus();
				return false;
			} 
		if ($('input[name="uPhone"]').val() == '') {
				$('input[name="uPhone"]').focus();
				return false;
			} 
		if ($('input[name="uBirth"]').val() == '') {
				$('input[name="uBirth"]').focus();
				return false;
			}
		if ($.trim($('#uEmail').val()).length == 0) {
			e.preventDefault();
		}
		//이메일 유효성 검사
		if (validateEmail($('#uEmail').val())) {
			$('form').submit();
		} else {
			alert('잘못된 이메일입니다');
			e.preventDefault();
		}
		//주소 파라미터 값 추가하기
		$('#uAddress').val($('#sample6_address').val() + " " + $('#sample6_detailAddress').val());
		
		
		
		$('form').submit();
		
		
	})
	

//div에 정보 전달
$('#uId').blur(function() {
	if($('#uId').val() === '') {
		$('#resultId').html("아이디를 입력하세요");
	} else {
		$('#resultId').html("");
	}
})
$('#uPw').blur(function() {
	if($('#uPw').val() === ''){
		$('#resultPw').html("비밀번호를 입력하세요");
	} else if(validatePass($('#uPw').val())) {
		$('#resultPw').html("");
	} else {
		$('#resultPw').html("특수문자, 숫자, 문자 8~16자리");
	}
})
$('#uPwchc').blur(function() {
	if($('#uPwchc').val() === ''){
		$('#resultPwchc').html("비밀번호를 재입력하세요");
	} else if( $('#uPw').val() !== $('#uPwchc').val() ) {
			$('#resultPwchc').html("입력한 비밀번호가 다릅니다.");
	} else {
		$('#resultPwchc').html("");
	}
})
$('#uName').blur(function() {
	if($('#uName').val() === '') {
		$('#resultName').html("이름을 입력하세요");
	} else {
		$('#resultName').html("");
	}
})
$('#sample6_detailAddress').blur(function() {
	if($('#sample6_detailAddress').val() === '') {
		$('#add2Div').html("상세주소를 입력하세요");
	} else {
		$('#add2Div').html("");
	}
})
$('#uNick').blur(function() {
	if($('#uNick').val() === ''){
		$('#resultNick').html("닉네임을 입력하세요");
	} else {
		$('#resultNick').html("");
	}
})
$('#uBirth').blur(function() {
	if($('#uBirth').val() === ''){
		$('#resultBirth').html("생년월일을 입력하세요");
	} else {
		$('#resultBirth').html("");
	}
})
$('#uEmail').blur(function() {
	if($('#uEmail').val() === ''){
		$('#resultEmail').html("이메일을 입력하세요");
	} else {
		$('#resultEmail').html("");
	}
})
$('#uPhone').blur(function() {
	if($('#uPhone').val() === ''){
		$('#resultPhone').html("전화번호를 입력하세요");
	} else {
		$('#resultPhone').html("");
	}
})

//아이디 중복 검사 버튼
$('#checkId').click(function() {
	
		console.log("#checkId click")
		
		var uId = $('#uId').val();
		
		$.ajax({
			type: "get"
			, url: "/users/checkid?uId="+uId
			, data: {}
			, dataType: "html"
			, contentType: "application/json; charset=UTF-8"
			, success: function(res) {
				
				console.log("AJAX 성공");
				
				console.log(res);
		        $("#resultId").html(res);
				
			}
			, error: function() {
				console.log("AJAX 실패")
				
			}
		});
		
	});
	
});



function validateEmail(remail) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	
	if( filter.test(remail)) {
		return true;
	} else {
		return false;
	}
	
}

function validatePass(password){
	var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	
	if( regExp.test(password) ) {
		return true;
	} else {
		return false;
	}
	
}

</script>

<!-- 생년월일 스크립트 -->
<script type="text/javascript">
$(document).ready(function(){            
    var now = new Date();
    var year = now.getFullYear();
    var mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
    var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
    //년도 selectbox만들기               
    for(var i = 1900 ; i <= year ; i++) {
        $('#year').append('<option value="' + i + '">' + i + '년</option>');    
    }

    // 월별 selectbox 만들기            
    for(var i=1; i <= 12; i++) {
        var mm = i > 9 ? i : "0"+i ;            
        $('#month').append('<option value="' + mm + '">' + mm + '월</option>');    
    }
    
    // 일별 selectbox 만들기
    for(var i=1; i <= 31; i++) {
        var dd = i > 9 ? i : "0"+i ;            
        $('#day').append('<option value="' + dd + '">' + dd+ '일</option>');    
    }
    $("#year  > option[value="+year+"]").attr("selected", "true");        
    $("#month  > option[value="+mon+"]").attr("selected", "true");    
    $("#day  > option[value="+day+"]").attr("selected", "true");     
    
    var yyyy = $('#year').val();
    var mmmm = $('#month').val();
    var dddd = $('#day').val();
    
    var uBirth = yyyy+"-"+mmmm+"-"+dddd;
    
    $('#uBirth').val(uBirth)
  
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
<hr>
<h3>회원가입</h3>

<div id="mainDiv">
<br>

<form action="./join" method="post">

<div id="idDiv" class="formDiv">
<h4><label for="uId"></label>아이디</h4>
<div id="resultId" class="resultDiv"></div>
<input type="text" id="uId" name="uId" style="width:250px;">
<input type="button" id="checkId" style="width:80px; font-size: 10px;" value="중복 검사">
<div id="resultCheckId"></div>
</div>

<div id="pwDiv" class="formDiv">
<h4><label for="uPw"></label>비밀번호</h4>
<div id="resultPw" class="resultDiv"></div>
<input type="password" id="uPw" name="uPw">
</div>

<div id="pwchcDiv" class="formDiv">
<h4><label for="uPwchc"></label>비밀번호 확인</h4>
<div id="resultPwchc" class="resultDiv"></div>
<input type="password" id="uPwchc" name="uPwchc">
</div>

<div id="nameDiv" class="formDiv">
<h4><label for="uName"></label>이름</h4>
<div id="resultName" class="resultDiv"></div>
<input type="text" id="uName" name="uName">
</div>

<div id="nickDiv" class="formDiv">
<h4><label for="uNick"></label>닉네임</h4>
<div id="resultNick" class="resultDiv"></div>
<input type="text" id="uNick" name="uNick">
</div>

<div id="addDiv" class="formDiv">
<h4><label for="uAddress"></label>주소</h4>
<div id="add2Div" class="resultDiv"></div>
<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:250px;" disabled="disabled">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:80px; font-size: 10px;"><br>
<input type="text" id="sample6_address" name="uAdd1" placeholder="주소" disabled="disabled"><br>
<input type="text" id="sample6_detailAddress" name="uAdd2" placeholder="상세주소"><br>
<input type="text" id="sample6_extraAddress" placeholder="참고항목">
<input type="text" id="uAddress" name="uAddress" hidden="hidden">
</div>

<div id="birthDiv" class="formDiv">
<h4><label for="uBirth"></label>생년월일</h4>
<div id="resultBirth" class="resultDiv"></div>
<select name="yy" id="year"></select>년
<select name="mm" id="month"></select>월
<select name="dd" id="day"></select>일
<input type="text" id="uBirth" name="uBirth" hidden="hidden">
</div>

<div id="genderDiv" class="formDiv">
<h4><label for="uGender"></label>성별</h4>
남<input type="radio" name="uGender" value="남자" style="width: 20px; height: 20px;" checked="checked">, 여<input type="radio" name="uGender" value="여자" style="width: 20px; height: 20px;">
</div>

<div id="emailDiv" class="formDiv">
<h4><label for="uEmail"></label>이메일</h4>
<div id="resultEmail" class="resultDiv"></div>
<input type="text" id="uEmail" name="uEmail" placeholder="이메일 형식에 맞춰 작성하세요">
</div>

<div id="phoneDiv" class="formDiv">
<h4><label for="uPhone"></label>전화번호</h4>
<div id="resultPhone" class="resultDiv"></div>
<input type="text" id="uPhone" name="uPhone" oninput="autoHyphen2(this)" maxlength="13" placeholder="전화번호를 입력해보세요!">


</div>

<button type="button" id="btnBack">뒤로가기</button>
<button type="button" id="btngo">회원가입</button>

</form>

</div>

</body>
</html>