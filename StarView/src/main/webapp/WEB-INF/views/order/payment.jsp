<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
  
  <script type="text/javascript">
  $(document).ready(function() {
	  
	  console.log("결제화면")
	  
      var IMP = window.IMP; // 생략가능
      IMP.init('imp28026736');
      var msg;
      
//       var amount = ${amount};
//       var name = ${buyerName};
//       var tel = ${buyerTel};
//       var email = String(${buyerEmail});
      
      IMP.request_pay({
          pg : 'kakaopay',
          pay_method : 'card',
          merchant_uid : 'merchant_' + new Date().getTime(),
          name : '별 보러 가자',
          amount : '${amount}',		//결제할 금액
          buyer_name : '${buyerName}',	//주문자명
          buyer_tel : '${buyerTel}',		//주문자 연락처
          buyer_email : '${buyerEmail}',	//주문자 이메일
          //m_redirect_url : 'http://www.naver.com'
      }, function(rsp) {
          if ( rsp.success ) {
              //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
              jQuery.ajax({
                  url: "/order/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                  type: 'POST',
                  dataType: 'json',
                  data: {
                      perchantUid : rsp.imp_uid
                      buyerName : rsp.buyer_name
                      buyerTel : rsp.buyer_tel
                      buyerEmail : rsp.buyer_email
                      //기타 필요한 데이터가 있으면 추가 전달
                  }
              }).done(function(data) {
                  //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                  if ( everythings_fine ) {
                      msg = '결제가 완료되었습니다.';
                      msg += '\n고유ID : ' + rsp.imp_uid;
                      msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                      msg += '\결제 금액 : ' + rsp.paid_amount;
                      msg += '카드 승인번호 : ' + rsp.apply_num;
                      
                      alert(msg);
                  } else {
                      //[3] 아직 제대로 결제가 되지 않았습니다.
                      //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                  }
              });
              //성공시 이동할 페이지
              location.href='/order/finish';
          } else {
              msg = '결제에 실패하였습니다.';
              msg += '에러내용 : ' + rsp.error_msg;
              //실패시 이동할 페이지
              location.href="/order/payFail";
              alert(msg);
          }
      });
      
  })
  </script>
</head>
<body>
</body>
</html>