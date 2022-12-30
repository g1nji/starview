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
	
	//$("#btn3").click( () => {
	//	$("#form").css("display","block") 
	//	$("#form1").css("display","block") 
	//	$("#form2").css("display","block") 
	//	$("#form3").css("display","block") 
	//})
	
	$("#btn").click( () => {
		console.log("#btn click")
		
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
				
				var $table = $("<table class='table' style='width: 300px; float:left; margin-right: 20px;'>")
				var tt = "<tr class='warning'><th> 강수확률 </th>"
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
				var $table2 = $("<table class='table' style='width: 300px; float:left; margin-right: 500px;'>")
				var tt2 = "<tr class='warning'><th> 날씨예보 </th>"
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
	
	//관측 시간 API
	$("#btn2").click(() => {
		console.log("#btn2 click")
		
		$.ajax({
			type: "get"
			, url: "http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo"
			, data: {
				//Decoding 키로 인증키 사용할 것
				ServiceKey: "HUX9citK/sR/IT0h00RSOT3xZiWp3Z0k53TKchVpMMHvhDlsWyt5RPdgiWNgn6stT/j7G0MOlITMLrHNSBoRHA=="
				, locdate: selectDate($("#datepicker").val())
				//, location: $("#b").attr("class")
				, location: $('input[name="location"]:checked').val()
			}
			, dataType: "xml"
			, success: res=>{
				console.log("AJAX 성공")	
				
				//테스트
				//xml 응답 데이터
				console.log(res)
				
				//xml문서를 jQuery 객체로 변환(jQuery DOM)
				//console.log($(res))
				
				//<item> 태그 추출
				//console.log($(res).find("item"))
				
				var $rows = $(res).find("item");
				
				//결과 화면 지우기
				resultLayout.innerHTML = '';
				
				var $table = $("<br><table class='table'>")
				var tHead = "<tr class='warning'>"
					+ "<th>일몰</th>"
					+ "<th>천문박명(저녁)</th>"
					+ "<th>일출</th>"
					+ "<th>천문박명(아침)</th>"
					+ "</tr>";
					
				$table.html(tHead)
				
				$("<tr>")
				.	append($("<td>").html($rows.find("sunset").text()))
				.	append($("<td>").html($rows.find("aste").text()))
				.	append($("<td>").html($rows.find("sunrise").text()))
				.	append($("<td>").html($rows.find("astm").text()))
				.appendTo($table)
				
				$table.appendTo($('#resultLayout2'))
			}
			, error: ()=> {
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
console.log(today);
//console.log(new Date(today.setDate(today.getDate()-1)));

//연도
var year = today.getFullYear();

//월
var month = today.getMonth() + 1;

//일
var date = today.getDate();
console.log(date);
console.log(date+3);

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

//월을 넘어가면 1부터 시작되도록
//28일, 30일, 31일로 끝나는 월 설정도 추가하기...
//시간에 따른 날짜값
function caseDate(date) {
	var d = "";
	
	if(hour >= 0 && hour < 18) {
		d = date+2;
	} else if(hour >= 18 && hour <= 23) {
		d = date+3;
	}
	return d;
}

//시간에 따른 시간값
function caseHour(hour) {
	var tm = "";
	
	if(hour >= 0 && hour < 18) {
		tm = ymd2 + "" + "1800";
	} else if(hour >= 18 && hour <= 23) {
		tm = ymd + "" + "0600";
	}
	return tm;
}

//console.log(caseHour(hour));
//console.log(caseDay(day+10));

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

//달력 위젯
$(document).ready(function() {
	$("#datepicker").datepicker({
        showOn:"button"
        , buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
        , buttonImageOnly: true
        , changeMonth:true
        , changeYear:true
        , yearRange:"-22:+10"
    });
});

//날짜 선택
var selectDate = (d)=>{
	d = new Date(d)
	var y = '' + d.getFullYear()
	var m =  ("0" + (d.getMonth() + 1)).slice(-2)
	var dat = ("0" + d.getDate()).slice(-2)
	
	return y + m + dat
}

</script>
</head>
<body>

<h1>추천일 등록</h1>
<hr>

<div id="dateDiv">
<h3><span style="background-color: #9EA1D4; border-radius: 10%;">관측일자</span>&nbsp;&nbsp;<button id="btn" class="btn btn-defalut btn-sm">일자 조회</button></h3>
<hr>

<!-- <h3><날짜 입력></h3>
<h5> ex) YYYYMMDD0600(1800) *최근 24시간 이내만 조회가능합니다* </h5>
<input type="text" id="Date"><br><br> -->

<h4><지역 선택></h4>
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

<div id="resultLayout"></div>

<div id="timeDiv">
<h3><span style="background-color: #9EA1D4; border-radius: 10%;">관측시간</span>&nbsp;&nbsp;<button id="btn2" class="btn btn-defalut btn-sm">시간 조회</button></h3>
<hr>

<h4><날짜 선택></h4>
<input type="text" id="datepicker">

<hr>

<h4><지역 선택></h4>

<strong>ㄱ</strong><br>
<input type="radio" name="location" value="강릉"> 강릉
<input type="radio" name="location" value="강화도"> 강화도
<input type="radio" name="location" value="거제"> 거제
<input type="radio" name="location" value="거창"> 거창
<input type="radio" name="location" value="경산"> 경산
<input type="radio" name="location" value="경주"> 경주
<input type="radio" name="location" value="고성(강원)"> 고성(강원)
<input type="radio" name="location" value="고양"> 고양
<input type="radio" name="location" value="고흥"> 고흥
<input type="radio" name="location" value="광양"> 광양
<input type="radio" name="location" value="광주"> 광주
<input type="radio" name="location" value="광주(경기)"> 광주(경기)
<input type="radio" name="location" value="구미"> 구미 
<input type="radio" name="location" value="군산"> 군산 
<input type="radio" name="location" value="김천"> 김천 
<input type="radio" name="location" value="김해"> 김해<br>

<strong>ㄴ</strong><br>
<input type="radio" name="location" value="남원"> 남원
<input type="radio" name="location" value="남해"> 남해<br>

<strong>ㄷ</strong><br>
<input type="radio" name="location" value="대관령"> 대관령
<input type="radio" name="location" value="대구"> 대구
<input type="radio" name="location" value="대덕"> 대덕 
<input type="radio" name="location" value="대전"> 대전 
<input type="radio" name="location" value="독도"> 독도
<input type="radio" name="location" value="동해"> 동해<br>

<strong>ㅁ</strong><br>
<input type="radio" name="location" value="마산"> 마산
<input type="radio" name="location" value="목포"> 목포
<input type="radio" name="location" value="무안"> ﻿무안
<input type="radio" name="location" value="밀양"> 밀양<br>

<strong>ㅂ</strong><br>
<input type="radio" name="location" value="변산"> 변산
<input type="radio" name="location" value="보령"> 보령
<input type="radio" name="location" value="보성"> 보성
<input type="radio" name="location" value="보현산"> 보현산 
<input type="radio" name="location" value="부산"> 부산
<input type="radio" name="location" value="부안"> 부안
<input type="radio" name="location" value="부천"> 부천<br>

<strong>ㅅ</strong><br>
<input type="radio" name="location" value="사천"> 사천
<input type="radio" name="location" value="삼척"> 삼척 
<input type="radio" name="location" value="상주"> 상주 
<input type="radio" name="location" value="서귀포"> 서귀포
<input type="radio" name="location" value="서산"> 서산
<input type="radio" name="location" value="서울"> 서울 
<input type="radio" name="location" value="서천"> 서천
<input type="radio" name="location" value="성산일출봉"> 성산일출봉 
<input type="radio" name="location" value="세종"> 세종
<input type="radio" name="location" value="소백산"> 소백산 
<input type="radio" name="location" value="속초"> 속초
<input type="radio" name="location" value="수원"> 수원
<input type="radio" name="location" value="순천"> 순천
<input type="radio" name="location" value="승주"> 승주 
<input type="radio" name="location" value="시흥"> 시흥<br>

<strong>ㅇ</strong><br>
<input type="radio" name="location" value="아산"> 아산 
<input type="radio" name="location" value="안동"> 안동
<input type="radio" name="location" value="안산"> 안산 
<input type="radio" name="location" value="안양"> 안양
<input type="radio" name="location" value="양양"> 양양 
<input type="radio" name="location" value="양평"> 양평
<input type="radio" name="location" value="여수"> 여수
<input type="radio" name="location" value="여수공항"> 여수공항
<input type="radio" name="location" value="여주"> 여주
<input type="radio" name="location" value="영광"> 영광
<input type="radio" name="location" value="영덕"> 영덕
<input type="radio" name="location" value="영월"> 영월 
<input type="radio" name="location" value="영주"> 영주
<input type="radio" name="location" value="영천"> 영천
<input type="radio" name="location" value="완도"> 완도
<input type="radio" name="location" value="용인"> 용인
<input type="radio" name="location" value="울릉도"> 울릉도
<input type="radio" name="location" value="울산"> 울산
<input type="radio" name="location" value="울진"> 울진
<input type="radio" name="location" value="원주"> 원주
<input type="radio" name="location" value="의성"> 의성
<input type="radio" name="location" value="익산"> 익산
<input type="radio" name="location" value="인천"> 인천
<input type="radio" name="location" value="임실"> 임실<br>

<strong>ㅈ</strong><br>
<input type="radio" name="location" value="장수"> 장수
<input type="radio" name="location" value="장흥"> 장흥 
<input type="radio" name="location" value="전주"> 전주
<input type="radio" name="location" value="정읍"> 정읍
<input type="radio" name="location" value="제주"> 제주
<input type="radio" name="location" value="제천"> 제천
<input type="radio" name="location" value="주문진"> 주문진
<input type="radio" name="location" value="진도"> 진도
<input type="radio" name="location" value="진주"> 진주
<input type="radio" name="location" value="진해"> 진해<br>

<strong>ㅊ</strong><br>
<input type="radio" name="location" value="창원"> 창원 
<input type="radio" name="location" value="천안"> 천안
<input type="radio" name="location" value="청주"> 청주
<input type="radio" name="location" value="청주공항"> 청주공항
<input type="radio" name="location" value="추풍령"> 추풍령 
<input type="radio" name="location" value="춘양"> 춘양
<input type="radio" name="location" value="춘천"> 춘천
<input type="radio" name="location" value="충주"> 충주<br>

<strong>ㅌ</strong><br>
<input type="radio" name="location" value="태백"> 태백 
<input type="radio" name="location" value="태안"> 태안
<input type="radio" name="location" value="통영"> 통영<br>

<strong>ㅍ</strong><br>
<input type="radio" name="location" value="파주"> 파주
<input type="radio" name="location" value="평택"> 평택
<input type="radio" name="location" value="포항"> 초항<br>

<strong>ㅎ</strong><br>
<input type="radio" name="location" value="해남"> 해남 
<input type="radio" name="location" value="화성"> 화성
<input type="radio" name="location" value="흑산도"> 흑산도<br><br>

<div id="resultLayout2"></div>
</div>

<hr>

<div id="form">
<form action="./date" method="post">

<label for="form1">지역</label><br>
<input id="form1" name="recomLoc" type="text" style="width: 300px; height: 50px;"><br><br>

<label for="form2">추천일</label><br>
<input id="form2" name="recomDate" type="text" style="width: 300px; height: 50px;"><br><br>

<label for="form3">추천시간</label><br>
<input id="form3" name="recomTime" type="text" style="width: 300px; height: 50px;"><br><br>

<label for="form4">강수확률</label><br>
<input id="form4" name="rain" type="text" style="width: 300px; height: 50px;"><br><br>

<label for="form4">하늘상태</label><br>
<input id="form5" name="sky" type="text" style="width: 300px; height: 50px;"><br><br>

<input type="submit" value="등록" class="btn btn-primary">
</form>
</div>

</div>

<c:import url="../layout/footer.jsp" />