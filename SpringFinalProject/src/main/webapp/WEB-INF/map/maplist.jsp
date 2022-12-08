<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<head>
   <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
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
    margin-left: 300px;
    width: 1300px;
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


/* 맵카드 */
.col-md-4{
	width: 300px;
	height: 400px;
	position: relative;	
	border: 1px solid #000000;
}
.img-responsive{
	width: 300px;
	height: 400px;
	vertical-align: middle;
}

.filter{
	width: 300px;
	height: 200px;
	margin-top: 200px;
	position: absolute;	
	background-color: #000;/* 까만색(0,0,0) */
    opacity:0.3; /* 80% 불투명도 */
}

.profile-writeday{
	padding: 5px 10px;
	text-align: center;
	color: white;
	position: absolute;
	top: 95%;
	left: 30%;
	transform: translate( -50%, -50% );}
}

.profile-name{
	
	transform: translate( -50%, -50% );

}


.profile-description{
	padding: 5px 10px;
	text-align: center;
	color: white;
	font-size: 15px;	
	position: absolute;
	top: 75%;
	left: 30%;
	transform: translate( -50%, -50% );
}


.profile-overview{
	padding: 5px 10px;
	text-align: center;
	color: white;	
	position: absolute;
	background-color: #000;/* 까만색(0,0,0) */
    opacity:0.5; /* 80% 불투명도 */
	top: 73%;
	left: 80%;
	transform: translate( -50%, -50% );
}

.likes{
	padding: 5px 10px;
	text-align: center;
	color: white;	
	width: 100px;
	position: absolute;
	background-color: #000;/* 까만색(0,0,0) */
    opacity:0.5; /* 80% 불투명도 */
	top: 73%;
	left: 80%;
	transform: translate( -50%, -50% );
}



.profile-overview:hover{
	padding: 5px 10px;
	text-align: center;
	color: white;	
	position: absolute;
	background-color: #000;/* 까만색(0,0,0) */
    opacity:0.9; /* 80% 불투명도 */
	top: 73%;
	left: 80%;
	transform: translate( -50%, -50% );
}

/* 게시판 */
root {
  --surface-color: #fff;
  --curve: 40;
}

* {
  box-sizing: border-box;
}

body {
  font-family: 'Noto Sans JP', sans-serif;
  background-color: #fef8f8;
}

.cards {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin: 4rem 5vw;
  padding: 0;
  list-style-type: none;
}

.card {
  position: relative;
  display: block;
  height: 350px;  
  width: 280px;
  border: 1px solid #aaaaaa;
  
  border-radius: calc(var(--curve) * 1px);
  overflow: hidden;
  text-decoration: none;
}

.card__image {      
  width: 350px;
  height: 400px;
}

.card__overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1; 
  color: white;
  background-color: #000;/* 까만색(0,0,0) */
  opacity:0.8; /* 80% 불투명도 */     
  border-radius: calc(var(--curve) * 1px);    
  transform: translateY(100%);
  transition: .2s ease-in-out;
}

.card:hover .card__overlay {
  transform: translateY(0);
}

.card__header {
  position: relative;
  display: flex;
  align-items: center;
  gap: 2em;
  padding: 2em;
  border-radius: calc(var(--curve) * 1px) 0 0 0;    
  background-color: var(--surface-color);
  transform: translateY(-100%);
  transition: .2s ease-in-out;
}

.card__arc {
  width: 80px;
  height: 80px;
  position: absolute;
  bottom: 100%;
  right: 0;      
  z-index: 1;
}

.card__arc path {
  fill: var(--surface-color);
  d: path("M 40 80 c 22 0 40 -22 40 -40 v 40 Z");
}       

.card:hover .card__header {
  transform: translateY(0);
}

.card__thumb {
  flex-shrink: 0;
  width: 50px;
  height: 50px;      
  border-radius: 50%;      
}

.card__title {
  font-size: 1em;
  margin: 0 0 .3em;
  color: #D7BDCA;
}

.card__tagline {
  display: block;
  margin: 1em 0;
  font-family: "MockFlowFont";  
  font-size: .8em; 
  color: #D7BDCA;  
}

.card__status {
  font-size: .8em;
  color: #D7BDCA;
}

.card__description {
  padding: 0 2em 2em;
  margin: 0;
  color: #D7BDCA;
  font-family: "MockFlowFont";   
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}    
</style>

</head>

<body>
<div id="regForm">
<div style="background-color: #black; height: 50px;">
<h3 align="left" style="font-size: 3.0em;">스냅샷 게시판</h3>
<hr><br>-지역을 검색해 스냅샷을 확인해보세요.<br>
			<input type="text" value="" placeholder="주소입력" style="width: 300px; margin-top: 27px; margin-left: 800px;" name="keyword" id="keyword" size="15"> 
			<input type="button" id="searchBtn" onclick="searchPlaces()" style="width: 70px;" value="검색">
			</div><br><br><br><br><br><br><br>
<div id="map" style="width:1100px; border:3px solid yellow; border-radius:10px; margin-left:60px; margin-top:50px; height:700px;">
 </div>
 
 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4de939ccd2e2f1153a4d9b11c187c981&libraries=services"></script>
<br><Br><Br>

<div class="boardlist" style="margin-top: 20px;">
	<h3>${totalCount }개의 글이 있습니다</h3>
	<hr>
		<!-- 글쓰기 버튼은 로그인을 해야 보인다 -->
<c:if test="${sessionScope.loginok!=null }">
	<tr>
		<td colspan="6">
		<button type="button"  style="margin-left: 1100px;" class="btn btn-default" onclick="location.href='mappage'">글쓰기</button>
		</td>
	</tr>
</c:if>
	<br>
 	
		<c:if test="${totalCount==0 }">
			<tr>
				<td colspan="6" align="center">
					<h4>등록된 글이 없습니다</h4>
				</td>
			</tr>
		</c:if>
		<c:if test="${totalCount>0 }">
		<ul class="cards">
	

			<c:forEach var="dto" items="${list }" varStatus="status"  >
		  <li><a class="card" id="cardd" num="${dto.num }"> 		  
		  <c:forTokens items="${dto.photo }" var="photo" delims=",">
					<img alt="" src="../photo/${photo }" width="100" class="card__image">
				</c:forTokens>
		  
				  <div class="card__overlay">
				  	<div class="card__header">
				  		<div class="card__header-text">
				  			<h3 class="card__title">${dto.subject }_${dto.keyword }</h3>
				  			<span class="card__status">${dto.writeday }_<b></b></span>				  			
				  		</div>		  		
				  	</div>
				  	<p class="card__description">${dto.content }</p>
			  	</div>
		  </a></li>
			</c:forEach>
			</ul>
		</c:if>
</div>
</div>

<!-- 페이징처리 -->
	<c:if test="${totalCount>0 }">
		<div style="width: 800px; margin-left: 900px;" class="container">
			<ul class="pagination">
			
			<!-- 이전 -->
			<c:if test="${startPage>1 }">
				<li>
					<a href="list?currentPage=${startPage-1 }">이전</a>
				</li>
			</c:if>
			
			<c:forEach var="pp" begin="${startPage }" end="${endPage }">
				<c:if test="${pp==currentPage}">
					<li class="active">
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
				<c:if test="${pp!=currentPage}">
					<li>
						<a href="list?currentPage=${pp }">${pp }</a>
					</li>
				</c:if>
			</c:forEach>
			
			<!-- 다음 -->
			<c:if test="${endPage<totalPage}">
				<li>
					<a href="list?currentPage=${endPage+1 }">다음</a>
				</li>
			</c:if>
			</ul>
		</div>
	</c:if>

<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 


//키워드 검색을 요청하는 함수입니다
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

        for (var i=0; i<data.length; i++) {
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}


 var positions = [];
 var contents = [];
 var photo = [];
 var subject = [];
 var writeday = []; 
 
	<c:forEach var="dto" items="${list}" begin="0" >
	
	positions.push(
		{
	        title: '${dto.subject}',
	        latlng: new kakao.maps.LatLng(${dto.latitude},${dto.longitude})
	    });
	
	contents.push("${dto.content}");
	photo.push("${dto.photo}");
	subject.push("${dto.subject}");
	writeday.push("${dto.writeday}");

	</c:forEach>
	
	
//마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
 
for (var i = 0; i < positions.length; i ++) {
 
 // 마커 이미지의 이미지 크기 입니다
 var imageSize = new kakao.maps.Size(24, 35); 
 
 // 마커 이미지를 생성합니다    
 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
 
 // 마커를 생성합니다
 var marker = new kakao.maps.Marker({
     map: map, // 마커를 표시할 지도
     position: positions[i].latlng, // 마커를 표시할 위치
     title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
     image : markerImage // 마커 이미지 
 });
 
//마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
 var photo2=photo[i].split(',');


 var iwContent = ''
	 iwContent += '<div class="col-md-4"><div class="filter"></div>'
	 iwContent += '<div class="profile-card-4 text-center"><div class="profile-name" style="color:white; position: absolute; top:55%;font-size: 1.7em; left: 5%; ">＃'+subject[i]+'</div><img src="/photo/'+photo2[0]+'" class="img img-responsive">'
	 iwContent += '<div class="profile-content"><div class="profile-writeday">'+writeday[i]+'</div>'
	 iwContent += '<div class="profile-description">'+contents[i]+'</div><div class="row">'
	 iwContent += '<div class="col-xs-4" style="margin-top: 30px;"><div class="profile-overview"></div>'
	 iwContent += '</div></div></div></div></div>'
 , // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
 	 iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

 // 인포윈도우를 생성합니다
 var infowindow = new kakao.maps.InfoWindow({
     content : iwContent,
     removable : iwRemoveable
 });

 kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));

	function makeClickListener(map, marker, infowindow) {
	return function() {
	infowindow.open(map, marker);
	};
	}
	
	
}

</script>
</body>
</html>

