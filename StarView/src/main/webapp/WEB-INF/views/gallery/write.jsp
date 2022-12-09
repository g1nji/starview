<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:import url="../layout/header.jsp" />

<!-- 웹에디터 -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

<!-- 태그 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">
$(document).ready(function() {
	var input = document.querySelector('.tag')
	var tagify = new Tagify(input);

	// 태그가 추가되면 이벤트 발생
	tagify.on('add', function() {
	  console.log(tagify.value); // 입력된 태그 정보 객체
	})
	
	function quilljsediterInit(){
	    var option = {
	        modules: {
            toolbar: [
            	  [{ 'header': [1, 2, 3, false] }],
            	  ['bold', 'italic', 'underline', 'strike'],        // toggled buttons

            	  [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme

            	  [{ 'align': [] }],
            	  
            	  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
            	  [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent

            	  ['blockquote']

            	 ]
	        },
	        placeholder: '내용을 입력해 주세요',
	        theme: 'snow'
	    };

	    var quill = new Quill('#editor', option);
	    quill.on('text-change', function() {
	        document.getElementById("quill_html").value = quill.root.innerHTML;
		});
	}

	
	quilljsediterInit();
	
	
	$("#btnWrite").click(function() {
		
		var delta = quill.getContents();
		
		$("form").submit();
	})
	
	
	var input = document.querySelector('input[name=tag]')
	new Tagify(input)
	
})
</script>



<style type="text/css">
.wrap {
	margin: 0 auto;
	padding: 20px 0;
}

#galleryTitle {
	border: none;
	font-size: 22px;
}

#galleryContent {
	border: none;
}
</style>


<div class="wrap">

<form action="/gallery/write" method="post" enctype="multipart/form-data">

<!-- 제목 -->
<input type="text" style="width: 100%;" id="galleryTitle" name="galleryTitle" class="gallerytitle" placeholder="제목을 입력하세요">
<hr>

<!-- 파일첨부 -->
<input type="file" id="file" name="file"><br>

<!-- 내용 -->
<div id="editor" style="height:400px;"></div>
<input type="hidden" id="quill_html" name="galleryContent">

<br>

<span>장소 추가</span>
<input type="text" id="address_kakao" name="address" readonly />
<!-- <input type="text" name="address_detail" /> -->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
//                 document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}
</script>

<button type="button" id="searchBtn">검색</button>
<div id="map"></div>
<!-- kakao API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c7734a4a4f9eea96e74458a7dba40614&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  


$('#searchBtn').click(function(){
	// 버튼을 click했을때
	
	$('#map').css({"width":"500px","height":"300px"})
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch($('#address_kakao').val(), function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        
	        // 추출한 좌표를 통해 도로명 주소 추출
	        let lat = result[0].y;
	        let lng = result[0].x;
	        getAddr(lat,lng);
	        function getAddr(lat,lng){
	            let geocoder = new kakao.maps.services.Geocoder();

	            let coord = new kakao.maps.LatLng(lat, lng);
	            let callback = function(result, status) {
	                if (status === kakao.maps.services.Status.OK) {
	                	// 추출한 도로명 주소를 해당 input의 value값으로 적용
	                    $('#address_kakao').val(result[0].road_address.address_name);
	                }
	            }
	            geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
	        }
	        
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">장소</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
});
</script>
<br>

<!-- 태그 -->
<input placeholder="태그를 입력해 주세요" class="tag" type="hidden" name="tag"><br>

<button class="btn btn-primary" id="btnWrite">작성</button>
</form>

</div>
</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />