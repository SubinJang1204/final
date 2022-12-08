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


<title></title>
<style type="text/css">
* {
	font-family: 'Gowun Dodum', sans-serif;
	margin: 0;
    padding: 0;
    font-size: 1rem;
    text-decoration: none;
    list-style: none;
    color: black;
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

#temp {
	height: 50px;
	width: 350px;
	position: absolute;
	top: 480px;
	left: 0px;
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
					<img src="../image/8.png" onclick="location.href='../shop/list'">
				</div>
				<caption>전체 상품</caption>
			</div>
			<div class="links">
				<div class="scale">
					<img src="../image/1.png">
				</div>
				<caption>여성별 인기상품</caption>
			</div>
			<div class="links">
				<div class="scale">
					<img src="../image/2.png">
				</div>
				<caption>남성별 인기상품</caption>
			</div>
			<div class="links">
				<div class="scale">
					<img src="../image/4.png">
				</div>
				<caption>전체 인기 상품</caption>
			</div>
			<br>
			<br>
			<div class="links" onclick="location.href='../sns/list'">
				<div class="scale">
					<img src="../image/9.png">
				</div>
				<caption>SNS</caption>
			</div>
			<div class="links" onclick="location.href='../event/list'">
				<div class="scale">
					<img src="../image/15.png">
				</div>
				<caption>EVENT</caption>
			</div>
			<div class="links" onclick="location.href=''">
				<div class="scale">
					<img src="../image/16.png">
				</div>
				<caption>동네 게시판</caption>
			</div>
			<div class="links" onclick="location.href=''">
				<div class="scale">
					<img src="../image/10.png">
				</div>
				<caption>고객센터</caption>
			</div>
		</div>
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