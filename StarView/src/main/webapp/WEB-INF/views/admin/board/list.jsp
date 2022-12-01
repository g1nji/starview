<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>게시글 리스트</h1>
<hr>

<table>
<thead>
	<tr>
		<th>게시글 번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>내용</th>
		<th>등록일</th>
		<th>조회수</th>
		<th>추천수</th>
		<th>사진 번호</th>
	</tr>
</thead>	
<tbody>
<c:forEach items="${boardList }" var="b">
	<tr>
		<td>${b.galleryNo }</td>
		<td>${b.uId }</td>
		<td>${b.galleryTitle }</td>
		<td>${b.galleryContent }</td>
		<td><fmt:formatDate value="${b.galleryDate }" pattern="yy-MM-dd HH:mm:ss"/></td>
		<td>${b.galleryHit }</td>
		<td>${b.galleryLike }</td>
		<td>${b.photoNo }</td>
	</tr>
</c:forEach>
</tbody>
</table>

</body>
</html>