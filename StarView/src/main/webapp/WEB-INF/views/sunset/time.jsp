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

/* 지역 선택하기 */
#locDiv {
    width: 371px;
    height: 500px;
	top: 10px;
    left: 100px;
    margin-bottom: 30px;
    position: relative;
    /* float: right; */
}

/* 지도화면 */
.locBg {
	background-image:url("/resources/starImg/sunset_map.png");
}
/* label 위치 조정하기 위해 position 설정 */
label {
	position: relative;

}

/* 폰트 색 white로 변경 */
span {
	color: white;
	vertical-align: middle;
}

/* 라디오 버튼 수정 */

[type="radio"] {
	vertical-align: middle;
 	appearance: none;
	border: 1px solid white;
	background-color: white;
	border-radius: 50%;
	width: 10px;
	height: 10px;
}

[type="radio"]:checked {
	background-color: #FFB703;
	border: 1px solid #FFB703;
}

[type="radio"]:focus-visible {
  outline-offset: max(2px, 0.1em);
  outline: max(2px, 0.1em) dotted #FFEBBA;
  cursor: pointer;
}

/* 지역/날짜 선택 글씨 수정 */
.selectH {
position: relative;
color: #696966;
}

/* 날짜 선택하기 */
#selectDate {
	width: 158px;
    height: 320px;
    float: right;
    right: 176px;
    position: relative;
}

#btn {
	position: relative;
    width: 125px;
    height: 26px;
    float: right;
    right: 203px;
    bottom: 520px;
    border: 0;
    border-radius: 4px;
    color: #696969;
    background-color: #FFEBBA;
}

#btn:hover {
	color: #FFB703;
}
/* 출력될 글자 */

#locTr {
	color: #4c4c4c;
    font-weight: 700;
    font-size: 15px;
    position: relative;
    bottom: 403px;
    left: 638px;
    padding: 33px;
    display: flex;
    background-color: #fbebb9;
    border-radius: 7px;
    border: 1px solid #fbebb9;
    box-shadow: 3px 3px 3px #c8bfbf;
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
					
					$("<tr id='locTr'>")
					.append(locdate)
// 					.append( $("<td>").html($(row).find("locdate").text() ) )
					.append( $("<td id=<'locTd'>").html($(row).find("location").text() +"의 일몰 시간은" ) )
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

<h1 style="position: relative; left: 80px; color: #505050;">일몰 시간 확인</h1>


<div id="selectDate">
<h2 class="selectH" style="top: 16px; right: 154px; text-shadow: 1px 1px 2px #cecece;">날짜 선택</h2>
<hr style= "position: relative; top: -1px; right: 160px; width: 350px; border-color: #a3a1a154;">
<input type="text" id="Date" style="width:135px; position: relative; right: 150px;" placeholder="날짜를 선택해주세요"/>
</div>


<div>
<h2 class="selectH" style="left: 117px; top: 27px; text-shadow: 1px 1px 2px #cecece;">지역 선택</h2>
<hr style= "position: relative; top: 9px; right: 202px; width: 350px; border-color: #a3a1a185;">
</div>

<div class="locBg" id="locDiv">
<label for="loc1" style="top:73px; left:214px;">
<span>강릉</span>
<input type="radio" name="location" id="loc1" value="강릉">
</label>

<label for="loc2" style="top:127px; left:45px;">
<input type="radio" name="location" id="loc2" value="강화도">
<span>강화도</span>
</label>

<label for="loc3" style="top:99px; left:104px;">
<input type="radio" name="location" id="loc3" value="대관령">
<span>대관령</span>
</label>

<label for="loc4" style="top:272px; left:64px;">
<input type="radio" name="location" id="loc4" value="대구">
<span>대구</span>
</label>

<label for="loc5" style="top:327px; left:21px;">
<span>부산</span>
<input type="radio" name="location" id="loc5" value="부산">
</label>

<label for="loc6" style="top:101px; right: 124px;">
<input type="radio" name="location" id="loc6" value="서울">
<span>서울</span>
</label>

<label for="loc7" style="top:44px; right:81px;">
<span>양양</span>
<input type="radio" name="location" id="loc7" value="양양">
</label>

<label for="loc8" style="top:114px; right:170px;">
<input type="radio" name="location" id="loc8" value="양평">
<span>양평</span>
</label>

<label for="loc9" style="top:109px; left:230px;">
<input type="radio" name="location" id="loc9" value="태백">
<span>태백</span>
</label>

<label for="loc10" style="top:274px; left:82px;">
<input type="radio" name="location" id="loc10" value="남원">
<span>남원</span>
</label>

<label for="loc11" style="top:435px; right:10px;">
<input type="radio" name="location" id="loc11" value="제주">
<span>제주</span>
</label>

<label for="loc12" style="top:82px; left:195px;">
<input type="radio" name="location" id="loc12" value="울릉도">
<span style="color: black;">울릉도</span>
</label>

<label for="loc13" style="top:117px; left:159px;">
<input type="radio" name="location" id="loc13" value="독도">
<span style="color: black;">독도</span>
</label>

<label for="loc14" style="top:331px; right:43px;">
<input type="radio" name="location" id="loc3" value="진주">
<span>진주</span>
</label>

<label for="loc3" style="top:144px; right: 141px;">
<input type="radio" name="location" id="loc3" value="천안">
<span>천안</span>
</label>

<label for="loc3" style="top: 177px; right: 185px;">
<input type="radio" name="location" id="loc3" value="대전">
<span>대전</span>
</label>

<label for="loc3" style="top:246px; left:235px;">
<span>울산</span>
<input type="radio" name="location" id="loc14" value="울산">
</label>

<label for="loc15" style="top:223px; left:68px;">
<input type="radio" name="location" id="loc15" value="전주">
<span>전주</span>
</label>

<label for="loc16" style="top:78px; left:104px;">
<input type="radio" name="location" id="loc16" value="영월">
<span>영월</span>
</label>

<label for="loc17" style="top:278px; right:61px;">
<span>광주</span>
<input type="radio" name="location" id="loc17" value="광주">
</label>

<label for="loc18" style="top:191px; left: 73px;">
<span>포항</span>
<input type="radio" name="location" id="loc18" value="포항">
</label>

<label for="loc19" style="top:339px; right:92px;">
<span>여수</span>
<input type="radio" name="location" id="loc19" value="여수">
</label>

</div> <!-- 지역선택 전체 div 끝 -->

<button id="btn">일몰시간 확인</button>

<div id="resultLayout"></div>

</body>
</html>

<c:import url="../layout/footer.jsp" />