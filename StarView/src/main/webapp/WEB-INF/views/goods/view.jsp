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

td { width: 70px; }

.detail-img {
	border-top: 2px solid black;
	margin-top: 100px;
}

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
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	const uId = '${sessionScope.uId }'
	const gId = '${goodsInfo.gId }'
	console.log(uId);
	console.log(gId);
	
	$('#nologin').click(function() {
		alert('로그인이 필요합니다');
	})

	$('#login').click(function() {
		like_func();
	})
	
function like_func(){
	console.log('like_func 실행')
		var sendData = {"gId":gId, "uId":uId}
		var likeCntAll = ${likeCntAll };
	
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
					$('#like-cnt').html(totalLike);
					alert('찜을 취소했습니다')
					
				} else {
					$('#login').css('background', 'url(/resources/img/heart.png) no-repeat center 1px/38px');
					$('#like-cnt').html(data.totalLike);
					alert('위시리스트에 담겼습니다')
					
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
		<input type="number" name="selectQty" min="1" max="5" value="1">
		</td>
	</tr>
	</table>
	<br>

	<button class="btn" id="buynow">바로구매</button>
	<button class="btn" id="cart">장바구니</button>
	<span class="likebox">
		<c:choose>
			<c:when test="${uId eq null }">
				<button class="heart-icon" id="nologin">
			</c:when>
			<c:otherwise>
				<c:choose>
					<c:when test="${likeCheck eq '0' or empty likeCheck }">
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
</section>

<br><br><br><br>

<c:import url="../layout/footer.jsp" />