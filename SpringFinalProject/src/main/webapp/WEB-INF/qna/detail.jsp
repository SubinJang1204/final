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
</style>

<script type="text/javascript">
	$(function(){
		
		$("button.btndel").click(function(){
			
			var num = $(this).attr("num");
			var currentPage = $(this).attr("currentPage");
			var ans = confirm("삭제한 문의사항은 되돌릴 수 없습니다.\n정말 삭제하시겠습니까?");
			// console.log(num + ", " + currentPage + ", " + ans);
			
			if(ans){
				
				location.href="delete?currentPage=" + currentPage + "&num=" + num;
			}
			
		});
	});
</script>

</head>

<body>

	<!-- table -->
		<table class="table" style="width: 1200px; margin-top: 30px; margin-left: 20%;">
	    	<tr>
				<td colspan="2">
					<Strong style="font-size: 24pt; margin-left: 10px;">${ dto.subject }</Strong>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div style="width: 60px; height: 60px;">
						<img src="../photo/${ photo }" style="width: 60px; height: 60px;">
					</div>
					<span style="position: absolute; left: 320px; top: 108px;">
						<strong>${ dto.id }</strong><br>
						<span style="color: gray;"><fmt:formatDate value="${ dto.writeday }" pattern="yy-MM-dd HH:mm"/>&nbsp;/&nbsp;</span>
						<span style="margin-right: 10px; color: gray;">조회 ${ dto.readcount }</span>
					</span> 
				</td>
			</tr>
			<tr style="height: 400px;">
				<td colspan="2">
					<div style="margin-top: 20px; margin-left: 25px;">${ dto.question }</div>
				</td>	
			</tr>
			
			<!-- 댓글 start-->
		    <tr>
		    	<c:if test="${ dto.answer == 'noAnswer' }">
				    <c:if test="${ sessionScope.loginok != null and sessionScope.myid == 'admin' }">
					    <div>
					    	<form action="insertanswer" method="post">
						    	<input type="hidden" name="num" value="${ dto.num }">
						    	<input type="hidden" name="currentPage" value="${ currentPage }">
							    
								<td style="width: 80%">
									<textarea style="height: 70px;" name="answer" required="required" class="form-control" placeholder="답변을 입력해주세요"></textarea>
								</td>
								<td style="width: 15%">
									<button type="submit" class="btn btn-primary btnaadd" style="width: 100%; height: 70px;">등록</button>
								</td>
							</form>
						</div>
					</c:if>
					
					<c:if test="${ sessionScope.myid != 'admin' }">
						<td>
							<strong style="font-size: 20px; margin-left: 20px;">아직 답변이 등록되지 않았습니다.</strong>
						</td>
					</c:if>
				</c:if>
				
				<c:if test="${ dto.answer != 'noAnswer' }">
					<td>
						<strong style="font-size: 20px;">[관리자 답변]</strong>
						
						<br>
						
						<pre style="background-color: white; font-size: 15px; margin-left: 10px;">${ dto.answer }</pre>
					</td>
				</c:if>
			</tr>
			<!-- 댓글 end-->		
	
			<tr>
				<td colspan="2" align="right">
					<c:if test="${ sessionScope.loginok != null }">
						<c:if test="${ dto.id == sessionScope.myid or sessionScope.myid == 'admin' }">
							<button type="button" class="btn btn-outline-danger btndel" currentPage="${ currentPage }" num="${ dto.num }">삭제</button>
						</c:if>
					</c:if>
					<button type="button" class="btn btn-outline-success" onclick="location.href='list?currentPage=${ currentPage }'">목록</button>
				</td>
			</tr>
			    
	    
	    </table>
</body>
</html>