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

	th, td{
		text-align: center;
	}
	
	td{
		line-height: 50px;
	}
</style>

</head>

<body>
	<div style="margin: 20px;">
		<table class="table table-striped caption-top" style="width: 800px;">
			<caption><b>${ cnt - 1 }명의 회원 정보</b></caption>
		
			<tr>
				<th>이름(아이디)</th>
				<th>메인사진</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>이메일</th>
				<th></th>
			</tr>
			
			<c:forEach items="${ list }" var="dto" varStatus="i">
				<c:if test="${ dto.id != 'admin' }"> <!-- 관리자는 회원 목록에 띄우지 않음 -->
					<tr>
						<td>${ dto.name }(${ dto.id })</td>
						<td><img src="../photo/${ dto.photo }" style="height: 50px;"></td>
						<td>${ dto.hp }</td>
						<td>${ dto.addr }</td>
						<td>${ dto.email }</td>
						<td>
							<button type="button" class="btn btn-outline-danger btn-sm" onclick="location.href='/member/delete?num=${ dto.num }'">삭제</button>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>