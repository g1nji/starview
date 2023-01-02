<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<div id="map" style="width:500px;height:400px;top: 50px; left: 50px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f07fd274b828fac20dcda324b400f383"></script>
	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 (나중에 현재 위치로 바꾸기)
	        level: 12 // 지도의 확대 레벨
	    };
	//지도 생성
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
 
		//geolocation 사용하기
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치 가져오기
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성
				message = '<div style="padding:5px;">📍현재 위치</div>'; // 인포윈도우에 표시될 내용

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);
			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = '현재 위치를 알 수 없습니당당다라당'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수
		function displayMarker(locPosition, message) {

			// 마커 생성
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경
			map.setCenter(locPosition);
		}

// 		지도타입 컨트롤 생성 (일반 지도와 스카이뷰로 지도 타입을 전환)
		
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 오른쪽 위에 지도 컨트롤 표시하기
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대, 축소하는 줌 컨트롤
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		
		//마커 생성하기
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [ 
				{ title : '별마로 천문대', latlng : new kakao.maps.LatLng(37.199428994067965, 128.48601903785342) },
				{ title : '안반데기', latlng : new kakao.maps.LatLng(37.62646015343739, 128.74028894771928) },
				{ title : '중미산 천문대', latlng : new kakao.maps.LatLng(37.58172695499676, 127.45931344199813) }, 
				{ title : '매봉산 바람의 언덕', latlng : new kakao.maps.LatLng(37.2155764, 128.963924) } , 
				{ title : '합천 황매산', latlng : new kakao.maps.LatLng(35.4812128 , 127.984827) } , 
				{ title : '화악터널 쌈지공원', latlng : new kakao.maps.LatLng(37.9929169, 127.522422) } 
				];
	
		
		// 마커 아이콘 대신할 이미지 넣기
		// 마커 이미지의 이미지 주소
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀 표시
				image : markerImage
			});
		}
		//마커가 지도 위에 표시되도록 설정
		//     marker.setMap(map);
		//마커 설정 끝
	</script>

</body>

