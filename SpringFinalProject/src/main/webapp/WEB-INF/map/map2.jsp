<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
   href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
   rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
<style type="text/css">
*{
font-family: 'Gowun Dodum', sans-serif;
}
	
</style>
</head>
<body>
<div id="map" style="width:800px;;height:600px; margin-left: 400px; margin-top: 150px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4de939ccd2e2f1153a4d9b11c187c981"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);

//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 ===========================
if (navigator.geolocation) {
 
 // GeoLocation을 이용해서 접속 위치를 얻어옵니다
 navigator.geolocation.getCurrentPosition(function(position) {
     
     var lat = position.coords.latitude, // 위도
         lon = position.coords.longitude; // 경도
     
     var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
         message = '<div style="padding:5px;">현위치</div>'; // 인포윈도우에 표시될 내용입니다
     
     // 마커와 인포윈도우를 표시합니다
     displayMarker(locPosition, message);
         
   });
 
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
 
 var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
     message = 'GPS설정을 허용해주세요'
     
 displayMarker(locPosition, message);
}

//지도에 마커와 인포윈도우를 표시하는 함수입니다====================================
function displayMarker(locPosition, message) {

 // 마커를 생성합니다
 var marker = new kakao.maps.Marker({  
     map: map, 
     position: locPosition
 }); 
 
 var iwContent = message, // 인포윈도우에 표시할 내용
     iwRemoveable = true;

 // 인포윈도우를 생성합니다
 var infowindow = new kakao.maps.InfoWindow({
     content : iwContent,
     removable : iwRemoveable
 });
 
 // 인포윈도우를 마커위에 표시합니다 
 infowindow.open(map, marker);
 
 // 지도 중심좌표를 접속위치로 변경합니다
 map.setCenter(locPosition);      
}    

//지도를 클릭한 위치에 표출할 마커입니다=============================================
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 


// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
</script>
</body>
</html>