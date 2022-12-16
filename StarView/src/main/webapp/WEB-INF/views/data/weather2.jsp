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
			url:"http://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst",
			data:{
				//Decoding 인증키 사용할것
				serviceKey:"LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="
				,numOfRows:"10"
//				,pageNo:page.value
				,pageNo:"1"
				,stnId:"108"
				,tmFc:$("#Year").val()+$("#Mon").val()+$("#Day").val()+"0600"
			},
			dataType:"xml"
			,success: res=>{ 
				console.log("AJAX 중기예보 성공")
				
				var $rows = $(res).find("item");
			//결과화면 지우기
			resultLayout.innerHTML=''
			
			var wfSv=$rows.find("wfSv").text();
			
			$("#resultLayout").append("전국중기예보: "+wfSv); 
			
			},
			error:()=>{
				console.log("AJAX 실패")
				
			}
			
		})
	
	})
	
	/* $.ajax({
		type:"get",
		url:"http://apis.data.go.kr/1360000/MidFcstInfoService/getMidSeaFcst",
		data:{
			//Decoding 인증키 사용할것
			serviceKey:"LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="
			,numOfRows:"10"
			,pageNo:"1"
			,regId:"12C10000"
			,tmFc:$("#Year").val()+$("#Mon").val()+$("#Day").val()+"0600"
		},
		dataType:"xml"
		,success: res=>{ 
			console.log("AJAX 성공")
			console.log(res)
		
			 var $rows = $(res).find("item");
             
             //결과화면 지우기
             result.innerHTML = ''
             
             var $table = $("<table>")
             var tHead = "<tr>"
                + "<th>3일 후 오전</th>"
                + "<th>3일 후 오전</th>"
                + "<th>4일 후 오전</th>"
                + "<th>4일 후 오전</th>"
                + "<th>5일 후 오전</th>"
                + "<th>5일 후 오전</th>"
                + "<th>6일 후 오전</th>"
                + "<th>6일 후 오전</th>"
                + "<th>7일 후 오전</th>"
                + "<th>7일 후 오전</th>"
                + "<th>8일 후 예보</th>"
                + "<th>9일 후 예보</th>"
                + "<th>10일 후 예보</th>"
                + "<tr>"
                $table.html( tHead )
                
                $rows.each(( i, item ) => {
//                    console.log(i, row)
                   
                   $("<tr>")
                      .append($("<td>").html('<h4 id="wf3Am" >'+$(item).find("wf3Am").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf3Pm" >'+$(item).find("wf3Pm").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf4Am" >'+$(item).find("wf4Am").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf4Pm" >'+$(item).find("wf4Pm").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf5Am" >'+$(item).find("wf5Am").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf5Pm" >'+$(item).find("wf5Pm").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf6Am" >'+$(item).find("wf6Am").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf6Pm" >'+$(item).find("wf6Pm").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf7Am" >'+$(item).find("wf7Am").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf7Pm" >'+$(item).find("wf7Pm").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf8" >'+$(item).find("wf8Am").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf9" >'+$(item).find("wf9Am").text()+'</h4>' ) )
                      .append($("<td>").html('<h4 id="wf10" >'+$(item).find("wf10Am").text()+'</h4>' ) )
                   .appendTo( $table )
                })

                
                $table.appendTo( $("#result") )
                
			/* var $rows = $(res).find("item");
		//결과화면 지우기
		resultLayout.innerHTML=''
		
		var wf3Am=$rows.find("wf3Am").text();
		
		$("#resultLayout").append("전국중기예보: "+wf3Am);  */
		 */
		},
		error:()=>{
			console.log("AJAX 실패")
			
		}
		
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
<div id="result"></div>

</body>
</html>