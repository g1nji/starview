<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>상품 업로드 페이지</h1>
<hr>

<form action="./insert" method="post">
	<label>상품명 <input type="text" name="gName"></label><br>
	<label>상품가격 <input type="text" name="gPrice"></label><br>
	<label>상품설명 <input type="text" name="gDetail"></label><br><br>
	
	<button>업로드</button>
</form>



</body>
</html>