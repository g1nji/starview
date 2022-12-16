<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">

section {
	width: 1500px; 
	margin: 100px auto;
}

table {
	width: 60%;
	border-top: 2px solid black;
	border-bottom: 1px solid black;
}

th {
	border-bottom: 1px solid #E0E3DA;
	height: 68px;
	text-align: center;
	vertical-align: middle;
}

td {
	text-align: center;
	vertical-align: middle;
	padding-top: 10px;
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

#qty {
	width: 40px;
	border: 1px solid #E0E3DA;
}

#deleteBtn {
	border: 1px solid #E0E3DA;
	background: white;
	padding: 0 15px;
}

#qty-update {
	border: 1px solid #E0E3DA;
	background: white;
	font-size: 13px;
	color: #333;
 	padding: 2px 10px; 
}

.btn {
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
</style>

<script type="text/javascript">
$(document).ready(function() {

})

</script>

</head>
<body>

<section>
<h3>쇼핑백 상품(${totalCart})</h3>

<table>
<thead>
<tr>
	<th>
	<input type="checkbox" name="allCheck" id="allCheck" onclick="selectAll(this)">
		<script>
		//모두선택 체크박스 체크시 개별 체크박스 모두 체크
		function selectAll(selectAll) {
		  const checkboxes = document.querySelectorAll('.chBox');
	  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
	  	  })
		}
		</script>
	</th>
	<th style="width: 35%">상품정보</th>
	<th style="width: 15%">수량</th>
	<th style="width: 20%">가격</th>
	<th style="width: 15%">배송비</th>
	<th style="width: 15%">선택</th>
</tr>
</thead>

<tbody>
	<c:forEach items="${cartList }" var="cart">
		<tr>
			<td>
			<input type="checkbox" name="chBox" class="chBox" data-cId="${cart.cId }">
				<script>
				//개별 체크박스 선택 or 해제시 모두 선택 해제
				$("#chBox").click(function(){
				 $("#allCheck").prop("checked", false);
				});
				</script>
			</td>
			<td class="prod">
				<img class="thumbnail" src="${cart.fileName }">
				<span style="">${cart.gName }</span>
			</td>
			
			<td class="qty" style="text-align: center;">
				<input type="number" id="qty" value="${cart.cQty}">
				<button id="qty-update">변경</button></td>
				
			<td><fmt:formatNumber value="${cart.gPrice }" type="number" groupingUsed="true" />원</td>
			<td><fmt:formatNumber value="${cart.delPrice }" type="number" groupingUsed="true" />원</td>
			
<!-- 단일상품 삭제(버튼) -->
			<td><button id="deleteBtn" data-cId="${cart.cId }">
				<script>
			   $("#deleteBtn").click(function(){
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
				</script>
				<span style="font-size: 12px; margin-right: 3px;">삭제</span><span style="size: 15px;">x</span></button></td>
		</tr>
	</c:forEach>
</tbody>
</table>

<br><br>
<!-- 선택상품 삭제(체크박스) -->
<button class="btn" id="selectDeleteBtn">선택상품삭제</button>
			<script>
			   $("#selectDeleteBtn").click(function(){
				var confirm_val = confirm("정말 삭제하시겠습니까?");
				
				if(confirm_val) {
					var checkArr = new Array();
					var list = $('.chBox');
					for(var i=0; i<list.length; i++){
						if( list[i].checked ){
// 						checkArr.push(list[i].attr("data-cId"));
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
				</script>
<button class="btn" id="goto-cart">쇼핑계속하기</button>
</section>

<br><br><br><br>

<c:import url="../layout/footer.jsp" />