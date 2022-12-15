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
    font-size: 1.5rem;
    text-align: center;
}

/* < > 버튼 */
.calendarTable thead.calDate th button {
    font-size: 28px;
    background: none;
    border: none;
}

/* sun - sat 부분 */
.calendarTable thead.calWeek th {
    background-color: #FFD700;
    color: #fff;
    text-align : center;
}

/* 날짜 전체 설정 */
.calendarTable tbody td {
    cursor: pointer;
}

/* 일요일 색상 빨갛게 */
.calendarTable tbody td:nth-child(1) {
    color: red;
}

/* 토요일 색상 바꾸기 */
/* .calendarTable tbody td:nth-child(7) { */
/*     color: #288CFF; */
/* } */

.calendarTable tbody td.selectDay {
    background-color: #FFD700;
    color: #fff;
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

	        trTag += "<td>" + i + "</td>";
	        cnt++;
	        if (cnt % 7 == 0) {
	            trTag += "</tr>";
	        }
	    }
	    $(calendar).find("#setDate").append(trTag);
	    calMoveEvtFn();

	    function assembly(year, month) {
	        var calendarHtml =
	        	"<div id='calendarDiv'>" +
	            "<table class='calendarTable'>" +
	            "<colgroup>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
	            "<col style='width:81px'/>" +
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

	    
	    function calMoveEvtFn() {
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
	            $(".calendarTable .selectDay").removeClass("selectDay");
	            $(this).removeClass("selectDay").addClass("selectDay").attr("name","sDate");
	        });
	        
	        //토글 클래스
// 	        $(".claendarTable").on("click", "td", function() {
// 	        	$(this).toggleClass("selectDay");
// 	        });
	        
	        //투두리스트 폼 만들기
	    	$(".calendarTable").on("click", "td", function() {
	    		
	    		var day = $('td').attr('class');
	    		
	    		$("#todolist").css("display", "block");
	    		$("#selectDay").css("display", "block");
	    		$("#selectDay").text(day);
	    	})
	    	
	    }
	    
	    
	    
	}

})


</script>
</head>


<body>

<!-- 캘린더 폼 띄우기 -->
	<div id="calendarForm"></div>
	
<!-- todolist 폼 -->
	<div id="todolist" style="display:none;">
	
	<div id="selectDay" style="display:none;">
		
	</div>
	<form id="todoform" method="POST">
	
	Todo List
	<label><input type="text" name="todoList" id="inputbox"></label>
	<button>작성</button>
	</form>	
	
	</div>


</body>	

</html>

<c:import url="../layout/footer.jsp" />