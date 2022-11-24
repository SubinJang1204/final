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
		
		$("button.gowrite").click(function(){
			
			var loginok = $(this).attr("loginok");
			var currentPage = $(this).attr("currentPage");
			// console.log(loginok + ", " + currentPage);
			
			if(loginok == ""){
				
				alert("로그인이 필요한 서비스입니다.")
				
			} else {
				
				location.href="qnaform?currentPage=" + currentPage;
			}
		});
	});
</script>

</head>

<body>
	<nav class="navbar navbar-expand-sm w3-theme-l3 justify-content-center" style="margin-top: 50px; margin-left: 40%">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="qnaform?currentPage=${ currentPage }"><b>문의하기</b></a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href=""><b>나의 문의</b></a>
			</li>
		</ul>
	</nav>
	<table class="table table-hover" style="width: 1200px; margin-top: 30px; margin-left: 20%;">
		<caption>
			<!-- paging -->
				<c:if test="${ totalCnt > 0 }">
					<div style="width: 800px; text-align: center;" class="container">
						<ul class="pagination justify-content-center">
							<!-- 이전 -->
							<c:if test="${ startPage > 1 }">
								<li>
									<%-- <a href="list?currentPage=${ startPage - 1 }">이전</a> --%>
									<a class="page-link" href="list?currentPage=${ startPage - 1 }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							<c:forEach var="pp" begin="${ startPage }" end="${ endPage }">
								<c:if test="${ currentPage == pp }">
									<li class="page-item active">
										<a class="page-link" href="list?currentPage=${ pp }">${ pp }</a>
									</li>
								</c:if>
								
								<c:if test="${ currentPage != pp }">
									<li>
										<a class="page-link" href="list?currentPage=${ pp }">${ pp }</a>
									</li>
								</c:if>
							</c:forEach>
							
							<!-- 다음 -->
							<c:if test="${ endPage < totalPage }">
								<li>
									<%-- <a href="list?currentPage=${ endPage + 1 }">다음</a> --%>
									<a class="page-link" href="list?currentPage=${ endPage + 1 }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:if>
						</ul>
					</div>
				</c:if>
		</caption>
		
		<thead>
			<tr style="font-weight: bold; background-color: #EEEEEE;">
				<td width="100" style="text-align: center;">번호</td>
				<td width="400">제목</td>
				<td width="150" style="text-align: center;">작성자</td>
				<td width="150" style="text-align: center;">작성일</td>
				<td width="80" style="text-align: center;">조회</td>	
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${ totalCnt == 0 }">
				<tr>
					<td colspan="5" align="center">
						<b>문의 내역이 없습니다.</b>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${ totalCnt != 0 }">
				<c:forEach items="${ list }" var="dto" varStatus="i">
					
					<!-- 관리자 계정으로 로그인 시 -->
					<c:if test="${ sessionScope.loginok != null and sessionScope.myid == 'admin'  }">
						<tr style="cursor: pointer;" onclick="location.href='detail?num=${ dto.num }&currentPage=${ currentPage }'">
							<td align="center">${ no }</td>
							<c:set var="no" value="${ no - 1 }"/>
							<td>
								${ dto.subject }
								<c:if test="${ dto.answer != 'noAnswer' }">
									<b style="color:blue; font-size: 0.7em;">[답변완료]</b>
								</c:if>
							</td>
							<td style="text-align: center;">${ dto.id }</td>
							<td style="text-align: center;"><fmt:formatDate value="${ dto.writeday }" pattern="yy-MM-dd HH:mm"/></td>
							<td style="text-align: center;">${ dto.readcount }</td>
						</tr>
					</c:if>
				
					<c:if test="${ sessionScope.loginok != null and sessionScope.myid != 'admin' }">
						<!-- 비밀글이 아닐때 -->
						<c:if test="${ dto.secret == 0 }">
							<tr style="cursor: pointer;" onclick="location.href='detail?num=${ dto.num }&currentPage=${ currentPage }'">
								<td align="center">${ no }</td>
								<c:set var="no" value="${ no - 1 }"/>
								<td>
									${ dto.subject }
									<c:if test="${ dto.answer != 'noAnswer' }">
										<b style="color:blue; font-size: 0.7em;">[답변완료]</b>
									</c:if>
								</td>
								<td style="text-align: center;">${ dto.id }</td>
								<td style="text-align: center;"><fmt:formatDate value="${ dto.writeday }" pattern="yy-MM-dd HH:mm"/></td>
								<td style="text-align: center;">${ dto.readcount }</td>
							</tr>
						</c:if>
						
						<!-- 비밀글이지만 작성자의 계정으로 로그인 했을때 -->
						<c:if test="${ dto.secret == 1 and sessionScope.myid == dto.id }">
							<tr style="cursor: pointer;" onclick="location.href='detail?num=${ dto.num }&currentPage=${ currentPage }'">
								<td align="center">${ no }</td>
								<c:set var="no" value="${ no - 1 }"/>
								<td>
									<i class="bi bi-unlock"></i>&nbsp;${ dto.subject }
									<c:if test="${ dto.answer != 'noAnswer' }">
										<b style="color:blue; font-size: 0.7em;">[답변완료]</b>
									</c:if>
								</td>
								<td style="text-align: center;">${ dto.id }</td>
								<td style="text-align: center;"><fmt:formatDate value="${ dto.writeday }" pattern="yy-MM-dd HH:mm"/></td>
								<td style="text-align: center;">${ dto.readcount }</td>
							</tr>
						</c:if>
						
						<!-- 비밀글이고 작성자의 계정이 아닐 때 -->
						<c:if test="${ dto.secret == 1 and sessionScope.myid != dto.id }">
							<tr>
								<td align="center">${ no }</td>
								<c:set var="no" value="${ no - 1 }"/>
								<td colspan="4">
									<i class="bi bi-lock-fill"></i>&nbsp;비밀글입니다
								</td>
							</tr>
						</c:if>
					</c:if>
					
					<!-- 로그인 안됐을때 -->
					<c:if test="${ sessionScope.loginok == null }">
						<!-- 안비밀글 -->
						<c:if test="${ dto.secret == 0 }">
							<tr style="cursor: pointer;" onclick="location.href='detail?num=${ dto.num }&currentPage=${ currentPage }'">
								<td align="center">${ no }</td>
								<c:set var="no" value="${ no - 1 }"/>
								<td>
									${ dto.subject }
									<c:if test="${ dto.answer != 'noAnswer' }">
										<b style="color:blue; font-size: 0.7em;">[답변완료]</b>
									</c:if>
								</td>
								<td style="text-align: center;">${ dto.id }</td>
								<td style="text-align: center;"><fmt:formatDate value="${ dto.writeday }" pattern="yy-MM-dd HH:mm"/></td>
								<td style="text-align: center;">${ dto.readcount }</td>
							</tr>
						</c:if>
						
						<!-- 비밀글 -->
						<c:if test="${ dto.secret == 1 }">
							<tr>
								<td align="center">${ no }</td>
								<c:set var="no" value="${ no - 1 }"/>
								<td colspan="4">
									<i class="bi bi-lock-fill"></i>&nbsp;비밀글입니다
								</td>
							</tr>
						</c:if>
					</c:if>
				</c:forEach>
			</c:if>
		</tbody>
			
		<thead>
			<tr>
				<td colspan="5" align="right">
					<button type="button" class="btn btn-outline-dark gowrite" currentPage="${ currentPage }" loginok="${ sessionScope.loginok }">문의하기</button>
				</td>
			</tr>
		</thead>
			
	</table>
</body>
</html>