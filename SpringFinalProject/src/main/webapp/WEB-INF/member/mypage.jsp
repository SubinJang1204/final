<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/mypage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<style type="text/css">
body{ background-color: #FAFAFA; }
</style>
</head>
<body>
<br><br>

<div class="d-md-flex justify-content-md-end pe-5">
	<button type="button" onclick="location.href='updateform'" class="btn btn-outline-dark btn-md">회원 정보 수정</button>
	<button type="button" id='delmyinfo' class="ms-2 btn btn-outline-danger btn-md" >회원 탈퇴</button>
</div>

<div class="con">
	<div class="m-4">
		<div id='photowrap' class="shadow">
			<img id="myphoto" src="../photo/${dto.photo }">	
		</div>
		<p class="fs-4 text-center p-2">${dto.id }</p>
	</div>
	<input type="hidden" id="num" value="${dto.num }">
</div>

<div class="d-grid gap-2 col-6 mx-auto" style="width: 80%;">
	<div class="btn-group" role="group" aria-label="Basic outlined example">
	  <button type="button" id="shoplist" class="btn btn-outline-dark btn-lg list-btn">나의 관심 상품</button>
	  <button type="button" id="orderlist" class="btn btn-outline-dark btn-lg list-btn">주문 현황</button>
	</div>
</div>

<br>

<section class="col-6 mx-auto row row-cols-4" id="result" style="width: 80%;">
	<!-- shop 관심 상품 리스트 출력 -->
</section>

<section class="col-6 mx-auto row row-cols-4 fs-5" style="width: 80%;" id="orderList">
</section>

<script type="text/javascript" src="../js/mypage.js"></script>
</body>
</html>