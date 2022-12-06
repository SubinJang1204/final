<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime"%>
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
a{
color:black;
text-decoration: none;
}
a:hover{
color:black;
text-decoration: none;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
<img src="../image/banner1.png">
<div class="boardlist" style="margin-top:50px;margin-left:450px;">

<table class="table table-bordered" style="width:1000px ">
<tr>
<div class="searcharea" style="width:100%;text-align:center">
<!-- 검색창 -->
<form action="list" class="form-inline">
<div style="width:450px;display:inline-block;margin-right:370px;float:right;margin-bottom:30px;">
<select class="form-select" style="width:80px;display:inline-block" name="searchcolumn">
<option value="subject">제목</option>
<option value="content">내용</option>
</select>
<input type="text" name="searchword" class="form-control"
style="width:150px;display:inline-block" placeholder="검색 단어">
<button type="submit" class="btn btn-dark bt" onchange="readURL(this)" style="visibility: hidden">검색</button>
<i class="bi bi-search se" style="cursor:pointer;font-size:1.3em;position:relative;left:-50px;"></i>
</div>
</form>
</div>
</tr>
<tr>
<th width="50"></th>
<th width="350">제목</th>
<th width="120">작성일</th>
<th width="100">조회수</th>
<th width="80">추천</th>
</tr>

<c:if test="${totalCount==0 }">
<tr>
<td colspan="6" align="center">
<h4>등록된 글이 없습니다</h4>
</td>
</tr>
</c:if>

<c:if test="${totalCount>0 }">
<c:forEach var="dto" items="${list }">
<tr>
<td>${no }</td>
<td style="font-size:1.1em">
<c:set var="no" value="${no-1 }"/>
<!-- 답글일 경우 level당 2칸씩 띄우기 -->
<c:forEach begin="1" end="${dto.relevel}">&nbsp;&nbsp;</c:forEach>

<!-- 답글일 경우 답글 이미지 -->
<c:if test="${dto.relevel>0 }">
<img src="../image/re.png">
</c:if>

<a href="detail?num=${dto.num}&currentPage=${currentPage}">${dto.subject }
<c:if test="${dto.photo!='no' }">
<i class="bi bi-card-image"></i>
</c:if>
</a>

</td>
<td style="font-size:0.9em"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
<td style="font-size:0.9em">${dto.readcount }</td>
<td style="font-size:0.9em">${dto.likes }</td>
</tr>
</c:forEach>
</c:if>
<!-- 글쓰기 버튼은 로그인을 해야만 보인다 -->
	<c:if test="${myid=='admin' }">
	<tr>
	<td colspan="6" align="right">
	<button type="button" class="btn btn-dark" onclick="location.href='form'">답변형 폼</button>
	</td>
	</tr>
	</c:if>
	
</table>
</div>
<!-- 페이징 처리 -->
	<c:if test="${totalCount>0 }">
		<!-- 페이징 처리 -->
		<div style="width: 800px;margin-left:930px; text-align: center;" class="container">
			<ul class="pagination">
				<!-- 이전 -->

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

				<!-- 다음 -->
				<c:if test="${endPage<totalPage}">
					<li><a href="list?currentPage=${endPage+1}">다음</a></li>
				</c:if>

			</ul>
		</div>
	</c:if>

</body>
</html>