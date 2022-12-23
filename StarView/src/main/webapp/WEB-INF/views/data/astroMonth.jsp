<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:import url="./mouse.jsp" /> --%>
<c:import url="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.out{
margin-top: 40px;
}
#Year, #Mon{
    position: relative;
    width: 90px;
    height: 40px;
    border: solid 1px #dadada;
    background: #fff;
    box-sizing: border-box;
    margin-top:7px;
}
#resultLayout{
margin-bottom:3%;
height: auto;

}

#astroEvent{
width:700px;
margin-left: 25px;
font-size: 16px;
}

#btn, #open, #close {
	font-family: 'Noto Sans KR', sans-serif;
    border-radius: 5px;
	display: inline-block;
    position: relative;
    padding: 10px 20px;
    margin-bottom:10px;
    border: 1px solid #fff;
	background-color:#FFE5F1;
    text-align: center;
    text-decoration: none;
}

#btn:hover{
background-color: #F2D7D9;
    color: black;

}

#title{
	text-align: center;
/* 	float: left; */
    margin-bottom: 10px;
}
table{
	border-collapse: collapse;
  	border-radius: 1em;
  	overflow: hidden;
    border-radius: 10px;
 	width:1150px;
  	box-shadow: 0 0 20px rgba(0,0,0,0.1);
  	height:auto;
    margin-top: 30px;
 }
 

.box{
	float: right;
}

.wordbox{
	display:none;
}

#space{
width:600px;
}


/* body {
  margin: 0;
  background: linear-gradient(45deg, #49a09d, #5f2c82);
  font-family: sans-serif;
  font-weight: 100;
}
 */

th,td {
  padding: 15px;
  background-color: rgba(255,255,255,0.2);
 /*  color: #fff; */
}

th {
/* background-color: #FFE5F1; */
background-color: #C0DEFF;
font-size: 17px;
text-align:center;
font-size: 600;
}

tr:hover {
      background-color: #FFFBE7;
/*       background-color: rgba(255,255,255,0.3); */
    }

.h4_title {
    margin-bottom: 10px;
    padding-left: 20px;
    background: url(/resources/images/ico/h2_title.gif) 0 7px no-repeat;
    font-size: 16px;
    color: #1f1f1f;
    font-weight: bold;
    margin-top: 15px;
}

.word{
line-height: 1.8;

}

.wordli::marker {
  content: '❤ ';
  color: pink;
}
</style>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

function showText(){
	document.querySelector("#wordbox").style.display="block";
	document.querySelector("#open").style.display="none";
}

function hideText(){
	document.querySelector("#wordbox").style.display="none";
	document.querySelector("#open").style.display="block";
}

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
			solYear:$("#Year").val()
			,solMonth:$("#Mon").val()
            ,ServiceKey: "LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="

         },
         dataType: "xml",
         success:  res => {

            console.log("AJAX 성공")
            
  			 console.log( $(res).find("item") )
             var $rows = $(res).find("item");
             
             
             //결과화면 지우기
             resultLayout.innerHTML = ''
             
             var $table = $("<table>")
             var tHead = "<tr>"
                + "<th>날짜</th>"
//                + "<th>순번</th>"
                + "<th>시간</th>"
                + "<th>천문현상</th>"
                + "<th>대표현상</th>"
//                + "<th>비고</th>"
                + "<tr>"
                $table.html( tHead )
                
//                 $rows.each(function( idx, ele ) {
//                 })

                $rows.each(( i, item ) => {
//                    console.log(i, row)
                   
                   $("<tr>")
                      .append($("<td>").html('<h4 id="locdate" >'+$(item).find("locdate").text()+'</h4>' ) )
   //                   .append($("<td>").html($(item).find("seq").text() ) )
                      .append($("<td>").html('<h4 id="astroTime">'+$(item).find("astroTime").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="astroEvent">'+$(item).find("astroEvent").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="astroTitle">'+$(item).find("astroTitle").text()+'</h4>' ) )
//                      .append($("<td>").html($(item).find("astroEvent").text() ) )
//                      .append($("<td>").html($(item).find("remarks").text() ) )
                   .appendTo( $table )
                })

                
                $table.appendTo( $("#resultLayout") )
                
       
           
         },
         error: () => {
        	 alert("실패")
            console.log("AJAX 실패")
         }
      })
      
   })
   $("#btn").trigger("click");
   
})


</script>

</head>
<body>

<div class="out">

<div id="title">
<h2>이달의 천문현상🌟</h2>
</div>


<div class="box">
<!-- <input type="text" name="Year" id="Year" placeholder="년">-->
<select id="Year">
	<option value="2015">2015년</option>
	<option value="2016">2016년</option>
	<option value="2017">2017년</option>
	<option value="2018">2018년</option>
	<option value="2019">2019년</option>
	<option value="2020">2020년</option>
	<option value="2021">2021년</option>
	<option value="2022">2022년</option>
	<option value="2023">2023년</option>
</select>
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
	<button id="btn">검색</button>
</div>
</div>
<div id="resultLayout" class="resultLayout">
<img id="space" src="/resources/img/spacepenguin.png">
</div>
<div id="leftbox" class="leftbox">
<button id="open" onclick="showText()">설명보기</button>
<div id="wordbox" class="wordbox">
<h4 id="h4_title">🪐천문력의 용어설명</h4>
<ul class="word">
			<li class="wordli"><strong>충</strong>: 외행성과 태양사이에 지구가 위치하여 태양과 외행성의 시황경 차이가 180˚가 되는 현상, 즉 태양-지구-외행성 순서로 위치한 때이다.</li>
			<li class="wordli"><strong>합</strong>: 지구와 외행성 사이에 태양이 위치하여 태양과 외행성의 시황경이 같게 되는 현상, 즉 외행성-태양-지구 순서로 위치한 때이다.</li>
			<li class="wordli"><strong>내합과 외합</strong>: 내합과 외합의 시각은 태양과 내행성 (수성, 금성)의 시황경이 같게 되는 시각이며, 내행성이 태양과 지구 사이에 있는 경우를 내합, 내행성과 지구 사이에 태양이 있을 때를 외합이라 한다.</li>
			<li class="wordli"><strong>유</strong>: 행성의 시적경이 변하지 않는 시간이며, 이 때의 시적위의 변화는 완만하여 항성에 대하여 시운동은 거의 정지된 상태이다.</li>
			<li class="wordli"><strong>최대이각</strong>: 태양과 내행성의 각거리가 최대로 되는 각도이며, 지구에서 볼 때, 태양의 동쪽으로 최대 각거리에 있는 경우를 동방최대이각, 서쪽에 있는 경우를 서방 최대이각이라 한다.</li>
			<li class="wordli"><strong>근일점</strong>: 태양과 지구 사이의 거리가 최소가 되는 지점이다. </li>
			<li class="wordli"><strong>원일점</strong>: 태양과 지구 사이의 거리가 최대가 되는 지점이다. </li>
			<li class="wordli"><strong>월령</strong>: 바로 직전 합삭 시작으로부터 매일 오후 9시까지의 시간을 말한다.			</li>
			<li class="wordli"><strong>AU (Astronomical Unit)</strong>: 태양과 지구 사이의 평균거리(1.496 X 10^11km)를 말한다.</li>
			<li class="wordli"><strong>ZHR (Zenithal Hourly Rate)</strong>: 6.5등성까지는 보이는 맑은 밤, 유성우의 복사점이 천정에 있다고 가정할 때 1시간 동안 한 사람이 맨눈으로 관측할 수 있는 유성의 수, 실제로 관측할 수 있는 것은 이보다 적다.</li>
		</ul>
	<button id="close" onclick="hideText()">설명닫기</button>
</div>
</div>

</body>
</html>
<c:import url="../layout/footer.jsp" />