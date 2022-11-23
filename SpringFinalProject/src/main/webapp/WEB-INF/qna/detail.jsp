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

</head>

<body>

	<!-- table -->
		<table class="table" style="margin-top: 40px; width: 600px;">
	    	<tr>
				<td colspan="2">
				<Strong style="font-size: 24pt; margin-left: 10px;">${ dto.subject }</Strong>
				<b style="float: right; margin-right: 10px;">작성일: <fmt:formatDate value="${ dto.writeday }" pattern="yy-MM-dd HH:mm"/></b> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<strong style="margin-left: 20px;">작성자: </strong> ${ dto.id }
				<span style="float: right; margin-right: 10px;"><b>조회수: </b>${ dto.readcount }</span>
				</td>
			</tr>
			<tr style="height: 400px;">
				<td colspan="2">
					<div style="margin-top: 20px; margin-left: 25px;">${ dto.question }</div>
				</td>	
			</tr>
			
	<!-- 댓글 start-->
			<!-- 댓글창 start-->
			<tr>
		    	<td colspan="2">
		    		<div style="margin-bottom: 10px;">
		    			<b>댓글 <span>0</span></b>
		    		</div>
		    		<div id="alist">
		    			
		    		</div>
		    	</td>
		    </tr>
		    
		    <c:if test="${ sessionScope.loginok != null and sessionScope.myid == 'admin' }">
			    <div>
			    	<form id = "answerform" action="post">
				    	<input type="hidden" id ="num" value="${ dto.num }">
				    	<input type="hidden" name="myid" id="myid" value="${ dto.id }">
					    <tr>
							<td style="width: 80%">
								<textarea style="height: 70px;" name="content" id="content" required="required" class="form-control" placeholder="답변을 입력해주세요" ></textarea>
							</td>
							<td style="width: 15%">
								<button type="button" class="btn btn-primary btnaadd" style="width: 100%; height: 70px;">등록</button>
							</td>
						</tr>	
					</form>
				</div>
			</c:if>
		   <!-- 댓글창 end -->
	<!-- 댓글 end-->		
	
			<%-- <tr>
				<td colspan="2">
				<%
				if(dto.getId().equals(myid)){%>
				<button type="button" class="btn btn-danger" onclick="qnadel(<%=num %>,<%=currentPage %>)" style="float:right; margin-left: 10px;">삭제</button>
				<button type="button" class="btn btn-warning" onclick="location.href='index.jsp?main=qna/qnaupdateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage %>'" style="float: right; margin-left: 10px;">수정</button> 
				<%}
				%>
				<button type="button" class="btn btn-success" onclick="location.href='index.jsp?main=qna/qnaboard.jsp'" style="float: left;">목록</button>
				</td>
			</tr> --%>
			    
	    
	    </table>
	<button type="button" onclick="location.href='list?currentPage=${ currentPage }'">목록</button>
</body>
</html>