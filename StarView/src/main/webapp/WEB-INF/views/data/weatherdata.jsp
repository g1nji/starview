<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.list-group{
    width: 300px;
    text-align: center;
    margin: 0 auto;
}

#title{
    text-align: center;
    margin: 0 auto;
}
#out{
    width: 300px;
   /*  margin: 0 auto;
    margin-bottom: 90px; */
    margin-top: 40px;
     float:left;
}

#titleup{
	margin-top: 40px;
}
.weather {
    margin: 0 20px 0 0;
    border: 1px solid black;
    display: inline-block;
    height:auto;
}

.vis-weather{
    float:left;

}

#resultLayout{
box-sizing: border-box;
font-size: 15px;
width:800px;
}
</style>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://kit.fontawesome.com/8609a8f4cd.js" crossorigin="anonymous"></script>

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

$(document).ready(() => {
	var arr=[];
	var today=new Date();
	var week = new Array('일','월','화','수','목','금','토');
	var year= today.getFullYear();
	var month= today.getMonth()+1;
	var day= today.getDate();
	var hours =today.getHours();
	var minutes = today.getMinutes();
	var hours_al = new Array('02','05','08','11','14','17','20','23');
	var korea = [{'region':'인천','nx':55,'ny':124},
				 {'region':'경기','nx':60,'ny':121},
				 {'region':'강원','nx':92,'ny':131},
				 {'region':'충북','nx':69,'ny':106},
				 {'region':'충남','nx':68,'ny':100},
				 {'region':'전북','nx':63,'ny':89},
				 {'region':'전남','nx':50,'ny':67},
				 {'region':'경북','nx':90,'ny':77},
				 {'region':'경남','nx':91,'ny':106},
				 {'region':'제주','nx':52,'ny':38},];
	
	/* 3시간 단위로 23시까지  */
	for(var i=0; i<hours_al.length;i++){
		var h = hours_al[i] -hours;
		if( h == -1 || h ==0 || h==-2){
			var now =hours_al[i];
		}
		if(hours ==00){
			var now= hours_al[7];
		}
	}
	
	if(hours<10){
		hours='0'+hours;
	}
	if(hours<10){
		hours='0'+month;
	}
	if(hours<10){
		hours='0'+day;
	}
	today = year + "" +month +"" +day;
	
	
	$.each(korea, function(j,k){
			var _nx=korea[j].nx, _ny=korea[j].ny, region=korea[j].region,
			apikey="LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik%2B5L2c9H3hxNJeHLffcpGsg%3D%3D",
			URL="http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
			URL+="?serviceKey=" +apikey;
			URL+="&numOfRows=30&pageNo=1";
			URL+="&base_date="+ today;
			URL+="&base_time="+now+"00";
			URL+="&nx="+_nx+"&ny="+_ny;
		//	console.log(URL)
			arr.push({'url':URL,'region':region});
			

			$.ajax({
					type:'GET',
					url:arr[j].url,
					success:function(data){
						console.log("ajax 성공")
						var $data = $(data).find("response>body>items>item");
						var cate='';
						var temp='';
						var sky='';
						var rain='';
				//		console.log($data)
						$.each($data,function(i,o){
							cate=$(o).find("category").text(); //카테고리 목록
							
							if(cate == 'TMP'){
								temp = $(this).find("fcstValue").text(); 
							}
							
							if(cate == 'SKY'){
								sky = $(this).find("fcstValue").text(); 
							}
							
							if(cate == 'PTY'){
								rain = $(this).find("fcstValue").text(); 
							}
							/* console.log(temp)
							console.log(sky) */
							//console.log(rain)
						});
						
						$('.weather').append('<li class="list-group-item weather_li'+j+'"></li>');
						$('.weather_li'+j).addClass('in'+j);
						$('.in'+j).html(temp+"℃");
						$('.in'+j).prepend(arr[j].region+'&emsp;');
						
						if(rain !=0){
							switch(rain){
							case '1':
								$('.in'+j).append("/ 비");
								$('.in'+j).prepend('<i class="fas fa-cloud-showers-heavy"></i>&emsp;');
								break;
							case '2':
								$('.in'+j).append("/ 비·눈");
								$('.in'+j).prepend('<i class="fas fa-cloud-rain"></i>&emsp;');
								break;
							case '3':
								$('.in'+j).append("/ 눈");
								$('.in'+j).prepend('<i class="far fa-snowflake"></i>&emsp;');
								break;
							}
						}else{
							switch(sky){
							case '1':
								$('.in'+j).append("/ 맑음");
								$('.in'+j).prepend('<i class="fas fa-sun"></i>&emsp;');
								break;
							case '2':
								$('.in'+j).append("/ 구름조금");
								$('.in'+j).prepend('<i class="fas fa-cloud-sun"></i>&emsp;');
								break;
							case '3':
								$('.in'+j).append("/ 구름많음");
								$('.in'+j).prepend('<i class="fas fa-cloud"></i>&emsp;');
								break;
							case '4':
								$('.in'+j).append("/ 흐림");
								$('.in'+j).prepend('<i class="fas fa-smog"></i>&emsp;');
								break;
							}
						}
					}
			});
	});
	init();

			$.ajax({
				type:"get",
				url:"http://apis.data.go.kr/1360000/MidFcstInfoService/getMidFcst",
				data:{
					//Decoding 인증키 사용할것
					serviceKey:"LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="
					,numOfRows:"10"
					,pageNo:"1"
					,stnId:"108"
					,tmFc:today+"0600"
				},
				dataType:"xml"
				,success: res=>{ 
					console.log("AJAX 중기예보 성공")
					
					var $rows = $(res).find("item");
				//결과화면 지우기
				resultLayout.innerHTML=''
				
				var wfSv=$rows.find("wfSv").text();
				
				$("#resultLayout").append("전국중기예보: "+wfSv); 
				console.log(wfSv)
				
				},
				error:()=>{
					console.log("AJAX 실패")
					
				}
				
			})
		
		})
</script>

</head>
<body>
<div id="out">
<h1 id="title">오늘의 날씨</h1>
<hr>
<div class="vis-weather">
<ul class="list-group list-group-flush weather" style="font-weight:600;"></ul>
</div>
</div>
<div id="titleup">
<h1 id="title2">중기예보(전국)</h1>
<hr>
<div id="resultLayout"></div>
</div>

</body>
</html>
<c:import url="../layout/footer.jsp" />