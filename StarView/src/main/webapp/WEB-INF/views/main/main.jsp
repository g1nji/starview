<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--날씨 아이콘  -->
<script src="https://kit.fontawesome.com/8609a8f4cd.js" crossorigin="anonymous"></script>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- JS -->
<script type="text/javascript">
var hour = function() {
	var fname = "";
	var today = new Date();
	var hh = today.getHours();
	
	/* 오전 7시부터 오후 3시 59분까지 낮 이미지 */
	if(hh>=7 && hh<16) {
		document.getElementById("day").style.backgroundImage = "url('/resources/image/day1.png')";
		document.getElementById("logoimg").src="/resources/image/logo1.png";
		$('a').mouseover(function() {
			$(this).css("color", "#5BC0CF");
		})
		
		$('a').mouseleave(function() {
			$(this).css("color", "black");
		})
		
		$('ul.mainnav > li > ul').each(function() {
			$(this).css("background-color", "#CCEBF1");
		})
		
	/* 오후 4시부터 오후 7시 59분까지 저녁 이미지 */
	} else if(hh>=16 && hh<=19) {
		document.getElementById("day").style.backgroundImage = "url('/resources/image/day2.png')";
		document.getElementById("logoimg").src="/resources/image/logo2.png";
		$('a').mouseover(function() {
			$(this).css("color", "#E64556");
		})
		
		$('a').mouseleave(function() {
			$(this).css("color", "black");
		})
		
		$('ul.mainnav > li > ul').each(function() {
			$(this).css("background-color", "#F7C8CC");
		})
		
	/* 오후 8시부터 오전 6시 58분까지 밤 이미지 */
	} else {
		document.getElementById("day").style.backgroundImage = "url('/resources/image/day3.png')";
		document.getElementById("logoimg").src="/resources/image/logo.png";
		$('a').mouseover(function() {
			$(this).css("color", "#FFB703");
		})
		
		$('a').mouseleave(function() {
			$(this).css("color", "black");
		})
		
		$('ul.mainnav > li > ul').each(function() {
			$(this).css("background-color", "#FFEBBA");
		})
	}
	
}

</script>

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
	init();
	//오늘의 달모양
	$.ajax({
         type: "get",
         url: "http://apis.data.go.kr/B090041/openapi/service/LrsrCldInfoService/getLunCalInfo",
         data: {
			solYear:$("#Year").val()
			,solMonth:$("#Mon").val()
			,solDay:$("#Day").val()
            ,ServiceKey: "LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="

         },
         dataType: "xml",
         success: res => {
            console.log("AJAX 성공-음력")
            
            //<item> 태그 추출
            var $rows = $(res).find("item");
            
            //결과화면 지우기
            result.innerHTML = ''
            resultLayout.innerHTML = ''

            //양력
            var solYear=$rows.find("solYear").text();
            var solMonth=$rows.find("solMonth").text();
            var solDay=$rows.find("solDay").text();
            
            var view=solYear+"년"+solMonth+"월"+solDay+"일";
            
            //음력
            var lunYear=$rows.find("lunYear").text();
            var lunMonth=$rows.find("lunMonth").text();
            var lunDay=$rows.find("lunDay").text();
            
            
            var view_text=lunYear+"년"+lunMonth+"월"+lunDay+"일";

            //달 모양 이미지 출력
            var img_src="";
            for(var i=1; i<=30; i++) {
                    if(lunDay == i) {
                    img_src = '\/resources\/img\/'+ i + '.png';
                    }
                }
                $("#moonimg").attr('src',img_src)
                $("#moonimg2").attr('src',img_src)
                console.log(img_src)
         },
         error: () => {
            console.log("AJAX 실패")
         }
      })
     
	//이달의 천문현상
      $.ajax({
          type: "get",
          url: "http://apis.data.go.kr/B090041/openapi/service/AstroEventInfoService/getAstroEventInfo",
          data: {
 			solYear:$("#Year").val()
 			,solMonth:$("#Mon").val()
             ,ServiceKey: "LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="

          },
          dataType: "xml",
          success:  res => {

             console.log("AJAX 성공-천문현상")
             
              var $rows = $(res).find("item");
             console.log($rows)
              
              //결과화면 지우기
              Layout.innerHTML = ''
              
            var astroTitle=$rows.find("astroTitle").text();
            var astroEvent=$rows.find("astroEvent").text();
              
            $("#Layout").append(astroTitle); 
            $("#Layout2").append(astroEvent); 
            
            
          },
          error: () => {
         	 alert("실패")
             console.log("AJAX 실패")
          }
       })
       
})

$(document).ready(() => {
	
    //오늘의 날씨
    var arr=[];
	var today=new Date();
	var year= today.getFullYear();
	var month= today.getMonth()+1;
	var day= today.getDate();
	var hours =today.getHours();
	var minutes = today.getMinutes();
	var hours_al = new Array('02','05','08','11','14','17','20','23');
	var korea = [{'region':'경기','nx':60,'ny':121},
				 {'region':'강원','nx':92,'ny':131},
				 {'region':'충청','nx':69,'ny':106},
				 {'region':'전북','nx':63,'ny':89},
				 {'region':'경북','nx':90,'ny':77},
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
	var yester= today-1;
	console.log(yester)
	
	$.each(korea, function(j,k){
			var _nx=korea[j].nx, _ny=korea[j].ny, region=korea[j].region,
			apikey="LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik%2B5L2c9H3hxNJeHLffcpGsg%3D%3D",
			URL="http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
			URL+="?serviceKey=" +apikey;
			URL+="&numOfRows=30&pageNo=1";
			URL+="&base_date="+ today;
			URL+="&base_time="+now+"00";
			URL+="&nx="+_nx+"&ny="+_ny;
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
})
</script>

<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/mainCss.css">

</head>

<body onload="hour()">

<header>

<div id="menu">
	<ul class="mainnav">
		<li id="logo"><a href="/"><img id="logoimg" src="" style="width:150px; margin-top: 5px;"></a></li>
		<li>
			<a href="">별 정보 확인</a>
			<ul>
				<li><a href="/sunset/time">일몰시간</a></li>
				<li><a href="/data/weather3">날씨</a></li>
				<li><a href="/data/moonToday">달 모양</a></li>
				<li><a href="/place/main">별 사진 명소</a></li>
				<li><a href="/data/astroMonth">이달의 천문현상</a></li>
			</ul>
		</li>
		<li><a href="/gallery/list">갤러리</a></li>
		<li><a href="/goods/list">굿즈샵</a></li>
		<li><a href="/calendar/todolist">스케줄러</a></li>
	</ul>
	<ul class="subnav">
	
		<!-- 비로그인 상태 -->
		<c:if test="${empty login }">
			<li style="padding-top: 53px;"><a href="/users/login">로그인/회원가입</a></li>
			<li><a href="/goods/cart"><img src="/resources/image/shopping-cart.png" style="height:25px;"></a></li>
		</c:if>
		
		<!-- 로그인 상태 -->
		<c:if test="${not empty login }">
			<li style="padding-top: 53px;"><a href="/users/logout">로그아웃</a></li>
			<li><a href="/mypage/mypage"><img src="/resources/image/user.png" style="height:25px;"></a></li>
			<li><a href="/goods/cart"><img src="/resources/image/shopping-cart.png" style="height:25px;"></a></li>
		</c:if>

	</ul>
</div>

</header>

<div id="day">
	<input type="text" name="Year" id="Year" hidden="hidden">
	<select id="Mon"hidden="hidden">
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
	<select id="Day" hidden="hidden">
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
	<div class="moon">
		<img id="moonimg" src=""/>
		<div id="resultLayout"></div>
		<div id="result"></div>
	</div>
</div>

<div class="container">

<div class="wrap">

	<div class="monthly">
	이달의 천문현상
		<div id="Layout" class="Layout"></div>
		<div id="Layout2" class="Layout2"></div>
	</div>
	
	<div class="weather" onclick="location.href='/data/weather3'"><!--weather  -->
	<!-- 현재 날씨 -->
<!-- 		<ul class="list-group list-group-flush weather" style="font-weight:600;"></ul> -->
	</div>
	
	<div class="etc">
	오늘의 달 모양
		<div>
		<img id="moonimg2" src=""/>
		</div>
	</div>

</div>
<c:import url="../layout/footer.jsp" />