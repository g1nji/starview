<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

section {
	width: 1000px; 
	margin: 100px auto;
}

table {
	width: 480px;
}

.goods-img {
	width: 420px;
	height: 420px;
	float: left;
}

.goods-info {
	float: right;
}

.clear {
	clear: both;
}

td { 
	width: 70px; 
	padding: 3px 0;
}

.detail-img {
	border-top: 2px solid black;
	margin-top: 100px;
}

#selectQty { width: 50px; }

.btn {
	padding: 15px 30px;
	border-radius: 15px;
	border: none;
	font-weight: 600;
    font-family: 'Noto Sans KR', sans-serif;
}

#buynow {
	background-color: black;
	color: white;
}

#cart {
    background-color: #f8e6e0;
    color: #6e6e6e;
    margin-left: 5px;
}

.likebox {
    position: relative;
}

.heart-icon {
    background: url(/resources/img/empty_heart.png) no-repeat center 1px/38px;
    width: 54px;
    height: 57px;
	border: none;
	cursor: pointer;
}

#like-cnt {
	position: absolute;
	line-height: 29px;
	left: 23px;
	font-size: 8px;
}

/* 모달창 */
.black-bg { /* 시작스타일 */
    width : 100%;
    height : 100%;
    position : fixed;
    background : rgba(0,0,0,0.5);
    z-index : 5;
    padding: 30px;
    visibility: hidden; 
    opacity: 0;
    transition: all 1s;
    /* 모든 css속성이 변할때 1초에 걸쳐서 변한다 */
     top: 50%; 
	 left: 50%; 
	 -webkit-transform: translate(-50%, -50%); 
	 -moz-transform: translate(-50%, -50%); 
	 -ms-transform: translate(-50%, -50%); 
	 -o-transform: translate(-50%, -50%); 
	 transform: translate(-50%, -50%); 
	 
	 display: flex;
  }

.white-bg {
	width: 500px;
	height: 220px;
	background: white;
	border-radius: 5px;
	padding: 50px 30px;
	text-align: center; 
	margin: auto;

} 

.show-modal { /*최종 스타일 */
	visibility: visible;
	opacity: 1;
}

.modalBtn {
	padding: 12px 30px;
/* 	border-radius: 15px; */
	border: none;
	font-weight: 500;
    font-family: 'Noto Sans KR', sans-serif;
}
  
#keep-on {
	background-color: gray;
	color: white;
}  

#goto-cart {
	background-color: black;
	color: white;
	margin-left: 10px;
}  
</style>

<script type="text/javascript">
$(document).ready(function() {
	const uId = '${sessionScope.uId }'
	const gId = '${goodsInfo.gId }'
	
	//찜하기 클릭시 로그인 검증
	$('#nologin').click(function() {
		alert('로그인이 필요합니다');
	})

	$('#login').click(function() {
		like_func();
	})
	
function like_func(){
	console.log('like_func 실행')
	var sendData = {"gId":gId, "uId":uId}

	$.ajax({
		type: 'post',
		url: '/wish/clickLike',
		data: JSON.stringify(sendData),
		contentType: 'application/json; charset=UTF-8',
		dataType: 'json',
		success: function(data){
			console.log(data);
			
			if(data.findLike==1){
				$('#login').css('background', 'url(/resources/img/empty_heart.png) no-repeat center 1px/38px');
				$('#like-cnt').html(data.totalLike);
				alert('위시리스트에서 삭제했습니다')
				
			} else {
				$('#login').css('background', 'url(/resources/img/heart.png) no-repeat center 1px/38px');
				$('#like-cnt').html(data.totalLike);
				alert('위시리스트에 담겼습니다')
				
			}
		}
	})
}
	
	$('#cart').click(function() {
// 	var cQty = $('#selectQty').val();
// 		console.log(gId +','+uId)
// 		if(!uId.length){
// 			if(localStorage.getItem('cart') == null) {
// 			var cartObj = {gId:gId, cQty:cQty}
// 			localStorage.setItem('cart', JSON.stringify([cartObj]))
// 			} else {
// 				var cartArr = JSON.parse(localStorage.getItem('cart'));
// 				var cartObj = {gId:gId, cQty:cQty}
// 				cartArr.push(cartObj);
// 				localStorage.setItem('cart', JSON.stringify(cartArr) );
				
// 				location.href="./nonmember"
// 			}
// 		} else {
		addCart();
		
	})
	
	//까만배경 누르면 모달창 닫기
	$('.black-bg').on('click', function(e) {
   		if ( e.target == document.querySelector('.black-bg') ){
   		document.querySelector('.black-bg').classList.remove('show-modal');
   		}
	})
	
function addCart(){
	console.log('addCart() 실행')

	var cQty = $('#selectQty').val();
	var sendData = {"gId":gId, "cQty":cQty};
	console.log(sendData)

	$.ajax({
		type: 'post',
		url: '/goods/addCart',
		data: JSON.stringify(sendData),
		contentType: 'application/json; charset=UTF-8',
		success: function(res){
			if(res=='add_success'){
				console.log('카트 담기 성공');				
				$('.black-bg').addClass('show-modal')
				
				$('#keep-on').on('click', function() {
					$('.black-bg').toggleClass('show-modal')
				})
				$('#goto-cart').on('click', function() {
					if(!uId.length){
					   	location.href="./nonuser"
					} else {
					   	location.href="./cart"
					}
				})					
			} else if(res=='already_exist') {
				alert('이미 등록된 상품입니다.')
			}
		}
	})
}
	
})
</script>

</head>
<body>

<section>
<img class="goods-img" src="${goodsInfo.fileName }">

<div class="goods-info">
	<table>
	<tr>
		<div class="title"><h3>${goodsInfo.gName}</h3></div>
	</tr>	
	<tr>
		<td>가격</td>
		<td><div class="price"><fmt:formatNumber value="${goodsInfo.gPrice}" type="number" groupingUsed="true" />원</div></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>배송비</td>
		<td><div class="delPrice"><fmt:formatNumber value="${goodsInfo.delPrice}" type="number" groupingUsed="true" />원</div></td>
		<td></td>
		<td></td>
	</tr>	
	<tr>
		<td>수량</td>
		<td>
		<input type="number" id="selectQty" min="1" max="5" value="1">
		</td>
	</tr>
	</table>
	<br>

	<button class="btn" id="buynow">바로구매</button>
		<script>
		$('#buynow').click(()=>{
			location.href="/order/orderSheet"
		})
		</script>
	<button class="btn" id="cart">장바구니</button>
	<span class="likebox">
		<c:choose>
			<c:when test="${uId eq null }">
				<button class="heart-icon" id="nologin">
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${findLike eq '0' or empty findLike }">
						<button class="heart-icon" id="login" style="background: url(/resources/img/empty_heart.png) no-repeat center 1px/38px;">
					</c:when>
					<c:otherwise>
						<button class="heart-icon" id="login" style="background: url(/resources/img/heart.png) no-repeat center 1px/38px;">
					</c:otherwise>
				</c:choose>
			</c:otherwise>
		</c:choose>
		<span id="like-cnt">${likeCntAll }</span>
		</button>
	</span>
	
	
</div> 
<div class="clear"></div>

<div class="detail-img">
</div>

<div class="black-bg">
  <div class="white-bg">
	<h4>선택하신 상품이<br>
	SHOPPING BAG에 추가되었습니다.</h4><br>
	  <button class="modalBtn" id="keep-on">쇼핑 계속하기</button>
	  <button class="modalBtn" id="goto-cart">쇼핑백 확인</button>
  </div>
</div>

</section>

<br><br><br><br>

<c:import url="../layout/footer.jsp" />