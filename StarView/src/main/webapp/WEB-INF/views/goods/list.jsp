<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

section {
	width: 1100px; 
	position: relative;
	margin: 0 auto;
}

.header {
	padding-top: 55px; 
}

.header p {
	font-size: 17px;
}

.header p #ttlCnt {
	font-size: 25px;
}

/* .sort+.sort::before {
	position: absolute; 
    top: 146px; 
    width: 1px;
    height: 15px;
    background-color: #e1e1e1;
    content: "";
} */

.items {  
 	list-style: none;  
	display: block;
	padding: 0;
 	float: left;
 	margin-right: 42px; 
 	margin-top: 40px;
 } 

a {
	text-decoration: none;
	color: black;
}

.arrdown {
	width: 17px; 
	height: 17px;
	margin-left: 6px;
}

.clear {
	clear: both;
}

span {
	cursor: pointer;
}

.sort {
	color: #C5C6B6; 
	padding-left: 8px;
	padding-right: 11px;
}

.l { 
	font-size: 12px; 
	color: #e1e1e1;
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

#moreBtn {
	padding: 10px 40px;
	border-radius: 28px;
	border: none;
	font-weight: 500;
    font-family: 'Noto Sans KR', sans-serif;
    color: black;
    background-color: #FFEBBA;
    width: 150px;
    height: 52px;
}

#moreBtn:hover {
    background-color: #f8ca00;
}


	
</style>
</head>
<body>

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
					console.log(startIdx)
					console.log(endIdx)
					console.log("AJAX 성공")
				
					$(".more").append( res );
					
					//더보기 버튼 삭제
					if(startIdx + step > total){
						$('#moreBtn').remove();
					}
				}
			})	
		} 
					
	}) //-- .click() 
	
	//정렬선택시 체크아이콘 삽입
	var chkimg = '<img style="width: 17px; height: 17px; margin-right: 3px;" src="/resources/img/check.png">';
	
	$('#latest').click(function() {
		$('.chkicon').empty();
		$('#chk1').append(chkimg)	
		$('.sort').css('color', '#C5C6B6');
		$('#latest').css('color', 'black');
		sortByDate();
	})
	
	$('#lowPrice').click(function() {
		$('.chkicon').empty()
		$('#chk2').html(chkimg)	
		$('.sort').css('color', '#C5C6B6');
		$('#lowPrice').css('color', 'black');
		
		sortByLowPrice();
	})
	
	$('#highPrice').click(function() {
		$('.chkicon').empty()
		$('#chk3').html(chkimg)	
		$('.sort').css('color', '#C5C6B6');
		$('#highPrice').css('color', 'black');
		sortByHighPrice();
	})
	
	function sortByDate(){
		$.ajax({
			type: "get"
			, url: "/goods/latest"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$('.list').html( res );
			}
		})
		
	}
	
	function sortByLowPrice(){
		$.ajax({
			type: "get"
			, url: "/goods/lowPrice"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$('.list').html( res );
			}
		})
	}
	
	function sortByHighPrice(){
		$.ajax({
			type: "get"
			, url: "/goods/highPrice"
			, data: {}
			, dataType: "html"
			, success: function( res ) {
				console.log("AJAX 성공")
				$('.list').html( res );
			}
		})
		
	}
})

</script>


<section id="goods-box">
	<div class="header">
		<h2>굿즈샵</h2><br>
		<p style="float: left;"> 총 <span id="ttlCnt">${totalCount } </span>개의 상품</p>
		<p style="float: right;">

			<span class="sort" id="latest"><span class="chkicon" id="chk1"></span>최신등록순</span><span class="l">|</span>
			<span class="sort" id="lowPrice"><span class="chkicon" id="chk2"></span>낮은가격순</span><span class="l">|</span> 
			<span class="sort" id="highPrice"><span class="chkicon" id="chk3"></span>높은가격순</span></p>
	</div>
		<div class="clear"></div>
		
<div class="list">
	<c:forEach items="${goodsList }" var="goods">
		<ul class="items">
			<li><a href="/goods/view?gId=${goods.gId }"><img class="thumb" src="${goods.fileName }"></li>
			<li class="title">${goods.gName}</a></li>
			<li class="price"><fmt:formatNumber value="${goods.gPrice}" type="number" groupingUsed="true" />원</li>
		</ul>
	</c:forEach>
		<div class="more"></div>
	<div id="btn"><button id="moreBtn">MORE<img class="arrdown" src="/resources/img/arrdown.png"></button></div>
</div>


</section>

<br><br><br><br>


<c:import url="../layout/footer.jsp" />

