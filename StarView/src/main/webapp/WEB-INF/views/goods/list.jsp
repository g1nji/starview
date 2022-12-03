<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

section {
	width: 1100px; 
	margin: 0 auto;
}

.header {
	padding-top: 100px; 
}

.items {  
 	list-style: none;  
	display: block;
	padding: 0;
 	float: left;
 	margin-right: 42px; 
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

#btn {
	padding-top: 50px; 
	clear: left;
	text-align: center;
}

.clear {
	clear: both;
}

span {
	cursor: pointer;
}

.check {
	width:20px; 
	height: 20px; 
	display: hidden;
}
	
</style>
</head>
<body>

<section id="goods-box">
	<div class="header">
		<h2>굿즈샵</h2>
		<p style="float: left;"> 총 ${totalCount }개의 상품</p>
		<p style="float: right;">
			<span id="latest"><img class="check" src="/resources/image/checkicon.png">최신등록순</span> | 
			<span id="lowPrice">낮은가격순</span> | 
			<span id="highPrice">높은가격순</span></p>
	</div>
		<div class="clear"></div>
		
<div class="list">
	<c:forEach items="${goodsList }" var="goods">
		<ul class="items">
			<li><a href="/goods/detail.jsp?gId=${goods.gId }"><img class="thumb" src="${goods.fileName }"></li>
			<li class="title">${goods.gName}</a></li>
			<li class="price"><fmt:formatNumber value="${goods.gPrice}" type="number" groupingUsed="true" />원</li>
		</ul>
	</c:forEach>
		<div class="more"></div>
</div>

	<div id="btn"><button id="moreBtn">상품 더보기</button></div>

</section>

<!-- 버튼 클릭시 추가상품을 화면에 보여준다 -->

<script type="text/javascript">

$(document).ready(function() {
	var startIdx = 1; //인덱스 초기값
	const step = 8; 	//8개씩 로딩
	var total = ${totalCount };
	
	//더보기 기능
	$("#moreBtn").click(function() {
		startIdx += step;
		showMore(startIdx);
	
		function showMore(idx){
			let endIdx = idx+step-1;
			
			$.ajax({
				type: "post"
				, url: "/goods/more"
				, data: JSON.stringify({
					startIdx: idx,
					endIdx: endIdx,
					step: step
				})
				, contentType: "application/json; charset=UTF-8"
				, dataType: "html"
				, success: function( res ) {
					console.log("AJAX 성공")
				
					$(".more").html( res ).slideDown();
					
					//더보기 버튼 삭제
					if(startIdx + step > total){
						$('#moreBtn').remove();
					}// if
				}// success
			}) //ajax	
		} //--showMore()
					
	}) //-- .click() 
	
	$('#latest').click(function() {
		sortByDate();
	})
	
	$('#lowPrice').click(function() {
		sortByLowPrice();
	})
	
	$('#highPrice').click(function() {
		sortByHighPrice();
	})
	
	function sortByDate(){
		
	}
	
	function sortByLowPrice(){
		
	}
	
	function sortByHighPrice(){
		
	}
})

</script>

<br><br><br><br>


<c:import url="../layout/footer.jsp" />

