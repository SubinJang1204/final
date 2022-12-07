<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/app.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
<div style="clear: both"></div>

<ul class="mainSnsNav">
	<button class="liNav" onclick="location.href='../trend/list'">Trend Now</button>
	<button class="liNav selected" onclick="location.href='list'">Fashion SNS</button>
	<button class="liNav" onclick="location.href='../resell/list'">Re-sell Market</button>
</ul>

<input type="hidden" value="${sessionScope.loginok }" id="thisLogin">

<div class="d-md-flex justify-content-md-end pe-5">
	<button type="button" id="writebtn" class="btn btn-outline-dark btn-lg writebtn">새 글 작성</button>
</div>

<section style="width: 100%; max-width:1300px; margin: auto;" class="container" >
	<div class="row row-cols-1 row-cols-md-3 g-4 snsList">
	<!-- 리스트 출력 -->
	</div>
</section>


<!-- 새 글 입력 Modal start -->
<div class="modal fade" id="writeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">새 글 작성</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="mb-3">
            <label for="subject" class="col-form-label">Subject:</label>
            <input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력하세요">
          </div>
          <div class="mb-3">
            <label for="upload" class="col-form-label">Photo:</label>
            <input type="file" class="form-control" name="upload" id="upload">
          </div>
          <div class="mb-3">
            <label for="content" class="col-form-label">Content:</label>
            <textarea class="form-control" style="height: 200px;" name="content" id="content" placeholder="내용을 입력하세요"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
        <button type="button" id="writeSns"  class="btn btn-primary">출간하기</button>
      </div>
    </div>
  </div>
</div>
<!-- 새 글 입력 Modal end -->


<!-- 디테일 뷰 Modal start -->
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="height: 700px">
  <div class="modal-dialog modal-dialog-scrollable modal-xl">
    <div class="modal-content">
      
      <div class="modal-header">
      	<div id="detailviewModal">
      	<!-- 아이디 확인 후 수정 삭제 버튼 생성-->	
		</div>
      	<input type="hidden" id="detailNum" name="num">
      	<input type="hidden" id="detailmyid" name="myid" value="${sessionScope.myid }">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <div class="modal-body snsDetail">
        <div class="detailModalImg">
	        <img id="detailPhoto" src="">
        </div>
       
        <div class="detailModalText">
        	<div class="ModelTextarea p-3">
        		<div class="d-flex align-items-center">
				  <div class="flex-shrink-0">
					<div style="width: 30px; height: 30px; border-radius:15px; overflow:hidden;">
					    <img id="M_photo" src="../snsphoto/user.png" style="width: 100%; height: 100%; over-fit:cover;">
					</div>
				  </div>
				  <div class="flex-grow-1 ms-3">		    
			        <h4 class="fw-bold" id="detailId"></h4>
				  </div>
				</div>
				
				<br>
		        <h4 id="detailSubject"></h3>
		        <h5 id="detailContent"></h4>
        	</div>
	        
	        <button type="button" class="btn btn-outline-danger mt-2 mb-2">
		        <i class='bi bi-heart-fill'></i>
	        </button> 
	        <button type="button" class="btn btn-outline-secondary mt-2 mb-2">
		        <i class='bi bi-bookmark-fill'></i>
	        </button> 
        	<hr>
        	<p>댓글</p>
        	<div class="answerList">
        	<!-- 댓글 출력 공간 -->
        	</div>
        	<form class="d-flex">
	        	<div class="form-floating flex-fill">
				  <input type="text" id="answerContent" class="form-control" id="floatingTextarea">
				  <label for="floatingTextarea">Comments</label>
				</div>
				<button type="button" id="answerInsert" class="btn btn-outline-secondary" style="height: 60px;">
			        <i class="bi bi-pencil-fill"></i>
		        </button> 
        	</form>
        </div>
      </div>
      
    </div>
  </div>
</div>
<!-- 디테일 Modal end -->

<!-- 업데이트 Modal start -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">글 수정 하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <input type="hidden" name="num" id="Unum">
          <div class="mb-3">
            <label for="subject" class="col-form-label">Subject:</label>
            <input type="text" class="form-control" name="subject" id="Usubject" val="" placeholder="제목을 입력하세요">
          </div>
          <div class="mb-3">
            <label for="upload" class="col-form-label">Photo:</label>
            <input type="file" class="form-control" name="upload" id="Uupload" val="">
          </div>
          <div class="mb-3">
            <label for="content" class="col-form-label">Content:</label>
            <textarea class="form-control" style="height: 200px;" name="content" id="Ucontent" placeholder="내용을 입력하세요"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
        <button type="button" id="updateSns"  class="btn btn-primary">수정하기</button>
      </div>
    </div>
  </div>
</div>
<!-- 업데이트 Modal end -->


<script type="text/javascript" src="../js/app.js"></script>
</body>
</html>