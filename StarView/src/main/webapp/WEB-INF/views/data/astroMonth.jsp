<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="./mouse.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap'); */
/* @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap'); */
@import url('https://fonts.googleapis.com/css2?family=Poor+Story&display=swap');
body{
font-family: 'Poor Story', cursive;
/* font-family: 'Do Hyeon', sans-serif; */
/* font-family: 'Nanum Gothic', sans-serif; */
}
.out{
	text-align: center;

}

#resultLayout{
margin:0 auto;
margin-bottom:10px;
width:1200px;
height:450px;
}

table{
margin:0 auto;
margin-top:30px;
border-radius:10px;
padding-left:10px;
background-color:#fff0f5;

}

h4{
width:700px;
margin-left: 25px;
}

#astroEvent{
margin-left: 20px;

}
th{
font-size: 20px;
padding-top: 20px;
padding-bottom: 10px;
}




</style>

<!-- jQeury 2.2.4 -->
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
   $("#btn").click(() => {
      console.log("#btn click")      
      
      $.ajax({
         type: "get",
         url: "http://apis.data.go.kr/B090041/openapi/service/AstroEventInfoService/getAstroEventInfo",
         data: {
            //Decoding 키로 인증키 사용할 것 
//            , type: "xml"
//             , pageNo: "1"
//            , pageNo: page.value
//            , numOfRows: "10"
			solYear:$("#Year").val()
			,solMonth:$("#Mon").val()
            ,ServiceKey: "LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="

         },
         dataType: "xml",
         success:  res => {

            console.log("AJAX 성공")
            
  			 console.log( $(res).find("item") )
             var $rows = $(res).find("item");
             
             
             //결과화면 지우기
             resultLayout.innerHTML = ''
             
             var $table = $("<table>")
             var tHead = "<tr>"
                + "<th>날짜</th>"
//                + "<th>순번</th>"
                + "<th>시간</th>"
                + "<th>대표현상</th>"
                + "<th>천문현상</th>"
//                + "<th>비고</th>"
                + "<tr>"
                $table.html( tHead )
                
//                 $rows.each(function( idx, ele ) {
//                 })

                $rows.each(( i, item ) => {
//                    console.log(i, row)
                   
                   $("<tr>")
                      .append($("<td>").html('<h3 id="locdate" >'+$(item).find("locdate").text()+'</h3>' ) )
   //                   .append($("<td>").html($(item).find("seq").text() ) )
                      .append($("<td>").html('<h3 id="astroTime">'+$(item).find("astroTime").text()+'</h3>' ) )
                      .append($("<td>").html('<h3 id="astroTitle">'+$(item).find("astroTitle").text()+'</h3>' ) )
                      .append($("<td>").html('<h4 id="astroEvent">'+$(item).find("astroEvent").text()+'</h4>' ) )
//                      .append($("<td>").html($(item).find("astroEvent").text() ) )
//                      .append($("<td>").html($(item).find("remarks").text() ) )
                   .appendTo( $table )
                })

                
                $table.appendTo( $("#resultLayout") )
                
       
           
         },
         error: () => {
        	 alert("실패")
            console.log("AJAX 실패")
         }
      })
      
   })
   
})


</script>

</head>
<body>

<div class="out">
<h1 id="title">이달의 천문현상</h1>

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
	<button id="btn">실행</button>
	

</div>
</div>
<div id="content"></div>
<div id="resultLayout"></div>

</body>
</html>
<%-- <c:import url="../layout/footer.jsp" /> --%>