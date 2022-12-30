<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>

<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<script type="text/javascript">
const autoHyphen2 = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
	}
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	//상품 금액 합계 계산
	$(".totalPrice").each(function() {
	
		var $this = $(this);
		var sum_value = 0;
		$(".price").each(function (i, e) {
			sum_value += Number($(e).text())
		})
		$this.text(sum_value);	
		$(".orderPrice").text(sum_value);	
		
	})
	
	//배송비
	$('#delfee').text("3000");
	
	//상품 금액 합계 + 배송비
	var totalPrice = Number($(".totalPrice").text());
	var delfee = Number($("#delfee").text());
	console.log( totalPrice + delfee);
	var resultPrice = totalPrice + delfee;
	
	$('.resultPrice').text(resultPrice)
	
})
</script>

<script type="text/javascript">
//카카오 결제 API
var IMP = window.IMP; // 생략가능
IMP.init('impxxxxxxxx');  // 가맹점 식별코드
// IMP.request_pay(param, callback) 결제창 호출
IMP.request_pay({
    pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
    pay_method: 'card',
    merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
    name : 'Bunddeuk', // 상품명
    amount : amount,
    //customer_uid 파라메터가 있어야 빌링키 발급을 시도함
    customer_uid : buyer_name + new Date().getTime(),
    buyer_email : email,
    buyer_name : buyer_name,
    buyer_tel : hp,
    buyer_addr : addr,
}, function(rsp) { //callback
    if ( rsp.success ) {
      console.log('빌링키 발급 성공', rsp)
      //빌링키 발급이 완료되었으므로, 서버에 결제 요청
      alert('예약 결제가 완료되었습니다!');
    } else {
      var msg = '결제에 실패하였습니다.\n';
      msg += rsp.error_msg;
      alert(msg);
      return false;
    }
    $("#final-support-submit").submit();
});
</script>

<style type="text/css">
h2 {
	text-align: center;
}

.step {
	width: 60%;
	margin: 0 auto;
	padding-top: 20px;
	text-align: center;
}

.stepImg {
	margin: 0 auto;
	width: 70px;
	height: 70px;
	border-radius: 50px;
	background-color: #f6f6f6;
}

.stepImg2 {
	margin: 0 auto;
	width: 75px;
	height: 75px;
	border-radius: 50px;
	background-color: #FFB703;
}

.orderlist {
	padding: 10px 0;
	width: 15%;
	height: 140px;
	border-top: 1px solid #eee;
}

.buyerset {
	height: 50px;
    text-align: center;
    width: 20%;
    background-color: #f6f6f6;
    border-bottom: #eee
}

.paymentmethod {
    width: 60%;
    height: 250px;
    margin-right: 2%;
    float: left;
    display: inline-block;
}

.paymentamount {
    float: left;
    width: 38%;
    height: 250px;
    margin-bottom: 30px;
}

.paT {
	font-size: 17px;
	font-weight: 400;
	color: #bbb;
	padding: 7px 0;
}

.paT2 {
	font-size: 17px;
	text-align: right;
}

.submitBtn {
    text-align: center;
    font-size: 19px;
    color: white;
    background-color: black;
    height: 50px;
    margin-top: 5px;
    padding: 11px 0;
}

</style>

<div class="wrap">

<h2>주문/결제</h2>
<div class="step">
	<table style="width:100%;">
		<tr>
			<td><div class="stepImg"><img src="/resources/image/shopping-cart.png" style="width:45%; padding-top: 10px;"></div></td>
			<td>></td>
			<td><div class="stepImg2"><img src="/resources/image/credit.png" style="width:50%; margin-top: 23px;"></div></td>
			<td>></td>
			<td><div class="stepImg"><img src="/resources/image/order-finish.png" style="width:50%; margin-top: 21px;"></div></td>
		</tr>
		<tr>
			<td style="padding-top: 10px;">장바구니</td>
			<td></td>
			<td style="padding-top: 10px;">주문/결제</td>
			<td></td>
			<td style="padding-top: 10px;">주문완료</td>
		</tr>
	</table>
</div>

<form action="/order/result" method="post">
<h3>주문내역</h3>
<table style="border-top: 2px solid black; border-bottom: 1px solid #eee; width: 100%; text-align: center;">
	<tr>
		<th colspan="2" style="padding:10px 0; text-align: center;">상품명</th>
		<th style="text-align: center;">단가</th>
		<th style="text-align: center;">수량</th>
		<th style="text-align: center;">소계금액</th>
	</tr>
	<c:forEach items="${cartList }" var="cart">
	<tr>
		<td class="orderlist" style="text-align: left;"><img src="${cart.fileName }" style="width:150px; border:1px solid #eee;"></td>
		<td class="orderlist" style="width:40%; text-align: left; font-weight: 500;">${cart.gName }</td>
		<td class="orderlist">${cart.gPrice }</td>
		<td class="orderlist">${cart.cQty }</td>
		<td class="orderlist price">${cart.gPrice * cart.cQty }</td>
	</tr>
	</c:forEach>
</table>

<div style="width:100%; height: 70px; margin: 20px 0; text-align:center; background-color: #f6f6f6;">
<p style="font-size: 17px; font-weight: 500; margin: 0; padding-top: 9px;">총 주문금액</p>
<p style="font-size: 20px; font-weight: 600;"><span class="totalPrice" style="color:#fa5500;"></span>원</p>
</div>

<h3>주문자 정보</h3>
<table style="border-top: 2px solid black; border-bottom: 1px solid #eee; width: 100%; text-align: left;">
	<c:if test="${uId eq null }">
	<tr>
		<th class="buyerset">주문자명</th>
		<td style="padding-left: 20px;"><input type="text"></td>
	</tr>
	<tr>
		<th class="buyerset">전화번호</th>
		<td style="padding-left: 20px;">
		<div id="resultPhone" class="resultDiv"></div>
		<input type="text" id="uPhone" name="uPhone" oninput="autoHyphen2(this)" maxlength="13">
		</td>
	</tr>
	<tr>
		<th class="buyerset">이메일</th>
		<td style="padding-left: 20px;"><input type="text"></td>
	</tr>
	</c:if>
	<c:if test="${uId ne null }">
	<tr>
		<th class="buyerset">주문자명</th>
		<td style="padding-left: 20px;">${uName }
		<input type="hidden" value="${uId }">
		</td>
	</tr>
	<tr>
		<th class="buyerset">전화번호</th>
		<td style="padding-left: 20px;">
		<input type="text" id="uPhone" name="uPhone" oninput="autoHyphen2(this)" maxlength="13">
		</td>
	</tr>
	<tr>
		<th class="buyerset">이메일</th>
		<td style="padding-left: 20px;"><input type="text"></td>
	</tr>
	</c:if>
</table>

<h3>수취인 정보</h3>
<table style="border-top: 2px solid black; border-bottom: 1px solid #eee; width: 100%; text-align: left;">
	<tr>
		<th class="buyerset">받으실분</th>
		<td style="padding-left: 20px;"><input type="text"></td>
	</tr>
	<tr>
		<th class="buyerset" rowspan="3">받으실곳</th>
		<td style="padding-left: 20px;">
			<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:250px;" onclick="sample6_execDaumPostcode()">
			<input type="button" onclick="sample6_execDaumPostcode()" value="주소찾기" style="width:80px;" id="addbtn"><br>
		</td>
	</tr>
	<tr>
		<td style="padding-left: 20px;">
			<input type="text" id="sample6_address" name="uAdd1" placeholder="주소" disabled="disabled">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목">
		</td>
	</tr>
	<tr>
		<td style="padding-left: 20px;">
			<input type="text" id="sample6_detailAddress" name="uAdd2" placeholder="상세주소"><br>
			<input type="text" id="uAddress" name="uAddress" hidden="hidden">
		</td>
	</tr>
	<tr>
		<th class="buyerset">전화번호</th>
		<td style="padding-left: 20px;">
			<input type="text" id="uPhone" name="uPhone" oninput="autoHyphen2(this)" maxlength="13">
		</td>
	</tr>
	<tr>
		<th class="buyerset">배송요청사항</th>
		<td style="padding-left: 20px;">
			<textarea style="width:100%; height: 100px;"></textarea>
		</td>
	</tr>
</table>

<div class="paymentmethod">
<h3>결제 수단</h3>
<label class="radio_paymethod">
<input type="radio" class="radio_paymethod" name="paymentMethod" value="A">
신용카드
</label>
<br>
<label class="radio_paymethod">
<input type="radio" class="radio_paymethod" name="paymentMethod" value="B">
무통장입금
</label>
</div>

<div class="paymentamount">
<h3>결제 금액</h3>
<table style="border-top: 2px solid black; width: 100%; text-align: left;">
	<tr>
		<td class="paT">주문금액</td>
		<td class="paT2" style="font-weight:600;"><span class="orderPrice"></span>원</td>
	</tr>
	<tr>
		<td class="paT">배송비</td>
		<td class="paT2" style="font-weight:600;"><span id="delfee"></span>원</td>
	</tr>
	<tr style="border-top: 1px solid #eee;">
		<td class="paT">총 결제금액</td>
		<td class="paT2" style="font-weight:600;"><span class="resultPrice" style="color:#fa5500;"></span>원</td>
	</tr>
	<tr>
		<th colspan="2"><div class="submitBtn"><button type="submit" id="final-support-submit" style="background-color: black; border:none;">다음으로</button></div></th>
	</tr>
</table>
</div>

</form>

</div>

<c:import url="../layout/footer.jsp" />