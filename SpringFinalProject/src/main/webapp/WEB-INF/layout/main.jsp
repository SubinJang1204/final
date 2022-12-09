<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>
	
<script type="text/javascript" src="/js/weather.js"></script>

<style type="text/css">
* {
	font-family: 'Gowun Dodum', sans-serif;
}
.f_link {
	width: 1200px;
	height: auto;
	margin-top: 40px;
}
.links {
	display: inline-block;
	width: 250px;
	height: 120px;
	margin-left: 5px;
	margin-right: 5px;
}
.links img {
	border-radius: 8px;
	-webkit-filter: grayscale(70%);
	filter: grayscale(70%);
	cursor: pointer;
}
.scale {
	width: 250px;
	height: 120px;
	overflow: hidden;
	border-radius: 8px;
}
.scale img {
	border-radius: 8px;
}
.scale img:hover {
	border-radius: 8px;
	cursor: pointer;
	transform: scale(1.1);
	-o-transform: scale(1.1);
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	transition: transform .35s;
	-o-transition: transform .35s;
	-moz-transition: transform .35s;
	-webkit-transition: transform .35s;
}
.scale img {
	width: 250px;
	height: 120px;
}
.links img:hover {
	-webkit-filter: grayscale(0%);
	filter: grayscale(0%);
}
a{
text-decoration: none;
color:black;
}
a:hover{
text-decoration: none;
color:black;
}
figure.snip1368 {
  font-family: 'Roboto', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #ffffff;
  line-height: 1.4em;
  border-radius: 8px;
}
figure.snip1368 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.4s ease;
  transition: all 0.4s ease;
}
figure.snip1368 img {
  opacity: 1;
  width: 100%;
  vertical-align: top;
  border-radius: 8px;
}
figure.snip1368 h3 {
  position: absolute;
  top: 0%;
  width: 100%;
  background-color: #212121;
  z-index: 1;
  text-align: right;
  padding: -2px;
  margin: 0;
  font-weight: 300;
  font-size: 1.3em;
  -webkit-transform: translateY(-200%);
  transform: translateY(-200%);
  
}
figure.snip1368 h3:before {
  position: absolute;
  content: '';
  top: 100%;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 0 315px 55px 0;
  border-color: transparent #212121 transparent transparent;
}
figure.snip1368 figcaption {
  padding: 5px 25px 15px;
  position: absolute;
  width: 100%;
  z-index: 2;
  bottom: 0%;
  background-color: #141414;
  -webkit-transform: translateY(200%);
  transform: translateY(200%);
}
figure.snip1368 figcaption:before {
  position: absolute;
  content: '';
  bottom: 100%;
  left: 0;
  width: 0;
  height: 0;
  border-style: solid;
  border-width: 55px 0 0 315px;
  border-color: transparent transparent transparent #141414;
}
figure.snip1368 .icons {
  font-size:1.5em;
  float:left;
  left:7px;
  position: absolute;
  top:35px;
  -webkit-transform: translateY(-200%);
  transform: translateY(-200%); 
}
figure.snip1368:hover h3,
figure.snip1368.hover h3 {
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
}
figure.snip1368:hover figcaption,
figure.snip1368.hover figcaption {
  -webkit-transform: translateY(0%);
  transform: translateY(0%);
}
.best{
	width:300px;
	height:300px;
	display:inline-block;
	position: relative;
	margin-left:35px;
	margin-right:35px;
}
img:hover{
cursor:pointer;
}
#temp {
	height: 50px;
	width: 350px;
	position: absolute;
	top: 525px;
	left: 70px;
}
#temp{
    height: 50px;
    overflow: hidden;
}
#temp>ul{
    height: 50px;
}
#temp>ul>li{
    height: 50px;
}
</style>
</head>

<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
	<div id="carouselExampleFade" class="carousel slide carousel-fade"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="${root }/image/001.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${root }/image/002.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${root }/image/003.png" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleFade" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	<center>
		<div class="f_link" style="z-index: 1000;">
			<div class="links">
				<div class="scale">
					<img src="../image/q8.png" onclick="location.href='${root}/shop/list'">
				</div>
				<caption>전체 상품</caption>
			</div>
			<div class="links">
				<div class="scale"><a href="#cloth">
					<img src="../image/q2.png">
				</div>
				<caption>의류별 인기상품</caption></a>
			</div>
			<div class="links">
				<div class="scale"><a href="#shoes">
					<img src="../image/q3.png">
				</div>
				
				<caption>신발별 인기상품</caption>
				</a>
			</div>
			<div class="links">
				<div class="scale"><a href="#all">
					<img src="../image/q4.png">
				</div>
				<caption>전체 인기 상품</caption></a>
			</div>
			<br>
			<br>
			<div class="links" onclick="location.href='${root}/sns/list'">
				<div class="scale">
					<img src="../image/q9.png">
				</div>
				<caption>SNS</caption>
			</div>
			<div class="links" onclick="location.href='${root}/event/list'">
				<div class="scale">
					<img src="../image/q15.png">
				</div>
				<caption>EVENT</caption>
			</div>
			<div class="links" onclick="location.href='${root}/map/maplist'">
				<div class="scale">
					<img src="../image/q16.png">
				</div>
				<caption>동네 게시판</caption>
			</div>
			<div class="links" onclick="location.href='${root}/qna/list'">
				<div class="scale">
					<img src="../image/q10.png">
				</div>
				<caption>고객센터</caption>
			</div>
		</div>
		
	
		
		
<a name="all">
<div style="background-color:#F9F9F9;width:100vw;height:450px;display:inline-block;position:relative;margin-top:40px;margin-left:-10px">
<caption><h4 style="font-size:1.2em;font-weight:600;margin-left:-890px;margin-bottom:-10px;margin-top:60px">전체 인기 상품</h4></caption><br>
 <c:forEach var="bdto" items="${blist }" varStatus="i" begin="0" end="2" step="1">
 <div class="best">
  <figure class="snip1368" style="background-color:white;box-shadow: 4px 4px 4px 4px rgba(0.1, 0.1, 0.1, 0.1);">
	<a href="${root }/shop/${bdto.shopnum }">
	<img src="../shopphoto/${bdto.photo }" style="width:300px;height:300px;"></a><br>
	
	<h3>${i.count }. ${bdto.sangpum }&nbsp;</h3>
  <figcaption>
    <div class="icons">
    
	￦<fmt:formatNumber value="${bdto.price }" pattern="#,###"/>	
    </div>
  </figcaption>
</figure>
	</div> 
	</c:forEach> 
</div>
</a>
<a name="shoes">
<div style="width:100vw;height:350px;display:inline-block;position:relative;margin-top:100px;">
<caption><h4 style="font-size:1.2em;font-weight:600;margin-left:-890px;margin-bottom:-10px;margin-top:-40px">신발 인기 상품</h4></caption><br>
 <c:forEach var="dto" items="${list }" varStatus="i" begin="0" end="2" step="1">
 <div class="best">
  <figure class="snip1368" style="box-shadow: 4px 4px 4px 4px rgba(0.1, 0.1, 0.1, 0.1) ;">
  <a href="${root }/shop/${dto.shopnum }">
	<img src="../shopphoto/${dto.photo }" style="width:300px;height:300px;"></a><br>
	
	<h3>${i.count }. ${dto.sangpum }&nbsp;</h3>
  <figcaption>
    <div class="icons">
    
	￦<fmt:formatNumber value="${dto.price }" pattern="#,###"/>	
    </div>
  </figcaption>
</figure>
	</div> 
	</c:forEach> 
</div>
</a>

<a name="cloth">
<div style="background-color:#F9F9F9;width:100vw;height:450px;display:inline-block;position:relative;">
<caption><h4 style="font-size:1.2em;font-weight:600;margin-left:-890px;margin-bottom:-10px;margin-top:60px;">의류 인기 상품</h4></caption><br>
 <c:forEach var="adto" items="${alist }" varStatus="i" begin="0" end="2" step="1">
 <div class="best">
   <figure class="snip1368" style="background-color:white;box-shadow: 4px 4px 4px 4px rgba(0.1, 0.1, 0.1, 0.1);">
	<a href="${root }/shop/${adto.shopnum }">
	<img src="../shopphoto/${adto.photo }" style="width:300px;height:300px;"></a><br>
	
	<h3>${i.count }. ${adto.sangpum }&nbsp;</h3>
  <figcaption>
    <div class="icons">
    
	￦<fmt:formatNumber value="${adto.price }" pattern="#,###"/>	
    </div>
  </figcaption>
</figure>
	</div> 
	</c:forEach> 
</div>
</a>
</center>
 
<div id="temp">
			<ul>
				<li id="gw">강원도</li>
				<li id="gg">경기도</li>
				<li id="gn">경상남도</li>
				<li id="gb">경상북도</li>
				<li id="gj">광주광역시</li>
				<li id="dg">대구광역시</li>
				<li id="dj">대전광역시</li>
				<li id="bs">부산광역시</li>
				<li id="su">서울특별시</li>
				<li id="sj">세종특별자치시</li>
				<li id="us">울산광역시</li>
				<li id="ic">인천광역시</li>
				<li id="jn">전라남도</li>
				<li id="jb">전라북도</li>
				<li id="jj">제주특별자치도</li>
				<li id="cn">충청남도</li>
				<li id="cb">충청북도</li>
			</ul>
		</div>
</body>
</html>