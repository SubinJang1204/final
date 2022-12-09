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
<script type="text/javascript">
$(function(){
   $(".se").click(function(){
      $(".bt").trigger("click");
   });
});
</script>
<style type="text/css">
* {
	font-family: 'Gowun Dodum', sans-serif;
}

.wrapper {
	width: 470px;
	height: auto;
	display: inline-block;
	margin-right: 50px;
	margin-bottom: 100px;
}

.wrapper img {
	width: 400px;
	height: auto;
	margin-bottom: 10px;
}

.title {
	background-color: #fff;
	border-radius: 0px 80px 80px 0px;
	width: 450px;
	height: 100px;
	line-height: 30px;
	position: relative;
	top: -70px;
	padding-left: 10px;
	padding-top: 5px;
}

.title a {
	font-size: 1.5em;
	text-decoration: none;
	color: #000;
}

.scale {
	width: 400px;
	height: auto;
	overflow: hidden;
}

.scale img:hover {
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
	width: 400px;
	height: auto;
}
</style>
</head>
<body>
<div class="searcharea" style="width:100%;text-align:center;position:relative;top:100px;left:-65px;">
<!-- 검색창 -->

</div>
	<c:if test="${totalCount==0 }">
		<h2>해당하는 상품이 존재하지 않습니다</h2>
	</c:if>
	<caption>
		<h4
			style="font-size:1.2em;font-weight: 400; margin-top: 100px; margin-left: 440px; margin-bottom: 150px;">검색된 상품이 ${totalCount}건 있습니다</h4>
	</caption>
	
	<div class="con"
		style="width: 1400px; height: auto; margin-left: 430px;">

		<c:if test="${totalCount>0 }">
			<c:forEach var="dto" items="${list }" varStatus="i">

				<div class="wrapper">
					
					<div class="title">
						<span style="color: #2e2e2e; font-size: 0.9em;"> 
						<a href="${root }/shop/${dto.shopnum }">
						<div class="scale">
						<img src="../shopphoto/${dto.photo }">
						</div>
						</span>
						
						<span style="font-size:0.6em;">카테고리 > ${dto.category }</span><br>${dto.sangpum }
						<span style="float:right;font-size:1.1em">￦<fmt:formatNumber value="${dto.price }" pattern="#,###"/> </span>
						</a>


					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>

	<c:if test="${totalCount>0 }">

		<div style="width: 800px; margin-right: 83px; text-align: center;"
			class="container">
			<ul class="pagination">

				<c:if test="${startPage}>1">
					<li><a href="list?currentPage=${startPage - 1}">이전</a></li>
				</c:if>

				<c:forEach var="pp" begin="${startPage}" end="${endPage }">

					<c:if test="${currentPage==pp }">
						<li class="active"><a href="list?currentPage=${pp}"
							style="cursor: pointer;">${pp}</a></li>
					</c:if>

					<c:if test="${currentPage!=pp }">
						<li class="active"><a href="list?currentPage=${pp}"
							style="cursor: pointer;">${pp}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${endPage<totalPage}">
					<li><a href="list?currentPage=${endPage+1}">다음</a></li>
				</c:if>

			</ul>
		</div>
	</c:if>
</body>
</html>