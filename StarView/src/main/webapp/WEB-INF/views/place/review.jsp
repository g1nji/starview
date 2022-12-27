<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
.filebox {
	border: none;
    border-radius: 10px;
    display: flex;
    font-size: 16px;
    align-items: center;
    width: 80px;
    height: 35px;
    background-color: #FFEBBA;
    justify-content: center;
    font-weight: 500;
}

.filebox:hover {
	background-color: #FFB703;
    font-weight: 700;
    cursor: pointer;
}

#image {

	display: none;
}

tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}

</style>

<div class="clearfix"></div>


<div class="review-list">
	
	<h4>리뷰</h4>
	
	<table style="width:100%;">
		<tr>
			<td style="width:10%;">닉네임</td>
			<td style="width:10%;">날짜</td>
			<td style="width:70%;">내용</td>
			<td style="width:10%;">사진</td>
		</tr>
	</table>

</div>

<div class="review">
	
	<form action="/place/reviewWrite" method="post" enctype="multipart/form-data">
	
		<table style="width:100%;">
			<tr>
				<td style="width:90%;">
					<input type="hidden" name="arrivalNum">
					<input type="hidden" name="uId">
					<input type="hidden" name="uNick">
					<textarea style="width:100%;" name="sreviewContent" placeholder="내용을 입력해주세요"></textarea>
				</td>
				<td style="width:5%; text-align: center;">
					<label for="image">
						<div class="filebox">사진첨부</div>
					</label>
					<input type="file" id="image" name="file" accept="image/*">
				</td>
				<td style="width:5%; text-align: center;">
					<button type="submit" class="filebox">등록</button>
				</td>
			</tr>
		</table>
	
	</form>
	
</div>