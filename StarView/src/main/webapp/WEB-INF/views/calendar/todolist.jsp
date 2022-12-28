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

* {
    margin: 0;
    padding: 0
    max-width: 1100px !important;
}

/* 캘린더 */
.calendarTable {
	float: right;

}


.calendarTable td {
    text-align: center;
}

/* yyyy년 MM월 */
.calendarTable thead.calDate th {
    font-size: 18px;
    text-align: center;
    position: relative;
    left:115px;
    bottom: 10px;
}

.calendarTable thead.calDate th p {
	position: relative;
	top:7px;
}

/* < > 버튼 */
.calendarTable thead.calDate th button {
    font-size: 28px;
    background: none;
    border: none;
}

/* sun - sat 부분 */
.calendarTable thead.calWeek th {
    background-color: #191970;
    color: #fff;
    text-align : center;
    height: 25px;
}

/* 날짜 전체 설정 */
.calendarTable tbody td {
/* 	background-color: #FFF8DC; */
    cursor: pointer;
    width: 75px;
    height: 65px;
    font-size: 17px;
}

/* 일요일 색상 빨갛게 */
.calendarTable tbody td:nth-child(1) {
    color: #E64556;
}

/* 토요일 색상 바꾸기 */
/* .calendarTable tbody td:nth-child(7) { */
/*     color: #288CFF; */
/* } */

.calendarTable tbody td.selectDay {
    background-color: #191970;
    color: #fff;
    border-radius: 10px;
}

#calendarForm {
 	background-color: #FFF6DE;
	border: 4px solid;
    border-color: #FFEBBA;
    border-radius: 5px;
    position: relative;
    float: right;
	width: 530px;
    padding: 10px 10px 10px 10px;
    right: 98px;
    margin-bottom: 50px;
}

#calendarDiv {
    position: relative;
    float: none;
    display: flex;
    align-items: center;
    flex-wrap: nowrap;
    flex-direction: column;
}
/* div css */
#todolist {
    width: 400px;
    left: 115px;
    height: 420px;
    background-color: #FFEBBA;
    border: 4px solid;
    border-color: #FFEBBA;
    border-radius: 5px;
    position: relative;
}

#selectDay {
    font-size: 100px;
    color: darkslategray;
    text-align: center;
    position: relative;
    right: 15px;
}

#todoform {
	position: relative;
	text-align: center;
	
}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	
	(function () {
	    calendarMaker($("#calendarForm"), new Date());
	})();
	

	var nowDate = new Date();
	function calendarMaker(calendar, date) {
	    if (date == null || date == undefined) {
	        date = new Date();
	    }
	    nowDate = date;
	    if ($(calendar).length > 0) {
	        var year = nowDate.getFullYear();
	        var month = nowDate.getMonth() + 1;
	        $(calendar).empty().append(assembly(year, month));
	    } else {
	        console.error("[Error] 에러에러에러~~ 캘린더 값이 비었답니당");
	        return;
	    }

	    var thisMonth = new Date(nowDate.getFullYear(), nowDate.getMonth(), 1);
	    var thisLastDay = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, 0);


	    var trTag = "<tr>";
	    var cnt = 0;
	    //빈 공백 만들어주기
	    for (i = 0; i < thisMonth.getDay(); i++) {
	        trTag += "<td></td>";
	        cnt++;
	    }

	    //날짜 채우기
	    for (i = 1; i <= thisLastDay.getDate(); i++) {
	        if (cnt % 7 == 0) { trTag += "<tr>"; }

	        trTag += "<td id='selectD'>" + i + "</td>";
	        cnt++;
	        if (cnt % 7 == 0) {
	            trTag += "</tr>";
	        }
	    }
	    $(calendar).find("#setDate").append(trTag);
	    calMove();

	    function assembly(year, month) {
	        var calendarHtml =
	        	"<div id='calendarDiv'>" +
	            "<table class='calendarTable'>" +
	            "<colgroup>" +
	            "<col style='width:80px'/>" +
	            "<col style='width:80px'/>" +
	            "<col style='width:80px'/>" +
	            "<col style='width:80px'/>" +
	            "<col style='width:80px'/>" +
	            "<col style='width:80px'/>" +
	            "<col style='width:80px'/>" +
	            "</colgroup>" +
	            "<thead class='calDate'>" +
	            /* 이전달 이동 버튼 추가 */
	            "<th><button type='button' class='prev'>‹</button></th>" +
	            "<th colspan='2'><p><span>" + year + "</span>년 <span>" + month + "</span>월</p></th>" +
	            /* 다음달 이동 버튼 추가 */
	            "<th><button type='button' class='next'>›</button></th>" +
	            "</thead>" +
	            "<thead  class='calWeek'>" +
	            "<th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th>" +
	            "</thead>" +
	            "<tbody id='setDate'>" +
	            "</tbody>" +
	            "</table>" +
	            "</div>";
	        return calendarHtml;
	    }

	    
	    function calMove() {
	        //전달 클릭
	        $(".calendarTable").on("click", ".prev", function () {
	            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() - 1, nowDate.getDate());
	            calendarMaker($(calendar), nowDate);
	        });
	        //다음달 클릭
	        $(".calendarTable").on("click", ".next", function () {
	            nowDate = new Date(nowDate.getFullYear(), nowDate.getMonth() + 1, nowDate.getDate());
	            calendarMaker($(calendar), nowDate);
	        });
	        //일자 선택 클릭
	        //테이블에 td 태그 클릭 시 기존 selectday 클래스를 지우고 클릭한 곳에 selectDay클래스 적용
	        $(".calendarTable").on("click", "td", function () {
	            $(".calendarTable .selectDay").removeClass("selectDay").removeAttr('name','sDate');
	            $(this).removeClass("selectDay").addClass("selectDay").attr('name', 'sDate');

	            var todoDay = $(".calendarTable .selectDay").html();
// 	            console.log( todoDay );
	            
	            //투두리스트 폼 만들기
	    		$("#todolist").css("display", "block");
	            $("#selectDay").text( todoDay );

	        //날짜 선택 시(.selectDay 클래스 선택 시) ajax로 요청 보내서 새로운 url 띄우기 (여기에 list 출력)
	        	$.ajax({
	        		type:"GET"
	        		, url: "/calendar/listview"
	        		, data: {  }
	        		, dataType: "html"
	        		, success: function(res) {
	        			console.log("AJAX 성공");
	        			
	        			 
	        		}
		    	 	, error: function(request, error) {
		    	 		console.log("AJAX 실패")
		    	 		console.log("code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+error);
		    	 		
		    	 	} 
	        	})
	        });
	        
		     
	        //todolist 버튼 클릭해서 제출하면 선택한 날짜 값 들어가게
		     $("#todoBtn").on("click", function () {
		    	 var inputTodo = $("#inputbox").val();
		    	 var todoDay = $("#selectDay").text();
		    	 var sNo = ${list[i].sNo}
// 		    	 console.log( todoDay );
// 		    	 console.log(inputTodo);
		    	 
		    	 $.ajax({
		    		type:"POST"
		    		, url: "/calendar/listview"
					, data: { "todoList" : inputTodo , "sDate" : todoDay , "sNo" : sNo } 
					, dataType:"json"
					, success: function(res) {
						console.log("AJAX 성공");
						console.log(res);
						if(res.result){
							$("#listbox").html('')
							var list = res.todoList
							
							for(var i = 0; i < list.length; i++ ){
								$("#listbox").append('<div>'+list[i].todoList+'<button type="button" class="btnDel" onclick="deletelist('+list[i].sNo+')">'+"✖"+'</button>'+'</div>');
// 								$("#listbox").append('<div>'+list[i].todoList+'</div>');
// 								$("#listbox").append('<div>'+list[i].todoList+'<button class="btnDel">'+"✖"+'</button>'+'</div>');
// 								$("#listbox").append('<div id="listbox">'+list[i].todoList+'<a href="/calendar/delete?sNo='sNo'">'+"✖"+'</a>'+'</div>');
							}
						}
						$('#inputbox').val('');
					}
		    	 	, error: function(request, error) {
		    	 		console.log("AJAX 실패")
		    	 		console.log("code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+error);
		    	 		
		    	 	}
		    	 }) //ajax 끝
		    	 
		    	 
		    	 
	    	 });
	        
// 	        	$(".btnDel").on('click', function (){
// 	        		console.log("button 삭제");
// 	        		location.href = "/calendar/delete?sNo=${sNO }"
// 	        	})
				
				$("#btnDel").on("click", function() {
					

				});
	        
	        //토글 클래스
// 	        $(".claendarTable").on("click", "td", function() {
// 	        	$(this).toggleClass("selectDay");
// 	        });
	        
	        
	        //투두리스트 폼 만들기
// 	    	$(".calendarTable").on("click", "td", function() {
// 	    		$("#todolist").css("display", "block");
	    		
// 	    		var valDay = $('.selectDay').val();
	    		
// 	    		$("#selectDay").text( valDay );
// 	    	})
	    	
	    }
	    
	}
})
		function deletelist(sNo) {
			console.log(sNo);
			
			$.ajax({
				type: "GET"
				, url: "/calendar/delete"
				, data: { "sNo" : sNo }
				, dataType: "json"
				, success: function(res){
					
					console.log("delete ajax 성공");
					
				}
				, error: function(error) {
			 		console.log("code:"+request.status+"\n"+"message"+request.responseText+"\n"+"error:"+error);
				}
			})
		}


// 	location.href = "/calendar/delete?sNo="+sNo
</script>
</head>


<body>

<!-- 캘린더 폼 띄우기 -->
	<div id="calendarForm" ></div>
	
<!-- todolist 폼 -->
	<div id="todolist" style="display:none;">
	
	<div id="selectDay" style="font-weight:bold;">
	</div>
	
	
	
	<form id="todoform" method="POST">
	List
	<label><input type="text" name="todoList" id="inputbox"></label>
	<button type="button" id="todoBtn">작성</button>
	</form>
	
	<div id="listbox">
		<table>
		<tr>
		<th>---------------------------</th>
		</tr>
		
		<tr>
			<td>${todoList.todoList }</td>
		</tr>
	</table>
	</div>
	
	
	</div>
	

</body>	

</html>

<c:import url="../layout/footer.jsp" />