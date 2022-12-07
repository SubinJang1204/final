<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/resell.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>

<ul class="mainSnsNav">
	<button class="liNav" onclick="location.href='../trend/list'">Trend Now</button>
	<button class="liNav" onclick="location.href='../sns/list'">Fashion SNS</button>
	<button class="liNav selected" onclick="location.href='list'">Re-sell Market</button>
</ul>

<input type="hidden" value="${sessionScope.myid }" id="thisId">
<input type="hidden" value="${sessionScope.loginok }" id="thisLogin">

<div class="d-md-flex justify-content-md-end pe-5">
	<button type="button" id="writeresell" class="btn btn-outline-dark btn-lg writeresell">판매하기</button>
	<button type="button" class="ms-2 btn btn-outline-dark btn-lg position-relative writeresell" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">채팅방 열기
		<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
			${alarm }+
		</span>
	</button>
</div><br>

<section style="width: 100%; max-width:1000px;  margin: auto;" class="container" >
	<div class="row row-cols-1 row-cols-md-12 g-4 resellList">
	<!-- 리스트 출력 공간 -->
	</div>
</section>


<!-- 새 글 입력 Modal start -->
<div class="modal fade" id="writeResellModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">새 판매글 작성</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="subject" class="col-form-label">Subject:</label>
            <input type="text" class="form-control" name="subject" id="subject" placeholder="상품 이름을 입력하세요">
          </div>
          <div class="mb-3">
            <label for="upload" class="col-form-label">Photo:</label>
            <input type="file" class="form-control" name="upload" id="upload">
          </div>
          <div class="mb-3">
            <label for="price" class="col-form-label">Price:</label>
            <input type="text" class="form-control" name="price" id="price" placeholder="상품 가격을 입력하세요">
          </div>
          <div class="mb-3">
            <label for="content" class="col-form-label">Content:</label>
            <textarea class="form-control" style="height: 200px;" name="content" id="content" placeholder="내용을 입력하세요"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
        <button type="button" id="writeResell"  class="btn btn-primary">판매하기</button>
      </div>
    </div>
  </div>
</div>
<!-- 새 글 입력 Modal end -->


<!-- 사이드 바 start -->
<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" 
	tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel" style="width: 40%;">
  <div class="offcanvas-header">
  	<c:if test="${loginok==null }">
    	<h5 id="offcanvasRightLabel">Chatting List</h5>
  	</c:if>
  	<c:if test="${loginok!=null }">
    	<h5 id="offcanvasRightLabel">${sessionScope.myid }님의 Chatting List</h5>
  	</c:if>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
 	<div class="chatList">
 	</div>
	
	<!-- 채팅방 start-->
	<!-- <div class="Container">
		<h1>채팅방</h1>
		<div id="roomContainer" class="roomContainer">
			<table id="roomList" class="roomList"></table>
		</div>
		<div>
			<table class="inputTable">
				<tr>
					<th>방 제목</th>
					<th><input type="text" name="roomName" id="roomName"></th>
					<th><button id="createRoom">방 만들기</button></th>
				</tr>
			</table>
		</div>
	</div> -->
 	<!-- 채팅방 end-->
 	
  </div>
</div>
<!-- 사이드 바 end -->


<script type="text/javascript" src="../js/resell.js"></script>
</body>
</html>