<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

   	<c:forEach items="${highPriceList }" var="goods">
	<ul class="items">
		<li><a href="/goods/view?gId=${goods.gId }"><img class="thumb" src="${goods.fileName }"></li>
		<li class="title">${goods.gName}</a></li>
		<li class="price"><fmt:formatNumber value="${goods.gPrice}" type="number" groupingUsed="true" />원</li>
	</ul>
</c:forEach>
	<div class="more"></div>

	<div id="btn"><button id="moreBtn">MORE <img style="width: 17px; height: 17px;" src="/resources/img/rightarr.png"></button></div>
</div>

	
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
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
				, url: "/goods/more3"
				, data: JSON.stringify({
					startIdx: idx,
					endIdx: endIdx,
					step: step
				})
				, contentType: "application/json; charset=UTF-8"
				, dataType: "html"
				, success: function( res ) {
					console.log("AJAX 성공")
				
					$(".more").append( res );
					
					//더보기 버튼 삭제
					if(startIdx + step > total){
						$('#moreBtn').remove();
					}// if
				}// success
				, error: function() {
					console.log("AJAX 실패")
				}
			}) //ajax	
		} //--showMore()
					
	}) //-- .click() 
</script>