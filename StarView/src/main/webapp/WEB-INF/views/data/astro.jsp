<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
//오늘 날짜
function init(){
	var newDate=new Date();
	
	//년
	$("#Year").val(newDate.getFullYear());

	//월
	var mon= newDate.getMonth()+1;
	if(mon<10) mon = "0"+mon;
	
	$("#Mon").val(mon);
	
	//일
	var day= newDate.getDate();
	if(day<10) day = "0"+day;
	
	$("#Day").val(day);
}

$(document).ready(() => {
	init();
   $("#btn").click(() => {
      console.log("#btn click")      
      
      $.ajax({
         type: "get",
         url: "http://apis.data.go.kr/B090041/openapi/service/AstroEventInfoService/getAstroEventInfo",
         data: {
            //Decoding 키로 인증키 사용할 것 
//            , type: "xml"
//             , pageNo: "1"
//            , pageNo: page.value
//            , numOfRows: "10"
			solYear:$("#Year").val()
			,solMonth:$("#Mon").val()
            ,ServiceKey: "LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="

         },
         dataType: "xml",
         success: res => {
            console.log("AJAX 성공")
            
            //xml 응답 데이터
 //            console.log( res )
            
            //xml문서를 jQuery 객체로 변환 (jQuery DOM)
 //            console.log( $(res) )
            
            //대피소 정보인 <row> 태그 추출
          console.log( $(res).find("item") )
            var $rows = $(res).find("item");
            
            
            //결과화면 지우기
            resultLayout.innerHTML = ''
            
            var $table = $("<table>")
            var tHead = "<tr>"
               + "<th>날짜</th>"
//               + "<th>순번</th>"
               + "<th>천문현상명</th>"
               + "<th>천문현상시간</th>"
               + "<th>천문현상</th>"
               + "<th>비고</th>"
               + "<tr>"
               $table.html( tHead )
               
//                $rows.each(function( idx, ele ) {
//                })

               $rows.each(( i, item ) => {
//                   console.log(i, row)
                  
                  $("<tr>")
                     .append($("<td>").html($(item).find("locdate").text() ) )
  //                   .append($("<td>").html($(item).find("seq").text() ) )
                     .append($("<td>").html($(item).find("astroTitle").text() ) )
                     .append($("<td>").html($(item).find("astroTime").text() ) )
                     .append($("<td>").html($(item).find("astroEvent").text() ) )
                     .append($("<td>").html($(item).find("remarks").text() ) )
                  .appendTo( $table )

               })
               
               $table.appendTo( $("#resultLayout") )
               
         },
         error: () => {
            console.log("AJAX 실패")
         }
      })
      
   })
   
})

//함수 정의 방법1
function func1(a, b) {
   return a + b;
}

//함수 정의 방법2
var func2 = (a, b) => {
   return a + b;
}

</script>

</head>
<body>

<h1>이달의 천문현상</h1>
<h3>12월</h3>
<hr>
<div class="box">
	<input type="text" name="Year" id="Year">년
	<select id="Mon">
		<option value="01">1월</option>
		<option value="02">2월</option>
		<option value="03">3월</option>
		<option value="04">4월</option>
		<option value="05">5월</option>
		<option value="06">6월</option>
		<option value="07">7월</option>
		<option value="08">8월</option>
		<option value="09">9월</option>
		<option value="10">10월</option>
		<option value="11">11월</option>
		<option value="12">12월</option>
	</select>
	<select id="Day">
		<option value="01">1일</option>
		<option value="02">2일</option>
		<option value="03">3일</option>
		<option value="04">4일</option>
		<option value="05">5일</option>
		<option value="06">6일</option>
		<option value="07">7일</option>
		<option value="08">8일</option>
		<option value="09">9일</option>
		<option value="10">10일</option>
		<option value="11">11일</option>
		<option value="12">12일</option>
		<option value="13">13일</option>
		<option value="14">14일</option>
		<option value="15">15일</option>
		<option value="16">16일</option>
		<option value="17">17일</option>
		<option value="18">18일</option>
		<option value="19">19일</option>
		<option value="20">20일</option>
		<option value="21">21일</option>
		<option value="22">22일</option>
		<option value="23">23일</option>
		<option value="24">24일</option>
		<option value="25">25일</option>
		<option value="26">26일</option>
		<option value="27">27일</option>
		<option value="28">28일</option>
		<option value="29">29일</option>
		<option value="30">30일</option>
		<option value="31">31일</option>
	</select>
	

</div>

<button id="btn">실행</button>

<div id="resultLayout"></div>

</body>
</html>
<c:import url="../layout/footer.jsp" />