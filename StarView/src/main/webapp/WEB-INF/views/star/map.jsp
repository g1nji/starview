<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<body>
	<div id="map" style="width:500px;height:400px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f07fd274b828fac20dcda324b400f383"></script>
	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	//지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 지도타입 컨트롤 생성 (일반 지도와 스카이뷰로 지도 타입을 전환)
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	// 오른쪽 위에 지도 컨트롤 표시하기
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	// 지도 확대, 축소하는 줌 컨트롤
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	
	//마커 생성하기
	// 마커 아이콘 대신할 이미지 넣기
	var imageSrc = '/resources/image/star_marker.png', //마커이미지 경로  
    imageSize = new kakao.maps.Size(50, 50), // 마커이미지 크기
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션 마커의 좌표와 일치시킬 이미지 안에서의 좌표
	
 	// 마커 이미지 정보 넣어서 마커 생성
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
        markerPosition = new kakao.maps.LatLng(37.199428994067965, 128.48601903785342); //마커 표시할 위치(위도,경도값)
        
    //마커 생성
    var marker = new kakao.maps.Marker({
    	position: markerPosition, 
    	image: markerImage // 마커이미지 설정 
	});
    //마커가 지도 위에 표시되도록 설정
    marker.setMap(map);

    //마커 설정 끝
    
   
    
	</script>

</body>

