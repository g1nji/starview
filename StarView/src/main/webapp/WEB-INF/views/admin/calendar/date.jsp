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
				//선택한 시간 값이 전달되도록 바꾸기
				, tmFc: document.getElementById('Date').value
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
				
				var $table = $("<br><table class='table table-striped table table-bordered'>")
				var tHead = "<tr>"
					+ "<td>" + caseDay(day+3) +" 오전 강수 확률</td>"
					+ "<td>" + caseDay(day+3) +" 오후 강수 확률</td>"
					+ "<td>" + caseDay(day+4) +" 오전 강수 확률</td>"
					+ "<td>" + caseDay(day+4) +" 오후 강수 확률</td>"
					+ "<td>" + caseDay(day+5) +" 오전 강수 확률</td>"
					+ "<td>" + caseDay(day+5) +" 오후 강수 확률</td>"
					+ "<td>" + caseDay(day+6) +" 오전 강수 확률</td>"
					+ "<td>" + caseDay(day+6) +" 오후 강수 확률</td>"
					+ "<td>" + caseDay(day+7) +" 오전 강수 확률</td>"
					+ "<td>" + caseDay(day+7) +" 오후 강수 확률</td>"
					+ "<td>" + caseDay(day+3) +" 오전 날씨예보</td>"
					+ "<td>" + caseDay(day+3) +" 오후 날씨예보</td>"
					+ "<td>" + caseDay(day+4) +" 오전 날씨예보</td>"
					+ "<td>" + caseDay(day+4) +" 오후 날씨예보</td>"
					+ "<td>" + caseDay(day+5) +" 오전 날씨예보</td>"
					+ "<td>" + caseDay(day+5) +" 오후 날씨예보</td>"
					+ "<td>" + caseDay(day+6) +" 오전 날씨예보</td>"
					+ "<td>" + caseDay(day+6) +" 오후 날씨예보</td>"
					+ "<td>" + caseDay(day+7) +" 오전 날씨예보</td>"
					+ "<td>" + caseDay(day+7) +" 오후 날씨예보</td>"
					+ "</tr>";
					
				$table.html(tHead)
				
				//$rows.each(function(idx, ele) {
				//})
				
					//console.log($rows.find("regId").text())
					
				$("<tr>")
					.	append($("<td>").append($rows.find("rnSt3Am").text()))
					.	append($("<td>").append($rows.find("rnSt3Pm").text()))
					.	append($("<td>").append($rows.find("rnSt4Am").text()))
					.	append($("<td>").append($rows.find("rnSt4Pm").text()))
					.	append($("<td>").append($rows.find("rnSt5Am").text()))
					.	append($("<td>").append($rows.find("rnSt5Pm").text()))
					.	append($("<td>").append($rows.find("rnSt6Am").text()))
					.	append($("<td>").append($rows.find("rnSt6Pm").text()))
					.	append($("<td>").append($rows.find("rnSt7Am").text()))
					.	append($("<td>").append($rows.find("rnSt7Pm").text()))
					.	append($("<td>").append($rows.find("wf3Am").text()))
					.	append($("<td>").append($rows.find("wf3Pm").text()))
					.	append($("<td>").append($rows.find("wf4Am").text()))
					.	append($("<td>").append($rows.find("wf4Pm").text()))
					.	append($("<td>").append($rows.find("wf5Am").text()))
					.	append($("<td>").append($rows.find("wf5Pm").text()))
					.	append($("<td>").append($rows.find("wf6Am").text()))
					.	append($("<td>").append($rows.find("wf6Pm").text()))
					.	append($("<td>").append($rows.find("wf7Am").text()))
					.	append($("<td>").append($rows.find("wf7Pm").text()))
				.appendTo($table)
				
					$table.appendTo($('#resultLayout'))
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

//오늘 날짜
var today = new Date();
console.log(today);

//현재 시
var hour = today.getHours();
console.log(hour);

//오늘 일자
var date = today.getDate();
console.log(date);

//오늘 요일
var day = today.getDay();
console.log(day);


function caseDay(day) {
	var day2 = "";
	
	switch(day){
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
	}
	return day2;
}

console.log("---");
console.log(caseDay(day));
console.log(caseDay(day+1));

</script>

</head>
<body>

<h1>관측일자</h1>
<hr>

<h3><날짜 입력></h3>
<h5> ex) YYYYMMDD0600(1800) *최근 24시간 이내만 조회가능합니다* </h5>
<input type="text" id="Date"><br><br>

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


<c:import url="../layout/footer.jsp" />