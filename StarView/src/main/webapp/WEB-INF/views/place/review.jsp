<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/css/lightbox.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.1/js/lightbox.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	var uid = '<%=session.getAttribute("uId") %>'
	
	if( uid == "null" ) {
		
		$("textarea#content").attr("placeholder", "로그인 후 이용가능합니다.");
		$("textarea#content").attr("readonly", true);
		$("textarea#content").click(function() {
			alert("로그인 후 이용가능합니다");
			location.href = "/users/login"
		})
		
		$(".filebox").addClass("noClick");
		
	} else {
		
		$("textarea#content").attr("placeholder", "내용을 작성해 주세요.");
		
		$(".filebox").addClass("Click");
		$(".filebox").mouseover(function() {
			$(this).addClass("fmo");
		});
		$(".filebox").mouseleave(function() {
			$(this).removeClass("fmo");
		});
	}
	
	$(".deleteBtn").click(function() {
		if(confirm("리뷰를 삭제하시겠습니까?") == true) {
			alert("리뷰가 삭제되었습니다");
		} else {
			return;
		}
	})
	
	lightbox.option({
    resizeDuration: 200,
    wrapAround: true,
    disableScrolling: false,
    fitImagesInViewport:false
})
	
})
</script>

<style type="text/css">
.noClick {
	border: none;
    border-radius: 10px;
    display: flex;
    font-size: 16px;
    align-items: center;
    width: 70px;
    height: 35px;
    background-color: #FFEBBA;
    justify-content: center;
    font-weight: 500;
	opacity: 0.6;
	cursor: not-allowed;
}

.Click {
	border: none;
    border-radius: 10px;
    display: flex;
    font-size: 16px;
    align-items: center;
    width: 70px;
    height: 46px;
    background-color: #FFEBBA;
    justify-content: center;
    font-weight: 500;
    cursor: pointer;
}

.fmo {
	background-color: #FFB703;
    font-weight: 700;
    cursor: pointer;
}

#image {

	display: none;
}

tr, td {
	border-collapse: collapse;
}

td {
	padding: 10px 0;
	border-bottom: 1px solid #ccc;
}

.review {
	margin-top: 20px;
}

</style>

<div class="clearfix"></div>


<div class="review-list">
	
	<h3>리뷰 (${review.size() })</h3>
	
	<c:forEach items="${review }" var="review">
		<table style="width:100%;">
			<tr>
				
				<!-- 리뷰에 사진이 있을 때 -->
				<c:if test="${not empty review.storedName }">
					<!-- 작성자 = 로그인한사람 -->
					<c:if test="${uId eq review.uId }">
						<td style="width:10%; font-weight:600; text-align: center;">${review.uNick }</td>
						<td style="width:10%; color: #ccc;"><fmt:formatDate value="${review.sreviewDate }" pattern="yy.MM.dd HH:mm"/></td>
						<td style="width:68%; padding-left: 20px;">${review.sreviewContent }</td>
						<td style="width:10%;">
							<a href="/imagepath/${review.storedName }" data-title="${review.sreviewContent }" data-lightbox="example-set">
								<img src="/imagepath/${review.storedName }" style="width:100%;">
							</a>
						</td>
						<td style="width:2%; text-align: center;">
							<a href="/place/review-delete?sreviewNo=${review.sreviewNo }" class="deleteBtn"><span class="glyphicon glyphicon-remove"></span></a>
						</td>
					</c:if>
					<!-- 작성자 != 로그인한사람 -->
					<c:if test="${uId ne review.uId }">
						<td style="width:10%; font-weight:600; text-align: center;">${review.uNick }</td>
						<td style="width:10%; color: #ccc;"><fmt:formatDate value="${review.sreviewDate }" pattern="yy.MM.dd HH:mm"/></td>
						<td style="width:70%; padding-left: 20px;">${review.sreviewContent }</td>
						<td style="width:10%;">
							<a href="/imagepath/${review.storedName }" data-title="${review.sreviewContent }" data-lightbox="example-set">
								<img src="/imagepath/${review.storedName }" style="width:100%;">
							</a>
						</td>
					</c:if>
				</c:if>
			</tr>
			<tr>
				<!-- 리뷰에 사진이 없을 때 -->
				<c:if test="${empty review.storedName }">
					<!-- 작성자 == 로그인한사람 -->
					<c:if test="${uId eq review.uId }">
						<td style="width:10%; font-weight:600; text-align: center;">${review.uNick }</td>
						<td style="width:10%; color: #ccc;"><fmt:formatDate value="${review.sreviewDate }" pattern="yy.MM.dd HH:mm"/></td>
						<td style="width:78%; padding-left: 20px;">${review.sreviewContent }</td>
						<td style="width:2%; text-align: center;">
							<a href="/place/review-delete?sreviewNo=${review.sreviewNo }" class="deleteBtn"><span class="glyphicon glyphicon-remove"></span></a>
						</td>
					<!-- 작성자 != 로그인한사람 -->
					</c:if>
					<c:if test="${uId ne review.uId }">
						<td style="width:10%; font-weight:600; text-align: center;">${review.uNick }</td>
						<td style="width:10%; color: #ccc;"><fmt:formatDate value="${review.sreviewDate }" pattern="yy.MM.dd HH:mm"/></td>
						<td style="width:80%; padding-left: 20px;">${review.sreviewContent }</td>
					</c:if>
				</c:if>
			</tr>
		</table>
	</c:forEach>
	
</div>

<div class="review">
	
	<form action="/place/reviewWrite" method="post" enctype="multipart/form-data">
	
		<table style="width:100%;">
			<tr>
				<td style="width:85%; border:none;">
					<input type="hidden" name="arrivalNum" value="${viewStarplace.arrivalNum}">
					<input type="hidden" name="uId" value="${uId }">
					<input type="hidden" name="uNick" value="${uNick }">
					<textarea id="content" style="width:100%;" name="sreviewContent"></textarea>
				</td>
				<td style="width:10%; text-align: center; border:none;">
					<label for="image">
						<div class="filebox">사진<br>첨부</div>
					</label>
					<input type="file" id="image" name="file" accept="image/*">
				</td>
				<td style="width:5%; text-align: center; border:none;">
					<button type="submit" class="filebox">등록</button>
				</td>
			</tr>
		</table>
	
	</form>
	
</div>