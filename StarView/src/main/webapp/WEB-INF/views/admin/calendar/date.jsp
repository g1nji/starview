<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<c:import url="../layout/header.jsp" />

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
				//라디오로 선택한 지역 값이 전달되도록 바꾸기
				//, regId: regId.value
				//, regId: "$('input[name=regId]:checked').val()"
				, regId: "11B00000"
				//선택한 시간 값이 전달되도록 바꾸기
				, tmFc: "202212160600"
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
				
				var $table = $("<table class='table table-striped table table-bordered'>")
				var tHead = "<tr>"
					+ "<th>3일 후 오전 강수 확률</th>"
					+ "<th>3일 후 오후 강수 확률</th>"
					+ "<th>4일 후 오전 강수 확률</th>"
					+ "<th>4일 후 오후 강수 확률</th>"
					+ "<th>5일 후 오전 강수 확률</th>"
					+ "<th>5일 후 오후 강수 확률</th>"
					+ "<th>6일 후 오전 강수 확률</th>"
					+ "<th>6일 후 오후 강수 확률</th>"
					+ "<th>7일 후 오전 강수 확률</th>"
					+ "<th>7일 후 오후 강수 확률</th>"
					+ "<th>8일 후 강수 확률</th>"
					+ "<th>9일 후 강수 확률</th>"
					+ "<th>10일 후 강수 확률</th>"
					+ "<th>3일 후 오전 날씨예보</th>"
					+ "<th>3일 후 오후 날씨예보</th>"
					+ "<th>4일 후 오전 날씨예보</th>"
					+ "<th>4일 후 오후 날씨예보</th>"
					+ "<th>5일 후 오전 날씨예보</th>"
					+ "<th>5일 후 오후 날씨예보</th>"
					+ "<th>6일 후 오전 날씨예보</th>"
					+ "<th>6일 후 오후 날씨예보</th>"
					+ "<th>7일 후 오전 날씨예보</th>"
					+ "<th>7일 후 오후 날씨예보</th>"
					+ "<th>8일 후 날씨예보</th>"
					+ "<th>9일 후 날씨예보</th>"
					+ "<th>10일 후 날씨예보</th>"
					+ "</tr>";
					
				$table.html(tHead)
				
				//$rows.each(function(idx, ele) {
				//})
				
					console.log($rows.find("regId").text())
					
					$("<tr>")
					.	append($("<td>").html($rows.find("rnSt3Am").text()))
					.	append($("<td>").html($rows.find("rnSt3Pm").text()))
					.	append($("<td>").html($rows.find("rnSt4Am").text()))
					.	append($("<td>").html($rows.find("rnSt4Pm").text()))
					.	append($("<td>").html($rows.find("rnSt5Am").text()))
					.	append($("<td>").html($rows.find("rnSt5Pm").text()))
					.	append($("<td>").html($rows.find("rnSt6Am").text()))
					.	append($("<td>").html($rows.find("rnSt6Pm").text()))
					.	append($("<td>").html($rows.find("rnSt7Am").text()))
					.	append($("<td>").html($rows.find("rnSt7Pm").text()))
					.	append($("<td>").html($rows.find("rnSt8").text()))
					.	append($("<td>").html($rows.find("rnSt9").text()))
					.	append($("<td>").html($rows.find("rnSt10").text()))
					.	append($("<td>").html($rows.find("wf3Am").text()))
					.	append($("<td>").html($rows.find("wf3pm").text()))
					.	append($("<td>").html($rows.find("wf4Am").text()))
					.	append($("<td>").html($rows.find("wf4pm").text()))
					.	append($("<td>").html($rows.find("wf5Am").text()))
					.	append($("<td>").html($rows.find("wf5pm").text()))
					.	append($("<td>").html($rows.find("wf6Am").text()))
					.	append($("<td>").html($rows.find("wf6pm").text()))
					.	append($("<td>").html($rows.find("wf7Am").text()))
					.	append($("<td>").html($rows.find("wf7pm").text()))
					.	append($("<td>").html($rows.find("wf8").text()))
					.	append($("<td>").html($rows.find("wf9").text()))
					.	append($("<td>").html($rows.find("wf10").text()))
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

</script>

</head>
<body>

<h1>기상청 중기육상예보조회 테스트</h1>
<hr>

<!--
<input type="radio" name="regId" value="11B00000" id="regId">서울인천경기도<br>
<input type="radio" name="regId" value="11D10000" id="regId">강원도영서<br>
<input type="radio" name="regId" value="11D20000" id="regId">강원도영동<br>
<input type="radio" name="regId" value="11C20000" id="regId">대전세종충청남도<br>
<input type="radio" name="regId" value="11C10000" id="regId">충청북도<br>
<input type="radio" name="regId" value="11F20000" id="regId">광주전라남도<br>
<input type="radio" name="regId" value="11F10000" id="regId">전라북도<br>
<input type="radio" name="regId" value="11H10000" id="regId">대구경상북도<br>
<input type="radio" name="regId" value="11H20000" id="regId">부산울산경상남도<br>
<input type="radio" name="regId" value="11G00000" id="regId">제주도<br>
-->

<button id="btn">출력</button>
<div id="resultLayout"></div>

<c:import url="../layout/footer.jsp" />