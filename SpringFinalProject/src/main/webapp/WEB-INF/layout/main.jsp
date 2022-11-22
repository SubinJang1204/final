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
 

<title></title>
<style type="text/css">
*{
font-family: 'Gowun Dodum', sans-serif;
}
.f_link{
width:1200px;
height:auto;
margin-top:40px;
}

.links{
display: inline-block;
width:250px;
height:120px;
margin-left:5px;
margin-right:5px;
}

.links img{
border-radius:8px;
-webkit-filter: grayscale(90%);filter: grayscale(90%);
cursor:pointer;

}

.links img:hover{
-webkit-filter: grayscale(0%);filter: grayscale(0%);
}
</style>
</head>

<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
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
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<center>
<div class="f_link" style="z-index:1000;">
<div class="links"><img src="../image/8.png"><caption>전체 인기상품</caption></div>
<div class="links"><img src="../image/1.png"><caption>여성별 인기상품</caption></div>
<div class="links"><img src="../image/2.png"><caption>남성별 인기상품</caption></div>
<div class="links"><img src="../image/4.png" onclick="location.href='../shop/list'"><caption>전체 상품</caption></div><br><br>
<div class="links" onclick="location.href='../sns/list'"><img src="../image/9.png"><caption>SNS</caption></div>
<div class="links" onclick="location.href='../event/list'"><img src="../image/15.png"><caption>EVENT</caption></div>
<div class="links" onclick="location.href=''"><img src="../image/16.png"><caption>동네 게시판</caption></div>
<div class="links" onclick="location.href=''"><img src="../image/10.png"><caption>고객센터</caption></div>
</div>
</center>

</body>
</html>