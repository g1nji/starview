<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


#mywrap {
    position: fixed;
    top: 100px;
    bottom: 0;
    left: 0;
    z-index: 25;
    width: 271px;
/*     border-right: 1px solid #f0f0f0; */
    margin-top: 80px;
    text-align: center;
	padding: 0 auto;
}

#mywrap .mymenu>li {
    position: relative;
}
ol, ul, li {
    list-style: none;
}

.mymenu{
margin-top: 50px;

}
.myli{
margin-top: 50px;

}
</style>
</head>
<body>

<div id="mywrap">    
    <ul class="mymenu">
        <li class="myli"><a href="/mypage/mypage">MY홈</a></li>
        <li class="myli"><a href="./preupdate">회원정보 수정</a></li>  
        <li class="myli"><a href="./predelete">회원 탈퇴</a></li>  
        <li class="myli"><a href="">게시글 확인</a></li>  
        <li class="myli"><a href="">찜목록 확인</a></li>  
        <li class="myli"><a href="">리뷰확인</a></li>  
    </ul>
</div>




</body>
</html>