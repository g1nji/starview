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
<style type="text/css">

.myp{
	margin-left: 158px;
	margin-top: 45px;
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
    width: 450px;
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
input{
 border: 1px solid transparent;
}

.person_field_wrap{
	float:left;
	margin-left: 160px;
	margin-bottom: 160px;
}

.person_field_wrap2{
float:right;
width:460px;
}

#uAddress,#uEmail, #uPhone{
	width:263px;
}

</style>

<script type="text/javascript">
function del(){
	if(confirm("사용하고 계신 아이디(${info.uId })를 탈퇴하시면 복구가 불가하오니 신중하게 선택하시기 바랍니다. 탈퇴하시겠습니까?")){
		location.href="./predelete";		
	}
	}
	
function up(){
	if(confirm("회원정보를 수정하시겠습니까?")){
		location.href="./preupdate";		
	}
	}
	

</script>

</head>
<body>
<div class="myp">
<h1 class="titlewrap">마이페이지</h1>
<hr>
</div>

<!-- <h1 class="titlewrap">개인정보 수정</h1>
<hr> -->
<form action="/mypage/update" method="post" id="form" onsubmit="return validate();">
<div class="person_field_wrap">
                <h2 class="person_field_legend">기본정보</h2>
                <table class="person_field_table">
                    <tbody>
                    <tr class="person_field">
                        <th scope="row">아이디</th>
                        <td>
                            <div class="person_field_body">
                                  <input type="text" id="uId" name="uId" value="${info.uId}" readonly>
                                  </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">비밀번호</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="password" value="${info.uPw}" id="uPw" name="uPw"readonly>
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">이름</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${info.uName}" name="uName"readonly>
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">닉네임</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${info.uNick}" name="uNick"readonly>
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">생년월일</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${info.uBirth}" name="uBirth"readonly>
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">성별</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${info.uGender}" name="uGender"readonly>
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
                            	<input type="text" value="${info.uPhone }" name="uPhone" oninput="autoHyphen2(this)" maxlength="13"readonly>
                            </div>
                        </td>
                    </tr>
                    <tr class="person_field">
                        <th scope="row">이메일</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" value="${info.uEmail }" name="uEmail" id="uEmail"readonly>
                            </div>
                        </td>
                    </tr>
					<tr class="person_field">
                        <th scope="row">주소</th>
                        <td>
                            <div class="person_field_body">
                            	<input type="text" id="uAddress" value="${info.uAddress}" name="uAddress">
                            </div>
<input type="text" id="uNo" value="${users.uNo}"hidden="hidden">   
                        </td>
                    </tr>
                    
                                        </tbody>
                </table>
            </div>
           
</form>            

<%-- <h3>아이디:${info.uId }</h3>
<h3>패스워드:${info.uPw }</h3>
<h3>이름:${info.uName }</h3>
<h3>닉네임:${info.uNick }</h3>
<h3>주소:${info.uAddress }</h3>
<h3>생년월일:${info.uBirth }</h3>
<h3>성별:${info.uGender }</h3>
<h3>이메일:${info.uEmail }</h3>
<h3>전화번호:${info.uPhone }</h3> --%>

<!-- <a href="./main"><button>메인</button></a>
<input type="button" id="btn" value="탈퇴" onclick='del()'>
<input type="button" id="savebtn" value="수정" onclick='up()'> -->


</body>
</html>
<c:import url="../layout/footer.jsp" />