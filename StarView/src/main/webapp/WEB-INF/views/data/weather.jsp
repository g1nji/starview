<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

$(document).ready(()=>{	
	init();
	$("#btnn").click(()=>{
		console.log("#btnn click")	

		$.ajax({
			type:"get",
			url:"http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst",
			data:{
				//Decoding 인증키 사용할것
				serviceKey:"LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="
//				serviceKey:"LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik%2B5L2c9H3hxNJeHLffcpGsg%3D%3D"
				,numOfRows:"20"
//				,pageNo:page.value
				,pageNo:"1"
				,dataType:"json"
				,base_date:$("#Year").val()+$("#Mon").val()+$("#Day").val()
				,base_time:"0700"
				,nx:"55"
				,ny:"127"
			},
			dataType:"json"
			,success: res=>{ 
				console.log("AJAX 성공")
				console.log(res)
				console.log("----------")
//				console.log(res.response)
//				console.log(res.response.body.items)
//				console.log(res.response[0].resultCode)
//				console.log(res.response[1].items)
				
				var list=res.response.body.items.item;
//				console.log(res.response[1].body[1].items)
			//결과화면 지우기
			resultLayout.innerHTML=''
			
			
				var $table = $("<table>").html("")
				 var tHead = "<tr>"
               + "<th>﻿발표일자</th>"
               + "<th>﻿발표시각</th>"
               + "<th>﻿x좌표</th>"
               + "<th>y좌표</th>"
               + "<th>﻿자료구분문자</th>"
               + "<th>﻿예보일자</th>"
               + "<th>예보시각</th>"
               + "<th>﻿예보값</th>"
               + "</tr>"
				$table.html(tHead)
				var weather="";
				for(var i=0; i<list.length;i++){
					if(list[i].category=="SKY"){
						weather = "현재 날씨는";
						if(list[i].fcstValue=="1"){
							weather+="맑은 상태로";
						}else if(list[i].fcstValue=="2"){
							weather+="비가 오는 상태로";
						}else if(list[i].fcstValue=="3"){
							weather+="구름이 많은 상태로";
						}else if(list[i].fcstValue=="4"){
							weather+="흐린 상태로";
						}
					}
					if(list[i].category=="PTY"){
						weather="현재 강수형태는 ";
					}else if(list[i].fcstValue<1){
						weather+="비";
					}else if(list[i].fcstValue<30){
						weather+="비/눈";
					}else if(list[i].fcstValue<50){
						weather+="눈";
					}else if(list[i].fcstValue<100){
						weather+="빗방울";
					}
					console.log(weather)
					var temperature="";
					if(list[i].category=="T1H"){
					    temperature="기온은";
					}
					//console.log(temperature)
					console.log(list[i].fcstValue+"℃ 입니다.")
					$table.append(
							$("<tr>")
							 .append($("<td>").html( list[i].baseDate ))
		                     .append($("<td>").html( list[i].baseTime ))
		                     .append($("<td>").html( list[i].nx ))
		                     .append($("<td>").html( list[i].ny ))
		                     .append($("<td>").html( list[i].category ))
		                     .append($("<td>").html( list[i].fcstDate ))
		                     .append($("<td>").html( list[i].fcstTime ))
		                     .append($("<td>").html( list[i].fcstValue )))
				}
				
               $table.appendTo($("#resultLayout"))
				
			},
			error:()=>{
				console.log("AJAX 실패")
				
			}
			
		})
	
	})
	
})



//-----------------------------------------

</script>
</head>
<body>

<h1>날씨</h1>
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

<!-- <input type="number" id="page" style="width:50px;"> -->
<button id="btnn">실행</button>

<div id="resultLayout"></div>

</body>
</html>