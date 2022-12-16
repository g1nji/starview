<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(() => {
	$("#btn").click( () => {
		console.log("#btn click")
		
		$.ajax({
			type: "get",
			url: "﻿https://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo",
			data: {
				//Decoding 키로 인증키 사용할 것
				﻿ServiceKey: "HUX9citK/sR/IT0h00RSOT3xZiWp3Z0k53TKchVpMMHvhDlsWyt5RPdgiWNgn6stT/j7G0MOlITMLrHNSBoRHA=="
				//선택한 값이 전달되도록 바꾸기
				, locdate: "20150101"
				//선택한 값이 전달되도록 바꾸기
				, location: "서울"
			},
			dataType: "xml",
			success: res=>{
				console.log("AJAX 성공")	
				
				//테스트
				//xml 응답 데이터
				console.log(res)
				
				//xml문서를 jQuery 객체로 변환(jQuery DOM)
				//console.log($(res))
				
				//<item> 태그 추출
				//console.log($(res).find("item"))
				
				//var $rows = $(res).find("item");
				
				//결과 화면 지우기
				resultLayout.innerHTML = '';
				
				var $table = $("<table>")
				var tHead = "<tr>"
					+ "<th>경도</th>"
					+ "</tr>";
					
				$table.html(tHead)
				
				//$("<tr>")
				//.	append($("<td>").html($rows.find("longitude").text()))
				//.appendTo($table)
				
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

<h1>한국천문연구원 출몰시각 테스트</h1>
<hr>

<button id="btn">출력</button>
<div id="resultLayout"></div>
</body>
</html>