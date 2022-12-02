<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<script type="text/javascript">
//쿠키값 set
function setCookie(cookieName, value, exdays){
    let exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    let cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

//쿠키값 delete
function deleteCookie(cookieName){
    let expireDate = new Date();
    expireDate.setDate(expireDate.getDate() -1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}

//쿠키값 get
function getCookie(cookieName){
    cookieName = cookieName + "=";
    let cookieData = document.cookie;
    let start = cookieData.indexOf(cookieName);
    let cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        let end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue); //unescape로 디코딩 후 값 리턴
}

$(function(){
    /* id 저장 체크박스 기능 추가 */
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("#uId").val(userInputId); 

    if($("#uId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
        $("#rememberID").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }

    $("#rememberID").change(function(){ // 체크박스에 변화가 발생시
        if($("#rememberID").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("#uId").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });

    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#uId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#rememberID").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("#uId").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});


function logout() {
	
	location.href="/users/logout";
	
}

</script>

</head>
<body>
<h1>별보러가자</h1>
<hr>
<h3>로그인</h3>
<hr>
<br>

<form action="./login" method="post">

<label>ID: <input type="text" name="uId" value="${cookie.userInputId.value }"></label><br><br>

<label>PW: <input type="password" name="uPw"></label><br><br>

<label><input type="checkbox" id="rememberID" name="rememberID">Save ID</label><br><br>


<input type="submit" value=로그인>
<button type="button" onclick="logout();">로그아웃 임시버튼임 메인페이지 세션구현되면 수정해야함!</button>
<%-- 아이디 저장까진 잘되는데 체크 해제후 로그인 후 로그아웃하면 안되는 문제 해결해야할 듯. --%>

</form>


<br>

<button type="button" id="btnSocial">소셜 로그인</button><br><br>

<a>아이디 찾기</a> | <a>비밀번호 찾기</a> | <a href="/users/agree">회원가입</a>


</body>
</html>