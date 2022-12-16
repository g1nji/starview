<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일몰 시간</title>

<style type="text/css">

#locDiv {
	width: 371px;
	height: 500px;
	float:right;
    right: 115px;
    position: relative;
}
.locBg {
	background-image:url("/resources/starImg/sunset_map.png");
}

label {
	position: relative;
}

span {
	color: white;
}


</style>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script type="text/javascript">

//날짜 선택
$(function() {
	$( "#Date" ).datepicker({
	    	autoclose: true
	    })
})


//datepicker로 선택한 날짜를 api 응답 데이터 형식에 맞게 변환
var getFormattedDate = ( d )=>{
	d = new Date( d )
	
	var y = '' + d.getFullYear()
	var m = ('0' + (d.getMonth()+1)).slice(-2, 3)
	var dat = ('0' + d.getDate()).slice(-2, 3)
	
	return y + m + dat
}

	//지역 선택
// 	var selectlocation = $("#location option:selected").val();
	var selectlocation = $('input[name="location"]:checked').val();

$(document).ready(() => {
	
	
	$("#btn").click(() => {
		console.log("#btn click")
	
		console.log($("#Date").val())
		console.log($('input[name="location"]:checked').val())
		
		
		$.ajax({
			type: "get",
			url: "http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo",
			data: {
				type: "xml"
				,locdate: getFormattedDate( $("#Date").val() )
				,location: $('input[name="location"]:checked').val()
			,ServiceKey: "uej3x/SsIAytAndt4BMIKuPLeCRuvBJL1aMC+iIe3gzxsas6kdk0hv7SLipcQPprTnEOdxDKToBjNSPqXw2nrQ=="
			},
			dataType:"xml",
			success: res => {
				console.log("AJAX 성공")
// 				console.log( res )
				
				//<item>태그 추출하기
				var $rows = $(res).find("item");
// 				console.log( $rows )
				
				//결과화면 지우기
				resultLayout.innerHTML = ''
				
				
				var $table = $("<table>")
				var tHead = "<tr>"
// 					+ "<th>날짜</th>"
// 					+ "<th>지역</th>"
					+ "<th></th>"
// 					+ "<th></th>"
// 					+ "<th></th>"
// 					+ "<th>경도</th>"
// 					+ "<th>위도</th>"
// 					+ "<th>일몰 시간</th>"
				$table.html( tHead )
				
					
				$rows.each(( i, row )=> {
					console.log( i, row)
					
					var locdate = function() {
						
						var year = $(row).find("locdate").text().substr(0,4)
						var mm = $(row).find("locdate").text().substr(4,2)
						var dd = $(row).find("locdate").text().substr(6,2)
						
						return year + "년&nbsp;" + mm + "월&nbsp;" + dd + "일&nbsp;"
					};
					
					var sunset = function() {
						
						var h = $(row).find("sunset").text().substr(0,2)
						var m = $(row).find("sunset").text().substr(2,2)
						
						return "&nbsp;" +h + "시&nbsp;" + m + "분&nbsp; 입니다"
					};
					
					$("<tr>")
					.append(locdate)
// 					.append( $("<td>").html($(row).find("locdate").text() ) )
					.append( $("<td>").html($(row).find("location").text() +"의 일몰 시간은" ) )
// 					.append( $("<td>").html($(row).find("longitude").text() ) )-
// 					.append( $("<td>").html($(row).find("latitude").text() ) )
// 					.append( $("<td>").html($(row).find("sunset").text() ) )
					.append(sunset)
				.appendTo( $table )
					
				})
				
				$table.appendTo( $("#resultLayout"))
			},
			error: ()=> {
				console.log("AJAX 실패")
			}
		})
	})
})
	

</script>
</head>
<body>

<h1>일몰 시간 나타내기</h1>

<h4>날짜 선택</h4>
<input type="text" id="Date" style="width:80px;">


<div class="locBg" id="locDiv">
<h4>지역 선택</h4>

<label for="loc1" style="top:45px; left:220px;">
<span>강릉</span>
<input type="radio" name="location" id="loc1" value="강릉">
</label>

<label for="loc2" style="top:83px; left:40px;">
<input type="radio" name="location" id="loc2" value="강화도">
<span>강화도</span>
</label>

<label for="loc3" style="top:68px; left:89px;">
<input type="radio" name="location" id="loc3" value="대관령">
<span>대관령</span>
</label>

<label for="loc4" style="top:230px; left:50px;">
<input type="radio" name="location" id="loc4" value="대구">
<span>대구</span>
</label>

<label for="loc5" style="top:298px; left:18px;">
<input type="radio" name="location" id="loc5" value="부산">
<span>부산</span>
</label>

<label for="loc6" style="top:60px; right: 140px;">
<input type="radio" name="location" id="loc6" value="서울">
<span>서울</span>
</label>

<label for="loc7" style="top:13px; right:96px;">
<span>양양</span>
<input type="radio" name="location" id="loc7" value="양양">
</label>

<label for="loc8" style="top:61px; left:154px;">
<input type="radio" name="location" id="loc8" value="양평">
<span>양평</span>
</label>

</div>

<button id="btn">조회</button>

<div id="resultLayout"></div>

</body>
</html>

<c:import url="../layout/footer.jsp" />