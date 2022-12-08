<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
<style type="text/css">
*{
font-family: 'Gowun Dodum', sans-serif;
}

.btn{
	margin-right: 100px;
	width: 200px;
	height: 80px;
}
</style>

</head>

<body>

	<div class="d-grid gap-2 d-md-block" style="margin-top: 200px; margin-left: 400px;">
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='memberList'">회원 관리</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='shopform'">상품 등록</button>
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='event'">이벤트 관리</button>
				<button type="button" class="btn btn-outline-secondary" onclick="location.href='jumun'">주문 관리</button>
		
	</div>
</body>
</html>