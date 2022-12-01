<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::: 굿즈샵 :::</title>

<style type="text/css">

section {
width: 1300px; 
margin: 0 auto;
}

ul {  
 	list-style: none;  
	display: block;
	padding: 0;
	margin: 0;
 } 

li { 
 	float: left;
 	margin-right: 81px; 
 	margin-top: 50px;
 } 

a {
	text-decoration: none;
	color: black;
}

.thumb {
	width: 230px;
	height: 230px;
}

dd {
	margin: 15px 0;
}

.more { float: right;}


</style>
</head>
<body>

<section id="goods-box">
	<header>
		<h2>굿즈샵</h2>
		<p> 낮은가격순 | 높은가격순</p>
	</header>
	
<div class="list">
	<ul class="goods-list">
	<c:forEach items="${goodsList }" var="goods">
		<c:set var="goodsCount" value="${goodsCount+1 }" />
		<li class="goods-item">
		<a href="/goods/detail.jsp?gId=${goods.gId }">
			<dl class="goods-wrap">
				<dt class="image">
					<img class="thumb" src="${goods.fileName }">
				</dt>
				<dd class="descriptions">
					<div class="title">${goods.gName}</div>
					<div class="price">
					<fmt:formatNumber value="${goods.gPrice}" type="number" groupingUsed="true" />원
					</div>
				</dd>
			</dl>
		</a>
		</li>
		<c:if test="${goodsCount==8 }">
			<li class="goods-item">
			   <button>상품 더보기</button>
			</li>
		</c:if>
	</c:forEach>
</ul>	
</div>

</section>
</body>
</html>