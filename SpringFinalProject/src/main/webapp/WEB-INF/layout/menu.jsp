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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
<title>Insert title here</title>
<style type="text/css">
.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}
*{
font-family: 'Gowun Dodum', sans-serif;

}
li {
	margin-right: 10px;
	margin-top: 10px;
	color: #000;
}

li a {
	color: #000;
	text-decoration: none;
}

li a:hover {
	color: #000;
	text-decoration: none;
}

li a:visited {
	color: #000;
	text-decoration: none;
}

html {
	scroll-behavior: smooth;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>


	<nav class="navbar navbar-expand-lg sticky-top">
		<div class="container-fluid">

			<button class="navbar-toggler navbar-brand" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item" style="margin-left: 300px;"><a
						class="nav-link active" aria-current="page" href="/" style="color: #000;font-size:17pt;margin-top:-6px">Logo</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false" style="color: #000;"> Category </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#" style="color: #000;">Dropdown Menu1</a></li>
							<li><a class="dropdown-item" href="#" style="color: #000;">Dropdown Menu2</a></li>
							<li><a class="dropdown-item" href="#" style="color: #000;">Dropdown Menu3</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#" style="color: #000;">Menu1</a></li>
					<li class="nav-item"><a class="nav-link" href="#" style="color: #000;">Menu2</a></li>
					<li class="nav-item"><a class="nav-link" href="${root}/sns/list" style="color: #000;">Trend</a></li>



					<c:if test="${sessionScope.loginok==null }">

						<li style="margin-left: 883px;"><a href="${root}/login/main"><i class="bi bi-box-arrow-right"
								style="font-size: 18pt; "></i></a></li>&nbsp;&nbsp;&nbsp;
						<li>
							<i class="bi bi-search" style="font-size: 15pt;position:relative;top:3px"></i>
						</li>
					</c:if>
					<c:if test="${sessionScope.loginok!=null }">
					
					<c:if test="${myid=='admin' }">
						<li style="position: relative; left: 780px;"><a
							href="manager"><i class="bi bi-gear" id="hov"
								style="font-size: 16pt;"></i></a></li>&nbsp;&nbsp;&nbsp;
					</c:if>

						<li style="margin-left: 780px;"><a href="${root}/login/logoutprocess"><i class="bi bi-box-arrow-left" id="hov"
								style="font-size: 18pt;"></i></a></li>&nbsp;&nbsp;&nbsp;

						<li><a href="mypage"><i class="bi bi-person" id="hov"
								style="font-size: 18pt;"></i></a></li>&nbsp;&nbsp;&nbsp;

						<li><a href=""><i class="bi bi-search" style="font-size: 15pt;position:relative;top:3px"></i></a></li>&nbsp;&nbsp;&nbsp;
						
						<li><a href="cart?myid=${myid }"><i class="bi bi-bag" id="hov"
								style="font-size: 16pt;"></i>
								<div style="color: white; background-color: #000; width: 17px; top:-24px; height: 17px; border-radius: 100%; position: relative; left: 15px; font-size: 13px; line-height: 17px;">&nbsp;0</div></a></li>
					
					
					<li>
					<div class="collapse" id="navbarToggleExternalContent">
  <div class="bg-dark p-4">
    <h5 class="text-white h4">Collapsed content</h5>
    <span class="text-muted">Toggleable via the navbar brand.</span>
  </div>
</div>
					 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>


</body>
</html>