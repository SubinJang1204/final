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
<style type="text/css">
div.likes{
cursor:pointer;
}
</style>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
<table class="table">
<tr>
<td>
<span style="font-size:30px">${dto.subject }</span><br>
<span style="font-size:14px">${dto.writeday }</span><span style="font-size:14px;float:right">조회 ${dto.readcount }</span>
</td>
</tr>
<tr>
<td>
 <c:if test="${dto.photo!='no' }">
            <c:forTokens items="${dto.photo }" var="photo" delims=",">
            <img alt="" src="../photo/${photo }" width="100" class="img-thumnail">
            </c:forTokens>
         </c:if>
        
         <br>
         <span style="font-size:16px;">${dto.content }</span>
         
</td>
</tr>
<tr>
<td>
<br>
<div class="likes" style="font-size:15px">
<i class="bi bi-heart"></i>&nbsp;&nbsp;좋아요&nbsp;&nbsp;<b>${dto.likes }</b>
</div>
<i class="bi bi-chat" style="font-size:15px"></i>&nbsp;&nbsp;&nbsp;<span style="font-size:15px">댓글</span>&nbsp;&nbsp;<b class="banswer" style="font-size:15px">0</b>
<br><br>
</td>

</tr>

<tr>
<td>
<div style="font-size:14px;">

</div>
</td>
</tr>
<tr>
<td>

<button class="btn btn-light btn-lg" style="width:100px" onclick="location.href='list?currentPage=${currentPage}'">목록</button>
<c:if test="${myid=='admin' }">
<button class="btn btn-light btn-lg" style="width:100px" onclick="location.href='form'">새글</button>&nbsp;&nbsp;
<button class="btn btn-light btn-lg" style="width:100px" onclick="location.href='form?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>&nbsp;&nbsp;
<button class="btn btn-light btn-lg" style="width:100px" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
<button class="btn btn-light btn-lg" style="width:100px" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
</c:if>

</td>
</tr>
</table>

<script type="text/javascript">
$("div.likes").click(function(){
	var heart=$(this).find("i").attr("class");
	/* alert(heart); */
	if(heart=='bi bi-heart'){
		$(this).find("i").attr("class","bi bi-heart").css("color","red");
	}else{
		$(this).find("i").attr("class","bi bi-heart").css("color","black");
	}
	var num=${dto.num};
	console.log(num);
	//ajax 이용 증가 후 출력
	$.ajax({
		
		type:"get",
		url:"likes",
		dataType:"json",
		data:{"num":num},
		success:function(res){
			$("div.likes").find("b").text(res.likes);
		}
	});
});
</script>
</body>
</html>