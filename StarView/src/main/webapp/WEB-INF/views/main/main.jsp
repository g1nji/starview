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
		
		$('.title').css("background-color", "#5BC0CF");
		$('.title').css("color", "white");
		
		$('footer').css("background-color", "#5BC0CF");
		$('footer').css("color", "white");
		
		$('.moon').hide();
		
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
		
		$('.title').css("background-color", "#E64556");
		$('.title').css("color", "white");
		
		$('footer').css("background-color", "#E64556");
		$('footer').css("color", "white");
		
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
		
		$('.title').css("background-color", "#FFB703");
		$('.title').css("color", "white");
		
		$('footer').css("background-color", "#20275C");
		$('footer').css("color", "white");
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
	if(month<10) month = "0"+month;
	var day= today.getDate();
	if(day<10) day = "0"+day;
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
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/mainCss.css"> -->

<style type="text/css">
/* 웹폰트(NotoSans) */
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');}
@font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
body, h1, h2, h3, h4, h5, h6, input, textarea, select {
	font-family: 'Noto Sans KR', sans-serif;
}
/* ----------------- */
body {
	margin: 0;
}
a {
	color: black;
}
a:hover {
	text-decoration: underline;
}
/* ----------------- */
#logo {
	height: 100px;
	padding: 0;
	margin-top: 0;
	margin-right: 20px;
}
ul.subnav {
	padding: 0 100px 0 0;
}
ul.subnav > li {
	float: right;
	list-style-type: none;
}
#menu {
	height: 100px;
}
ul.mainnav > li {
	float: left;
	position: relative;
	width: 150px;
	height: 30px;
	text-align: center;
	margin-top: 50px;
	padding: 0 10px 40px 10px;
	list-style-type: none;
}
ul.subnav > li {
	padding: 50px 5px 5px 5px;
}
ul.mainnav > li > a {
	text-decoration: none;
    font-size: 19px;
    font-weight: 500;
}
ul.mainnav > li > ul {
	display: none;
	width: 480px;
	height: 45px;
	margin-top: 6px;
	margin-left: -10px;
	padding: 10px 12px;
	border-radius: 30px;
}
ul.mainnav > li > ul > li {
	list-style-type: none;
	text-align: left;
	float: left;
	padding: 0 0 10px 20px;
}
ul.mainnav > li > ul > li > a {
	text-decoration: none;
	font-size: 16px;
	font-weight: 400;
}

ul.mainnav > li > ul > li > a:hover {
	font-weight: 500;
}
ul.mainnav > li:hover > ul {
	display: block;
}
#footer {
	margin-top: 30px;
	padding: 30px 0;
	font-size: 12px;
	background-color: black;
	color: black;
	text-align: center;
}
.wrap {
	margin: 0 auto;
}
.monthly {
	width: 55%;
	height: 200px;
	margin: 15px 29px 15px 0;
	display: inline-block;
	float: left;
}

.weather {
	display: inline-block;
	cursor: pointer;
	text-align: left;
}

.etc {
	width: 20%;
	display: inline-block;
	margin-top: 15px;
	float: left;
}

#day {
	width:80%;
	height: 500px;
	margin: 0 auto;
	background-size: 100%;
	border-radius: 100px;
	background-size : cover;
}

.moon {
	width: 120px;
	height: 120px;
	margin: 70px 230px;
	float: right;
	border-radius: 120px;
	text-align: center;
}

#moonimg{
display: block;
margin:0 auto;
height:120px;
border-radius: 50%;
}

#moonimg2{
display: block;
margin:12px auto;
height:120px;
border-radius: 50%;
box-shadow:20px 20px 10px rgba(0,0,0,0.2);
}


#moonimg:hover{
transition:0.5s;
/* box-shadow:20px 20px 10px rgba(0,0,0,0.4); */
transform:scale(1.05,1.05);
}

#moonimg2:hover{
transition:0.5s;
box-shadow:20px 20px 10px rgba(0,0,0,0.4);
transform:scale(1.05,1.05);
}

.title {
    width: 140px;
    height: 26px;
/*     border-top: 2px solid; */
/*     border-left: 2px solid; */
/*     border-right: 2px solid; */
    border-radius: 10px 10px 0 0;
    text-align: center;
    z-index: 9999;
    position: absolute;
    font-size: 17px;
    font-weight: 600;
}

.contents {
	position: relative;
    border: 2px solid #f6f6f6;
    background-color: #f6f6f6;
    border-radius: 0 30px 30px 30px;
    z-index: 11;
    margin-top: 24px;
    padding: 10px;
    height: 300px;
    line-height: 25px;
}

#Layout {
	font-size: 20px;
    font-weight: 500;
    margin: 10px 0;
}

#Layout2 {
	line-height: 25px;
    font-size: 16px;
    font-weight: 300;
}

</style>

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
			<li><a href="/goods/nonuser"><img src="/resources/image/shopping-cart.png" style="height:25px;"></a></li>
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
	<div class="moon" onclick="location.href='/data/moonToday'" style="cursor: pointer;">
		<img id="moonimg" src=""/>
		<div id="resultLayout"></div>
		<div id="result"></div>
	</div>
</div>

<div class="container">

<div class="wrap">

	<div class="monthly">
		<div class="title" onclick="location.href='/data/astroMonth'" style="cursor: pointer; width:160px;">
			이달의 천문현상
		</div>
		<div class="contents" style="padding: 10px 20px 0 20px;">
			<div id="Layout" class="Layout"></div>
			<div id="Layout2" class="Layout2"></div>
		</div>
	</div>
	
	<div class="etc" style="margin-right: 28px;">
		<div class="title" onclick="location.href='/data/weather3'" style="cursor: pointer;">
			오늘의 날씨
		</div>
		<div class="contents" style="text-align: center;">
			<div class="weather" onclick="location.href='/data/weather3'"><!--weather  -->
			<!-- 현재 날씨 -->
		<!-- 		<ul class="list-group list-group-flush weather" style="font-weight:600;"></ul> -->
			</div>
		</div>
	</div>
	
	<div class="etc">
		<div class="title" onclick="location.href='/data/moonToday'" style="cursor: pointer;">
			오늘의 달 모양
		</div>
		<div class="contents">
		<img id="moonimg2" src=""/>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
<!-- 	<div style="margin-top:30px; background-color: pink; height: 300px;"> -->
<!-- 		갤러리 이미지 추천순 -->
<!-- 	</div> -->
	
<!-- 	<div style="margin-top:30px; background-color: pink; height: 300px;"> -->
<!-- 		굿즈샵 상품 추천순 -->
<!-- 	</div> -->

</div>
<c:import url="../layout/footer.jsp" />