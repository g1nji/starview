<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

</script>

</head>
<body>

<h1>지역 입력</h1>

<form action="./time" method="get">
<label>지역 <input type="text" name="loc"></label><br>
<button>확인</button>
</form>

</body>
</html>

<c:import url="../layout/footer.jsp" />