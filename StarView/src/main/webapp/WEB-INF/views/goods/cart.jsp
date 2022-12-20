<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<link rel="stylesheet" href="/resources/css/cartCss.css" />


<script type="text/javascript">
$(document).ready(function() {

	//DOM객체 로딩시 총금액 보이도록 이벤트 발생시키기
	$('#allCheck').trigger("click");
	calOrderPrice();
	calTotalPrice();

	// 	var res = sessionStorage.getItem('qtyArr')
// 	if(res!=null){
// 		console.log(res);
// 		res = JSON.parse(res);
// 		var qtyarr = res.flatMap(Object.values)
// 		console.log(qtyarr);
// 		})
// 	}
	
	
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
			}); //ajax
		}   //if
	}); //click
	
	
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
			}); //ajax
		}   //if
	}); //click
	
	
	//주문페이지 이동
	$('.btn-order').click(()=>{
		location.href="/order/orderSheet"
	})
	
// 	체크이벤트 발생시 총금액 보여주기
	$("input[type='checkbox']").change(function(){
		calOrderPrice()
		calTotalPrice()
	})

	function calTotalPrice(){
		var gSum = 0; //총상품금액
		var dSum = 0; //총배송비
		var total = 0; //총결제금액

		//총상품금액 계산
		$("input[class='chBox']:checked").each((idx, chbx)=>{
			//각 체크박스의 수량 가져오기
			 var qty = $(chbx).parents("tr").find($(".input-qty")).val()
			//각 체크박스의 가격 가져오기
			 var gPrice = $(chbx).attr("data-gPrice");
			//구매가격(가격*수량) 계산하기
			 var orderPrice = gPrice * qty
			//attr()는 값이 String으로 넘어오기 때문에 형변환 해줌
			 gSum += Number(orderPrice) 			
			//배송비 계산하기
			var dPrice = $(chbx).attr("data-delPrice");
			dSum += Number(dPrice)
		})
		//배송비 보정
		if(dSum >= 3000)	dSum = 3000;
		//주문금액 계산하기
		console.log(gSum + "+" + dSum);
		total = gSum + dSum
		//상품금액, 배송비, 결제금액 표시하기
		$('#ttlGprice').html(gSum.toLocaleString());
		$('#ttlDprice').html(dSum.toLocaleString());
		$('#ttlAmt').html(total.toLocaleString());
	}
	
	
	//수량 변경
	$('.qty-update').click(function(){
		if(confirm('수량을 변경하시겠습니까?')){
			let cId = $(this).attr("data-cId"); 	//현 jQuery버전에서는 .data()적용안됨
			let gPrice = $(this).attr("data-gPrice");
			let cQty = $(this).parent("td").find("input").val();
			var data = { cId:cId, cQty:cQty }
			
			console.log(data);
			
			$.ajax({
				url : "/goods/updateQty",
				type : "post",
				data : JSON.stringify(data),
				contentType: 'application/json; charset=UTF-8',
				context: this,
				success : function(res){
					if(res=="update_done"){
						calOrderPrice();
						calTotalPrice();
						console.log('수량변경 완료')
					} 
				}
			}); //ajax
		} //if
	})	//click
	
		
	//상품금액 계산		
	function calOrderPrice() {
		var tbody = document.getElementById("cart");
		var rows = tbody.querySelectorAll("tr");
		
		for(var i=0; i<rows.length; i++){
			//tr을 순서대로 하나씩 가져오기
			var tr = rows[i];
			//tr에서 가격이 표시된 td 가져오기
			var priceTd = tr.firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling;
			//구매수량이 표시된 td 가져오기
			var qtyTd = tr.firstElementChild.nextElementSibling.nextElementSibling;
			//구매가격(가격*구매수량)을 표시할 td 가져오기
			var orderPriceTd = tr.lastElementChild.previousElementSibling;
			//td에서 가격 가져오기
			var price = stringNumberToInt(priceTd.innerText); 
			console.log(price)
			//td에서 구매수량 가져오기
			var qty = qtyTd.querySelector("input").value;
			console.log(qty)
			//구매가격 계산하기
			var orderPrice = price * qty;
			console.log(orderPrice)
			//구매가격 표시 td에 구매가격 넣기
			orderPriceTd.innerText = orderPrice.toLocaleString() + "원";
		}
	}		
	
	function stringNumberToInt(stringNumber){
	    return parseInt(stringNumber.replace(/,/g , ''));
	}
	

// 			var qtyArr = sessionStorage.getItem("qtyArr");
			
// 			if(qtyArr==null){
// 				qtyArr = [];
// 				var entry = {"cQty": cQty}
// 				qtyArr.push(entry);
// 				sessionStorage.setItem('qtyArr', JSON.stringify(qtyArr));
// 			} else {
// 				var entry = {"cQty": cQty}
// 				qtyArr = JSON.parse(qtyArr)
// 				console.log(qtyArr)
// 				qtyArr.push(entry);
// 				sessionStorage.setItem('qtyArr', JSON.stringify(qtyArr));
// 			}
// 			console.log(qtyArr)
			
			//form태그로 값 전달
// 			$(".update-cId").val(cId);
// 			$(".update-cQty").val(cQty);
// 			$(".qty-update-form").submit();

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

<tbody id="cart">
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
					<button type="button" name="button" class="btn-up" onclick="changeQty('p', this)">수량올림</button>
					<input type="text" class="input-qty"  value="1" readonly="readonly">
					<button type="button" name="button" class="btn-down" onclick="changeQty('m', this)">수량내림</button>
<!-- 					<input type="number" class="input-qty" min="1" max="9" value="1"> -->
<!-- 						<input type="hidden" name="cId" class="update-cId"> -->
<!-- 						<input type="hidden" name="cQty" class="update-cQty"> -->
					
					<script>
						function changeQty(type, ths){
							var input = $(ths).parents("td").find("input[class='input-qty']");
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
				<button class="qty-update" data-cId="${cart.cId }" data-gPrice="${cart.gPrice }">변경</button>
			</td>	
			
			<td><fmt:formatNumber value="${cart.gPrice }" type="number" groupingUsed="true" />원</td>
			<td><fmt:formatNumber value="${cart.delPrice }" type="number" groupingUsed="true" />원</td>
			<td id="prodSum"><span id="ttl"><fmt:formatNumber value="${cart.gPrice * cart.cQty }" type="number" groupingUsed="true" /></span>원</td>
			
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