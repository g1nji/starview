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

#moonimg{
display: block;
margin:0 auto;
margin-top:20px;
height:300px;
border-radius: 50%;
box-shadow:20px 20px 10px rgba(0,0,0,0.2);
}
#moonimg:hover{
transition:0.5s;
box-shadow:20px 20px 10px rgba(0,0,0,0.4);
transform:scale(1.05,1.05);
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


$(document).ready(() => {
	init();

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
                console.log(img_src)
         },
         error: () => {
            console.log("AJAX 실패")
         }
      })
})

</script>

</head>
<body>

<div class="box">
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
	

</div> 

<img id="moonimg" src=""/>
<div id="resultLayout"></div>
<div id="result"></div>
</body>
</html>
<c:import url="../layout/footer.jsp" />