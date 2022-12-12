<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQeury 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(() => {

   $("#btn").click(() => {
      console.log("#btn click")      
      
      $.ajax({
         type: "get",
         url: "/resources/weather.csv",
         data: {
            //Decoding 키로 인증키 사용할 것 
            ServiceKey: "LSmq6lV4xNT9EXS3YbCJmT99kVha0kxUYP6MJGMpIEdPrRnKIi49fDlPA5dh59Ik+5L2c9H3hxNJeHLffcpGsg=="
            , type: "text"
            , pageNo: "1"
            , numOfRows: "10"

         },
         dataType: "text",
         success: res => {
            console.log("AJAX 성공")
            
             console.log( res )
             
             var rows =res.split("\r\n")
//             console.log(rows)

           //결과화면 지우기
             resultLayout.innerHTML = ''
             
             var $table = $("<table>")
             
             for(var i=0; i<rows.length;i++){
//				console.log(rows[i])
				var datas= rows[i].split(",")
				console.log(datas)	
				var $tr = $("<tr>")
				if(i==0){
					for(var j=0; j<datas.length;j++){
						$tr.append($("<th>").html(datas[j]))
					}
				}else{
					for(var j=0; j<datas.length;j++){
						$tr.append($("<td>").html(datas[j]))
					}
				}
				$tr.appendTo($table)
            }
            
            $table.appendTo($("#resultLayout"))

         },
         error: () => {
            console.log("AJAX 실패")
         }
      })
      
   })
   
})

//함수 정의 방법1
function func1(a, b) {
   return a + b;
}

//함수 정의 방법2
var func2 = (a, b) => {
   return a + b;
}

</script>

</head>
<body>

<h1>날씨 테스트</h1>
<hr>

<button id="btn">실행</button>

<div id="resultLayout"></div>















</body>
</html>