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

<style type="text/css">
* {
	font-family: 'Gowun Dodum', sans-serif;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
<c:if test="${sessionScope.loginok==null }">
<script type="text/javascript">
alert("먼저 로그인 후 글을 써주세요");
history.back();
</script>
</c:if>
<center>
	<form action="update" method="post" enctype="multipart/form-data" style="margin-top:200px;margin-left:700px;">
	
	<input type="hidden" name="num" value="${dto.num }">
	<input type="hidden" name="currentPage" value="${currentPage}">
	<input type="hidden" name="regroup" value="${dto.regroup }">
	<input type="hidden" name="restep" value="${dto.restep }">
	<input type="hidden" name="relevel" value="${dto.relevel}">
	
	<input type="hidden" name="id" value="${sessionScope.myid }">
	
	<table class="table table-bordered" style="width:500px;">
	<tr>
	<th style="width:100px">제목</th>
	<td>
	<input type="text" name="subject" class="form-control" value="${dto.subject }">
	</td>
	</tr>
	
	<tr>
	<th style="width:100px">사진</th>
	<td>
	
	<input type="file" name="upload" class="form-control" multiple="multiple">
	</td>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
	<textarea style="width:490px;height:150px" name="content" class="form-control">${dto.content }
	</textarea>
	</td>
	</tr>
	
	<tr>
	<td colspan="2" align="center">
	<button type="submit" class="btn btn-default" style="width:120px;">게시글 저장</button>
	<button type="button" class="btn btn-default" style="width:120px;" onclick="location.href='list'">목록</button>
	</td>
	</tr>
	</table>
	</form>
	</center>
</body>
</html>