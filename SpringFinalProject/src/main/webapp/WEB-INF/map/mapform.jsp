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
body {
    background: #eee;
    margin-top: 30px;
}

#regForm {
    background-color: #ffffff;
    margin: 0px auto;
    font-family: Raleway;
    padding: 40px;
    border-radius: 10px;
    margin-left: 500px;
    width: 800px;
}

#register{

  color: #6A1B9A;
}

input,textarea {
    padding: 10px;
    width: 100%;
    font-size: 17px;
    font-family: Raleway;
    border: 1px solid #aaaaaa;
    border-radius: 10px;
    -webkit-appearance: none;
}


.tab input:focus{

  border:1px solid #6a1b9a !important;
  outline: none;
}

input.invalid {
 
    border:1px solid #e03a0666;
}



button:hover {
    opacity: 0.8;
    border:1px solid #6a1b9a !important;
    
}

button:focus{

  outline: none !important;
}

#searchBtn:hover {
 opacity: 0.8;
    border:1px solid #6a1b9a !important;
}

</style>
<head>
   <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
</head>

<body>
<form id="regForm" action="mapinsert" method="post" enctype="multipart/form-data" >
<h3 align="left" style="font-size: 2.0em;">스냅샷 등록</h3>
<hr><br>
<label for="title">제목</label><br>
<input type="text" required="required" name="subject" id="title"><br><br>

<label for="userid">작성자</label><br>
<input type="text" required="required" name="id" id="userid" value="${sessionScope.myid }" readonly><br><br>
<br>
<input type="file" required="required" name="upload" class="form-control" style="width: 400px" multiple="multiple">

<br>
<label for="content">내용</label><br>
<textarea name="content" required="required" id="content" cols="30" rows="7" style="padding:20px">
</textarea><br><br>

<input type="hidden" name="latitude" id="latitude" >
<input type="hidden" name="longitude" id="longitude" >
						
			<br><br><br>
			<h3 align="left" style="font-size: 2.0em;">스냅존 등록</h3>
			<hr><br>
			<div style="background-color: #f8f9fa; height: 100px;">
			<input type="text" value="" placeholder="주소입력를 입력하세요" required="required" style="width: 300px; margin-top: 27px; margin-left: 200px;" name="keyword" id="keyword" size="15"> 
			<input type="button" id="searchBtn" onclick="searchPlaces()" style="width: 70px;" value="검색">
			</div>
			<br>1.사진을 찍은 장소을 입력후 검색을 눌러주세요
			<br>2.지도에서 원하는 지역을 클릭해 마커를 활성화 시키세요.
			
<div id="map" style="width:715px;; margin-left:0px; margin-top:30px; height:500px;">
 </div><div class="clickLatlng"></div><br><br>

<button type="submit" style="margin-left: 270px;" class="btn btn-outline-dark">상품 등록</button>
<button type="button" class="btn btn-outline-dark" onclick="history.back()">뒤로 가기</button>
</form>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4de939ccd2e2f1153a4d9b11c187c981&libraries=services"></script>
<script>

// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 


//지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 

//지도에 마커를 표시합니다
marker.setMap(map);

//지도에 클릭 이벤트를 등록합니다
//지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
 
 // 클릭한 위도, 경도 정보를 가져옵니다 
 var latlng = mouseEvent.latLng; 
 
 // 마커 위치를 클릭한 위치로 옮깁니다
 marker.setPosition(latlng);
 
 var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
 message += '경도는 ' + latlng.getLng() + ' 입니다';
 
 $("#latitude").val(latlng.getLat());
 $("#longitude").val(latlng.getLng());

 $(".clickLatlng").text(message);
 
});

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
        //displayMarker(data[1]);
        for (var i=0; i<data.length; i++) {
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
        
    } 
}
</script>
</body>
</html>

