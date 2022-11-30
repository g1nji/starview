<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

<h1>게시글 작성</h1>
<hr>

<form action="./write" method="post">
제목 <input type="text" name="title"><br>
<hr>
사진 첨부<br>
<div id="editor">
</div>
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<script>
  var quill = new Quill('#editor', {
    theme: 'snow'
  });
</script>
<hr>
장소 입력<br>
태그 입력<br>

<button>업로드</button>
</form>

<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=20cf40fb73ac79f33afff5fbb10f920f"></script>

<script>
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};
	
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>

<c:import url="../layout/footer.jsp" />