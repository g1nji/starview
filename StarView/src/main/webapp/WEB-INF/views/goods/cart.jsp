<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

.container {
	width: 1300px;
}

.bag-title {
	margin-top: 50px;
    margin-bottom: 30px;
}

section {
	margin: 0 auto;
}

.bag-wrap {
	float: left;
	width: 74%; 
}

.clear {
	clear: both;
}

table {
	border-top: 2px solid black;
	border-bottom: 1px solid black;
}

th {
	border-bottom: 1px solid #E0E3DA;
	height: 68px;
	text-align: center;
	vertical-align: middle;
}

tr {
	border-bottom: 1px solid #eae7e7;
}

td {
	text-align: center;
	vertical-align: middle;
	color: #333;
}

.prod {
	display: flex;
	align-items: center;
}

.thumbnail {
	width: 100px;
	height: 100px;
	margin: 20px;
}

.deleteBtn {
	border: 1px solid #E0E3DA;
	background: white;
	padding: 0 15px;
}

/* 좌측 하단 버튼 */
.bottom-btn {
	width: 180px;
	height: 50px;
	font-weight: 400;
	padding: 0 20px;
	border: 1px solid #333;
	border-radius: 0px;
}

#selectDeleteBtn {
	background: white;
	color: #7d7d7d;
}

#goto-cart {
	background: #7d7d7d;
	color: white;
	margin-left: 10px;
}

/* 우측 총 결제금액 섹션 */
.payment {
	float: right;
	width: 24%;
	height: 330px;
	background: #f2f2f2;
}

.payment h3 {
	height: 70px;
    padding-top: 27px;
    border-bottom: 1px solid #ababab;
    font-size: 18px;
    text-align: center;
}

.payment ul {
	padding: 0 20px;
}

.payment ul li {
	padding: 8px 0;
    font-size: 14px;
    list-style-type: none;
    color: #333;
}

.payment ul li p {
	float: right;
	width: 114px;
    text-align: right;
}

.payment ul li p .cntTtl {
	margin-right: 5px;
    font-size: 18px;
}

.payment ul li.total {
	margin-top: 20px;
    padding-top: 18px;
    border-top: 1px solid #d9d9d9;
}

.payment ul li p #ttlAmt {
	margin-right: 5px;
    font-size: 20px;
    color: #fa5500;
}

.payment .btn-order {
    width: 100%;
    height: 70px;
    background-color: #000;
    font-size: 18px;
    line-height: 70px;
    color: #fff;
    margin-top: 10px;
}

/* 수량 div */
.each {
	width: 45px;
    height: 25px;
    margin: 0 auto;
    border: 1px solid #dfdfdf;
    position: relative;
    padding-right: 18px;
}

.each button {
    width: 19px;
    height: 11px;
    background: url(/resources/img/arrow.png) 0 0 no-repeat;
    text-indent: -999em;
/*     overflow: hidden; */
    position: absolute;
    top: 0;
    right: 0;
    border: none;
}

.each .btn-up {
    border-bottom: 1px solid #dfdfdf;
    background-position: 7px -46px;
}

.each input {
	width: 23px;
    height: 23px;
    border-right: 1px solid #dfdfdf;
    border-left: none;
    border-top: none;
    border-bottom: none;
    font-size: 12px;
    text-align: center;
}

.each .btn-down {
    background-position: -43px -46px;
    top: auto;
    bottom: 0;
}

.qty-update {
	border: 1px solid #E0E3DA;
	background: white;
	font-size: 13px;
	color: #333;
 	padding: 0 10px; 
 	margin-top: 5px;
}

.each:after {
    display: block;
    clear: both;
    content: '';
}    
</style>

<script type="text/javascript">
$(document).ready(function() {

	//개별 체크박스 선택시 전체 선택 해제
	$(".chBox").click(function(){
	 $("#allCheck").prop("checked", false);
	});
	
	//단일상품 삭제
   $(".deleteBtn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val) {
		var checkArr = new Array();
			checkArr.push($(this).attr("data-cId"));
		 console.log(checkArr)
			  
			$.ajax({
				url : "/goods/deleteCart",
				type : "post",
				traditional: true,
				data : JSON.stringify({"chbox":checkArr}),
				contentType: 'application/json; charset=UTF-8',
				success : function(res){
					if(res=="delete_success"){
					location.href = "/goods/cart";
					} else {
						alert('삭제 실패');
					}
				}
			});
		}   
		});
	
	//선택상품 삭제
   $("#selectDeleteBtn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val) {
			var checkArr = new Array();
			var list = $('.chBox');
			for(var i=0; i<list.length; i++){
				if( list[i].checked ){
//				checkArr.push(list[i].attr("data-cId"));
				checkArr.push(list.eq(i).attr("data-cId"));
				}
			}
		 console.log(checkArr)
			  
			$.ajax({
				url : "/goods/deleteCart",
				type : "post",
				traditional: true,
				data : JSON.stringify({chbox:checkArr}),
				contentType: 'application/json; charset=UTF-8',
				success : function(res){
					if(res=="delete_success"){
					location.href = "/goods/cart";
					} else {
						alert('삭제 실패');
					}
				}
			});
		}   
	});
	
	//주문페이지 이동
	$('.btn-order').click(()=>{
		location.href="/order/orderSheet"
	})
	
	//체크박스 onchange event 발생시 총금액 보여주기
	$("input[name='chBox']").change(function(){
		checkEvent()
	})
	
	function checkEvent(){
		var gSum = 0; //총상품금액
		var dSum = 0; //총배송비
		var total = 0; //총결제금액

		//총상품금액 계산
		$("input[class='chBox']:checked").each((idx, chbx)=>{
			 var gPrice = $(chbx).attr("data-gPrice");
			 gSum += Number(gPrice) //attr()는 값이 String으로 넘어오기 때문에 형변환 해줌
			 var dPrice = $(chbx).attr("data-delPrice");
			 dSum += Number(dPrice)
		})
		console.log(gSum);
		if(dSum >= 3000){
			dSum = 3000;
		}
		console.log(dSum);

		total = gSum + dSum

		$('#ttlGprice').html(gSum.toLocaleString());
		$('#ttlDprice').html(dSum.toLocaleString());
		$('#ttlAmt').html(total.toLocaleString());
	}
	
	//수량 변경 버튼
	$('.qty-update').click(function(e){
		if(confirm('수량을 변경하시겠습니까?')){
			let cId = $(this).attr("data-cId"); //현 jQuery버전에서는 .data()적용안됨
			let cQty = $(this).parent("td").find("input").val();
			console.log(cId + ", " + cQty);
			
			sessionStorage.setItem('cId', cId)
			sessionStorage.setItem('cQty', cQty)
			
			$(".update-cId").val(cId);
			$(".update-cQty").val(cQty);
			$(".qty-update-form").submit();
			
			cQty = Number(sessionStorage.getItem('cQty'))
			$('.input-qty').val(cQty)
		}
	})
	

			
})

</script>

</head>
<body>

<h3 class="bag-title">쇼핑백 상품(${totalCart})</h3>

<section>

<div class="bag-wrap">

<table>
<thead>
<tr>
	<th><input type="checkbox" name="chBox" id="allCheck" onclick="selectAll(allCheck)"></th>
		<script>
		//체크박스 전체 선택
		function selectAll(allCheck) {
		  const checkboxes = document.querySelectorAll('.chBox');
	  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = allCheck.checked
	  	  })
		}
		</script>
	<th style="width: 35%">상품정보</th>
	<th style="width: 15%">수량</th>
	<th style="width: 15%">가격</th>
	<th style="width: 10%">배송비</th>
	<th style="width: 15%">상품금액</th>
	<th style="width: 10%">선택</th>
</tr>
</thead>

<tbody>
	<c:forEach items="${cartList }" var="cart">
		<tr>
			<td>
			<input type="checkbox" name="chBox" class="chBox" data-cId="${cart.cId }" data-gPrice="${cart.gPrice }"  data-delPrice="${cart.delPrice }">
			</td>
			<td class="prod">
				<img class="thumbnail" src="${cart.fileName }">
				<span style="">${cart.gName }</span>
			</td>
			
			<td class="prodQty" style="text-align: center;">
			<!-- 수량조정 form -->
				<div class="each">
					<form action="/goods/updateQty" method="post" class="qty-update-form">
						<button type="button" name="button" class="btn-up" onclick="changeQty('p')">수량올림</button>
						<input type="text" class="input-qty"  value="1" readonly="readonly">
						<button type="button" name="button" class="btn-down" onclick="changeQty('m')">수량내림</button>
	<!-- 					<input type="number" class="input-qty" min="1" max="9" value="1"> -->
						<input type="hidden" name="cId" class="update-cId">
						<input type="hidden" name="cQty" class="update-cQty">
						
						<script>
							function changeQty(type){
								var input = $("input[class='input-qty']")
								var min = 1;
								var max = 9;
								var count = Number(input.val());
								if(type=='p'){
									if(count < max){
									input.val(count+1)
									} else if(count == max) {
										input.val(max);
									}
								} else if(type=='m'){
									if(count > min){
									input.val(count-1)
									} else if(count == min) {
										input.val(min);
									}
								}
							}
						</script>
					</form>
				</div>
					<button class="qty-update" data-cId="${cart.cId }">변경</button>
			</td>	
			
			<td><fmt:formatNumber value="${cart.gPrice }" type="number" groupingUsed="true" />원</td>
			<td><fmt:formatNumber value="${cart.delPrice }" type="number" groupingUsed="true" />원</td>
			<td id="prodSum"><fmt:formatNumber value="${cart.gPrice * cart.cQty }" pattern="#,### 원" /></td>
			
			<!-- 단일상품 삭제 버튼 -->
			<td>
				<button class="deleteBtn" data-cId="${cart.cId }">
				<span style="font-size: 12px; margin-right: 3px;">삭제</span><span style="size: 15px;">x</span></button>
			</td>
		</tr>
	</c:forEach>
</tbody>
</table>

<br><br>
<!-- 선택상품 삭제 버튼 -->
<button class="bottom-btn" id="selectDeleteBtn">선택상품삭제</button>
<button class="bottom-btn" id="goto-cart" onclick="history.go(-1);">쇼핑계속하기</button>

</div>
</section>

<section>
<div class="payment">
	<h3>주문금액</h3>
	<ul>
		<li>
			<span>총 상품 금액</span>
			<p><span class="cntTtl" id="ttlGprice"></span>원</p>
		</li>
		<li>
			<span>배송비</span>
			<p><span>+</span><span class="cntTtl" id="ttlDprice"></span>원</p>
		</li>
		<li class="total">
			<span>총 결제금액</span>
			<p><span class="cntTtl" id="ttlAmt"></span>원</p>
		</li>
	</ul>
	<button class="btn-order">선택상품 주문하기</button>
</div>
</section>

<div class="clear"></div>

<br><br><br><br>

<c:import url="../layout/footer.jsp" />