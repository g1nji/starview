<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:import url="../layout/header.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- jQuery 달력 위젯 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">

<script type="text/javascript">

$(document).ready(() => {
	$("#btn").click( () => {
		console.log("#btn click")
		
		$("#form").css("display","block") 
		$("#form1").css("display","block") 
		$("#form2").css("display","block") 
		
		//관측 일자 API
		$.ajax({
			type: "get",
			url: "https://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst",
			data: {
				//Decoding 키로 인증키 사용할 것
				﻿ServiceKey: "HUX9citK/sR/IT0h00RSOT3xZiWp3Z0k53TKchVpMMHvhDlsWyt5RPdgiWNgn6stT/j7G0MOlITMLrHNSBoRHA=="
				, type: "xml"
				, pageNo: "1"
				//, pageNo: page.value
				, numOfRows: "10"
				, regId: $('input[name="regId"]:checked').val()
				//, tmFc: document.getElementById('Date').value
				, tmFc: caseHour(hour)
			},
			dataType: "xml",
			success: res=>{
				console.log("AJAX 성공")	
				//테스트
				//xml 응답 데이터
				console.log(res)
				
				//xml문서를 jQuery 객체로 변환(jQuery DOM)
				console.log($(res))
				
				//<item> 태그 추출
				//console.log($(res).find("item"))
				
				var $rows = $(res).find("item");
				
				//결과 화면 지우기
				resultLayout.innerHTML = '';
				
				//강수확률
				var d = "<h3> 오늘은 " +ymd3 + " " + caseD(day) + " 입니다</h3>"
				
				var $table = $("<br><table class='table table-striped table table-bordered' style='width: 300px; float:left; margin-right: 20px;'>")
				var tt = "<tr><th> 강수확률 </th>"
					+ "<th> 오전 </th>"
					+ "<th> 오후 </th></tr>"
					
					+ "<tr><th>" + caseDay(day+3) + "</th>"
					+ "<td>" + $rows.find("rnSt3Am").text() +"</td>"
					+ "<td>" + $rows.find("rnSt3Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+4) + "</th>"
					+ "<td>" + $rows.find("rnSt4Am").text() +"</td>"
					+ "<td>" + $rows.find("rnSt4Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+5) + "</th>"
					+ "<td>" + $rows.find("rnSt5Am").text() +"</td>"
					+ "<td>" + $rows.find("rnSt5Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+6) + "</th>"
					+ "<td>" + $rows.find("rnSt6Am").text() +"</td>"
					+ "<td>" + $rows.find("rnSt6Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+7) + "</th>"
					+ "<td>" + $rows.find("rnSt7Am").text() +"</td>"
					+ "<td>" + $rows.find("rnSt7Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+8) + "</th>"
					+ "<td colspan='2'>" + $rows.find("rnSt8").text() +"</td></tr>"

					+ "<tr><th>" + caseDay(day+9) + "</th>"
					+ "<td colspan='2'>" + $rows.find("rnSt10").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+10) + "</th>"
					+ "<td colspan='2'>" + $rows.find("rnSt10").text() +"</td></tr>"
					
				$table.html(tt)
				$table.appendTo($('#resultLayout'))
				
				//날씨예보
				var $table2 = $("<table class='table table-striped table table-bordered' style='width: 300px; float:left; margin-right: 20px;'>")
				var tt2 = "<tr><th> 날씨예보 </th>"
					+ "<th> 오전 </th>"
					+ "<th> 오후 </th></tr>"
					
					+ "<tr><th>" + caseDay(day+3) + "</th>"
					+ "<td>" + $rows.find("wf3Am").text() +"</td>"
					+ "<td>" + $rows.find("wf3Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+4) + "</th>"
					+ "<td>" + $rows.find("wf4Am").text() +"</td>"
					+ "<td>" + $rows.find("wf4Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+5) + "</th>"
					+ "<td>" + $rows.find("wf5Am").text() +"</td>"
					+ "<td>" + $rows.find("wf5Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+6) + "</th>"
					+ "<td>" + $rows.find("wf6Am").text() +"</td>"
					+ "<td>" + $rows.find("wf6Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+7) + "</th>"
					+ "<td>" + $rows.find("wf7Am").text() +"</td>"
					+ "<td>" + $rows.find("wf7Pm").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+8) + "</th>"
					+ "<td colspan='2'>" + $rows.find("wf8").text() +"</td></tr>"

					+ "<tr><th>" + caseDay(day+9) + "</th>"
					+ "<td colspan='2'>" + $rows.find("wf10").text() +"</td></tr>"
					
					+ "<tr><th>" + caseDay(day+10) + "</th>"
					+ "<td colspan='2'>" + $rows.find("wf10").text() +"</td></tr>"
					
				$table2.html(tt2)
				$table2.appendTo($('#resultLayout'))
				
				//$rows.each(function(idx, ele) {
				//})
				
				//console.log($rows.find("regId").text())
			},
			error: ()=> {
				console.log("AJAX 실패")
			}
		})
		
	})
})

//함수 정의 방법1
function func1(a,b) {
	return a + b;
}

//함수 정의 방법2
var func2 = (a, b) => {
	return a + b;
}

//날짜
var today = new Date();

//연도
var year = today.getFullYear();

//월
var month = today.getMonth() + 1;

//일
var date = today.getDate();

//오늘 날짜
var ymd = year + "" + month + "" +date;
var ymd3 = year + "/" + month + "/" + date;

//어제 날짜
var ymd2 = year + "" + month + "" + (date-1);

//console.log(ymd +" ::: " + ymd3 + " ::: " + ymd2);

//현재 시
var hour = today.getHours();

//오늘 요일
var day = today.getDay();

//시간에 따른 날짜값
function caseHour(hour) {
	var tm = "";
	
	if(hour >= 0 && hour < 18) {
		tm = ymd2 + "" + "1800";
	} else if(hour >= 18 && hour <= 23) {
		tm = ymd + "" + "0600";
	}
	return tm;
}

console.log(caseHour(hour));
console.log(caseDay(day+10));

//요일값
function caseD(day) {
	var day3 = "";
	
	switch(day) {
	case 0:
		day3 = "일요일";
		break;
	case 1:
		day3 = "월요일";
		break;
	case 2:
		day3 = "화요일";
		break;
	case 3:
		day3 = "수요일";
		break;
	case 4:
		day3 = "목요일";
		break;
	case 5:
		day3 = "금요일";
		break;
	case 6:
		day3 = "토요일";
		break;
	}
	return day3;
}

//시간에 따른 요일값
function caseDay(day) {
	var day2 = "";
	
	if(hour >= 0 && hour < 18) {
		switch(day-1) {
		case 0:
			day2 = "일요일";
			break;
		case 1:
			day2 = "월요일";
			break;
		case 2:
			day2 = "화요일";
			break;
		case 3:
			day2 = "수요일";
			break;
		case 4:
			day2 = "목요일";
			break;
		case 5:
			day2 = "금요일";
			break;
		case 6:
			day2 = "토요일";
			break;
		case 7:
			day2 = "일요일";
			break;
		case 8:
			day2 = "월요일";
			break;
		case 9:
			day2 = "화요일";
			break;
		case 10:
			day2 = "수요일";
			break;
		case 11:
			day2 = "목요일";
			break;
		case 12:
			day2 = "금요일";
			break;
		case 13:
			day2 = "토요일";
			break;
		case 14:
			day2 = "일요일";
			break;
		case 15:
			day2 = "월요일";
			break;
		case 16:
			day2 = "화요일";
			break;
		}
	} else if(hour >= 18 && hour <= 23) {
		switch(day) {
		case 0:
			day2 = "일요일";
			break;
		case 1:
			day2 = "월요일";
			break;
		case 2:
			day2 = "화요일";
			break;
		case 3:
			day2 = "수요일";
			break;
		case 4:
			day2 = "목요일";
			break;
		case 5:
			day2 = "금요일";
			break;
		case 6:
			day2 = "토요일";
			break;
		case 7:
			day2 = "일요일";
			break;
		case 8:
			day2 = "월요일";
			break;
		case 9:
			day2 = "화요일";
			break;
		case 10:
			day2 = "수요일";
			break;
		case 11:
			day2 = "목요일";
			break;
		case 12:
			day2 = "금요일";
			break;
		case 13:
			day2 = "토요일";
			break;
		case 14:
			day2 = "일요일";
			break;
		case 15:
			day2 = "월요일";
			break;
		case 16:
			day2 = "화요일";
			break;
		}
	}
	return day2;
}

//console.log(caseDay(day));
//console.log(caseDay(day+1));

</script>

</head>
<body>

<h1>관측일자</h1>
<hr>

<!-- <h3><날짜 입력></h3>
<h5> ex) YYYYMMDD0600(1800) *최근 24시간 이내만 조회가능합니다* </h5>
<input type="text" id="Date"><br><br> -->

<h3><지역 선택></h3>
<input type="radio" name="regId" value="11B00000"> 서울, 인천, 경기도
<input type="radio" name="regId" value="11D10000"> 강원도(영서)
<input type="radio" name="regId" value="11D20000"> 강원도(영동)
<input type="radio" name="regId" value="11C20000"> 대전, 세종, 충청남도
<input type="radio" name="regId" value="11C10000"> 충청북도<br>
<input type="radio" name="regId" value="11F20000"> 광주, 전라남도
<input type="radio" name="regId" value="11F10000"> 전라북도
<input type="radio" name="regId" value="11H10000"> 대구, 경상북도
<input type="radio" name="regId" value="11H20000"> 부산, 울산, 경상남도
<input type="radio" name="regId" value="11G00000"> 제주도<br><br>

<button id="btn">조회</button>
<div id="resultLayout"></div>

<div id="form" style="display: none;">
지역 <input id="form1" type="text" style="width: 300px; height: 140px; display: none;"><br>
추천일 <input id="form2" type="text" style="width: 300px; height: 140px; display: none;">입력한 내용이 DB에 저장되도록
</div>
<c:import url="../layout/footer.jsp" />