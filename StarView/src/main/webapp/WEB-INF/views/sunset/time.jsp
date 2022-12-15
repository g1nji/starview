<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일몰 시간</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script type="text/javascript">
//날짜 선택

$(function() {
	$( "#Date" ).datepicker({
// 	    	format:'yyyy-mm-dd',
	    	autoclose: true
	    })
})

$("#location option:selected").val()

var getFormattedDate = ( d )=>{
	d = new Date( d )
	
	var y = '' + d.getFullYear()
	var m = ('0' + (d.getMonth()+1)).slice(-2, 3)
	var dat = ('0' + d.getDate()).slice(-2, 3)
	
	return y + m + dat
}

$(document).ready(() => {
		
	$("#btn").click(() => {
		console.log("#btn click")
	
		console.log($("#Date").val())
		console.log($("#location option:selected").val())
		
		$.ajax({
			type: "get",
			url: "http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getAreaRiseSetInfo",
			data: {
				type: "xml"
				,locdate: getFormattedDate( $("#Date").val() )
				,location: $("#location option:selected").val()
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
					+ "<th>날짜</th>"
					+ "<th>지역</th>"
// 					+ "<th>경도</th>"
// 					+ "<th>위도</th>"
					+ "<th>일몰 시간</th>"
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
						
						return "&nbsp;" +h + "시&nbsp;" + m + "분&nbsp;"
					};
					
					$("<tr>")
					.append(locdate)
// 					.append( $("<td>").html($(row).find("locdate").text() ) )
					.append( $("<td>").html($(row).find("location").text() ) )
// 					.append( $("<td>").html($(row).find("longitude").text() ) )
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

날짜 선택 : <input type="text" id="Date">
<select id="location">
	<option>강릉</option>
	<option>강화도</option>
	<option>대관령</option>
	<option>대구</option>
	<option>부산</option>
	<option>서울</option>
	<option>양양</option>
	<option>양평</option>
	<option>울릉도</option>
	<option>제주</option>
	<option>주문진</option>
</select>
<!-- 지역 선택 : <input type="text" id="location"> -->
<button id="btn">조회</button>

<div id="resultLayout"></div>

</body>
</html>

<c:import url="../layout/footer.jsp" />