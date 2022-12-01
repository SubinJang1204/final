<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<style type="text/css">
* { font-family: 'Gowun Dodum', sans-serif; }
*{
	margin: 0;
	padding:0;
}
a{
	text-decoration: none;
}
a:link {color: black;}
a:visited {color: black;}
a:active {color: black;}
a:hover {color: black;}
ul{
    list-style: none;
}
/* 화면 전체 렙 */
.wrapper{
	width: 100%;
	left: 200px;
}
/* content 랩 */
.wrap{
	width : 1080px;
	margin: auto;
}
/* 관리자페이지 컨텐츠 영역 */
.admin_content_wrap{
    width: 1000px;
    float:left;
    min-height:700px;
    margin-left: 400px;
    margin-top: 30px;
}
.admin_content_subject{	/* 관리자 컨텐츠 제목 영역 */
    font-size: 40px;
    font-weight: bolder;
    padding-left: 15px;
    background-color: #000000;
    height: 80px;
    line-height: 80px;
    color: white;	
}
	/* 작가 목록 영역 */
.order_table_wrap{
	padding: 20px 35px;
	min-height: 570px;
}
.order_table{
	margin: auto;
    width: 100%;
    border: 1px solid #d3d8e1;
    text-align: center;
    border-collapse: collapse;
    margin-top: 10px;
}
.order_table td{
	padding: 10px 5px;
	border : 1px solid #e9ebf0;
}
.order_table thead{
	background-color: #f8f9fd;	
	font-weight: 600;
}

.delete_btn{
    border: none;
    color: white;
    padding: 5px 15px;
    cursor: pointer;
    background-color: #f7564b;	
}
.delete_btn:hover{
	background-color : #da190b;
}

.table_empty{
	height: 50px;
    text-align: center;
    margin: 200px 0 215px 0px;
    font-size: 25px;
}

	/* 검색 영역 */
.search_wrap{
	margin-top:15px;
}
.search_input{
    position: relative;
    text-align:center;	
}
.search_input input[name='keyword']{
	padding: 4px 10px;
    font-size: 15px;
    height: 20px;
    line-height: 20px;
}
.search_btn{
	height: 32px;
    width: 80px;
    font-weight: 600;
    font-size: 18px;
    line-height: 20px;
    position: absolute;
    margin-left: 15px;
    background-color: #c3daf7;
}
</style>
</head>
<body>

					<div class="searcharea"
						style="width: 100%; margin-left: 1070px; margin-top: 100px;">
						<!-- 검색창  -->
						<form action="jumun" class="form-inline">
							<div style="width: 450px; display: inline-flex;">
								<select class="form-control" style="width: 120px;"
									name="searchcolumn">
									<option value="name">주문 아이디</option>
									<option value="orderdate">주문 날짜</option>
								</select> <input type="text" name="searchword" class="form-control"
									style="width: 150px;">
								<button style="color: white; background-color: black;" type="submit"
									class="btn btn-info">검색</button>
							</div>
						</form>
					</div>

				<!-- 메인 -->
								
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>주문 현황</span></div>
					<div class="author_table_wrap">
						<!-- 게시물 O -->
						<c:if test="${totalCount != null }">
	                    	<table class="order_table">
	                    	<colgroup>
	                    		<col width="5%">
	                    		<col width="16%">
	                    		<col width="16%">
	                    		<col width="16%">
	                    		<col width="17%">
	                    		<col width="16%%">
	                    	</colgroup>
	                    		<thead>
	                    			<tr>
    	                    		    <td><input type="checkbox" id="allcheck"></td>
	                    				<td class="th_column_1">주문 번호</td>
	                    				<td class="th_column_2">주문 아이디</td>
	                    				<td class="th_column_3">주문 날짜</td>
	                    				<td class="th_column_4">주문 상태</td>
	                    				<td class="th_column_5">주소</td>
	                    			</tr>
	                    		</thead>
	                    		<c:forEach items="${list}" var="list">
	                    		<tr>
                      			    <td><input type="checkbox" class="del" o_num=${list.o_num }></td>
	                    			<td><c:out value="${list.o_num}"></c:out> </td>                    			
	                    			<td><c:out value="${list.name}"></c:out></td>
	                    			<td><fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd"/></td>
	                    			<td><c:out value="${list.state}"/></td>
	                    			<td><c:out value="${list.addr1}"/><br><c:out value="${list.addr2}"/></td></td>
	                    		</tr>
	                    		</c:forEach>
	
	                    	</table> 	
	                    					
						</c:if><br>
						<button type="button" class="delete_btn" style="margin-left: 930px;"
						id="btnmemberdel">삭제</button>						
    <c:if test="${totalCount>0 }">
		<div style="font-size:1.5em; width: 800px; margin-left:450px;; text-align: center;"
			class="container">
			<ul class="pagination">

				<c:if test="${startPage}>1">
					<li><a href="jumun?currentPage=${startPage - 1}">이전</a></li>
				</c:if>

				<c:forEach var="pp" begin="${startPage}" end="${endPage }">

					<c:if test="${currentPage==pp }">
						<li class="active"><a href="jumun?currentPage=${pp}"
							style="cursor: pointer;">${pp}</a></li>
					</c:if>

					<c:if test="${currentPage!=pp }">
						<li class="active"><a href="jumun?currentPage=${pp}"
							style="cursor: pointer;">${pp}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${endPage<totalPage}">
					<li><a href="jumun?currentPage=${endPage+1}">다음</a></li>
				</c:if>

			</ul>
		</div>
	</c:if>
                		<!-- 게시물 x -->
                		<c:if test="${totalCount= null}">
                			<div class="table_empty">
                				등록된 작가가 없습니다.
                			</div>
                		</c:if> 						
                			
                    </div> 

<script>

	//전체선택하면 체크박스 선택,해제
	$("#allcheck").click(function(){
		
		//체크값 얻기
		var chk=$(this).is(":checked");
		console.log(chk);
		
		//전체를 각 글앞의 체크에 일괄 전달
		$(".del").prop("checked",chk);
	});

	$("#btnmemberdel").click(function(){
			
			//체크한 인원수 구하기
			var cnt=$(".del:checked").length;
			//alert(cnt);
			
			if(cnt==0){
				alert("먼저 삭제할 회원을 선택해주세요");
				return;
			}
			
			$(".del:checked").each(function(i,elt){
				
				var o_num=$(this).attr("o_num");
				console.log(o_num);
				
				$.ajax({
					type:"get",
					dataType:"html",
					url:"jumundelete",
					data:{"o_num":o_num},
					success:function(){
						//새로고침
						location.reload();
					}
				});
				
			});
		});

</script>
</body>
</html>