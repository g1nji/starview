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
body {
  margin: 0;
/*   background: linear-gradient(45deg, #49a09d, #5f2c82); */
  font-weight: 100;
}
#Year, #Mon, #Day{
    position: relative;
    width: 90px;
    height: 40px;
    border: solid 1px #dadada;
    background: #fff;
    box-sizing: border-box;
    margin-top:7px;
}

#resultLayout, #result{
	margin-top: 10px;
    font-size: 19px;
    font-weight: 500;
}
.moonTitle{
text-align:center;
margin-bottom: 25px;
margin-top: 33px;
}

.moonContent{
margin:0 auto;
text-align:center;
font-size: 20px;
/* background-color: rgba(255,255,255,0.3); */
height: 470px;
padding:20px;
margin-bottom:150px;
width:600px;
border-radius: 10px;
}
#moonimg{
display: block;
margin:0 auto;
margin-top:20px;
height:370px;
border-radius: 50%;
box-shadow:20px 20px 10px rgba(0,0,0,0.2);
}
#moonimg:hover{
transition:0.5s;
box-shadow:20px 20px 10px rgba(0,0,0,0.4);
transform:scale(1.15,1.15);
}

#resultmoon{
margin:0 auto;
margin-top:20px;
text-align:center;
font-size: 20px;
}

.box{
margin:0 auto;
text-align:center;

}

#btn{
	font-family: 'Noto Sans KR', sans-serif;
    border-radius: 5px;
	display: inline-block;
    position: relative;
    padding: 10px 20px;
    margin-bottom:10px;
    border: 1px solid #fff;
    background-color:#ffd66d;
    text-align: center;
    text-decoration: none;
}

#btn:hover{
background-color: #F2D7D9;
    color: black;
}
.moonbox{
width:350px;
margin:0 auto;
/* color: #fff; */
padding:0 auto;
margin-top: 59px;
}
</style>
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

//음력 날짜
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
   $("#btn").click(() => {
      console.log("#btn click")      
      
      /* $.ajax({
         type: "get",
         url: "http://apis.data.go.kr/B090041/openapi/service/LunPhInfoService/getLunPhInfo",
         data: {
			solYear:$("#Year").val()
			,solMonth:$("#Mon").val()
			,solDay:$("#Day").val()
            ,ServiceKey: "LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="

         },
         dataType: "xml",
         success: res => {
            console.log("AJAX 성공")
            
			//<item> 태그 추출
            var $rows = $(res).find("item");
//          console.log( $rows)
            
            //결과화면 지우기
            resultmoon.innerHTML = ''
            
            var lunAge=$rows.find("lunAge").text();
            $("#resultmoon").append("월령: "+lunAge);             

         },
         error: () => {
            console.log("AJAX 실패")
         }
      }) */
      
      //--------------------음력---------------
      $.ajax({
         type: "get",
         url: "http://apis.data.go.kr/B090041/openapi/service/LrsrCldInfoService/getLunCalInfo",
         data: {
            //Decoding 키로 인증키 사용할 것 
//            , type: "xml"
//             , pageNo: "1"
//            , pageNo: page.value
//            , numOfRows: "10"
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
//          console.log( $rows)
            
            //결과화면 지우기
            result.innerHTML = ''
            resultLayout.innerHTML = ''

            //양력
            var solYear=$rows.find("solYear").text();
            var solMonth=$rows.find("solMonth").text();
            var solDay=$rows.find("solDay").text();
            
            var view=solYear+"년"+solMonth+"월"+solDay+"일";
            $("#resultLayout").append("양력: "+view); 
            
            //음력
            var lunYear=$rows.find("lunYear").text();
            var lunMonth=$rows.find("lunMonth").text();
            var lunDay=$rows.find("lunDay").text();
            
  //          console.log(lunYear+lunMonth+lunDay)
            
            var view_text=lunYear+"년"+lunMonth+"월"+lunDay+"일";
            $("#result").append("음력: "+view_text); 

            //달 모양 이미지 출력
            var img_src="";
            for(var i=1; i<=30; i++) {
                    if(lunDay == i) {
                    img_src = '\/resources\/img\/'+ i + '.png';
                    }
                }
                $("#moonimg").attr('src',img_src)
                console.log(img_src)

                
             //달 이름 출력
             if(lunDay==1){
	            $("#moonName").append('삭'); 
             }else if(lunDay==15){
	            $("#moonName").append('보름달'); 
             }
                console.log(lunDay)
                
                
            
         },
         error: () => {
            console.log("AJAX 실패")
         }
      })
      
   })
	$("#btn").trigger("click");  
})

</script>

</head>
<body>
<div class="moonTitle">

<h1>오늘의 달모양🌝</h1>
</div>

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
	
<button id="btn">확인</button>

</div>

<div class="moonContent">
<div>
</div>
<img id="moonimg" src=""/>
<div class="moonbox">
<div id="resultLayout"></div>
<div id="result"></div>
</div>
<!-- <div id="resultmoon"></div> -->
</div>
</body>
</html>
<c:import url="../layout/footer.jsp" />