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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
 
<style type="text/css">
	*{
		font-family: 'Gowun Dodum', sans-serif;
	}
	
	#showimg{
		width:150px;
		height:150px;
		border-radius:100%;
	}
</style>
<script type="text/javascript">
$(function(){

	$("#btnphoto").click(function(){
		
		$("#myphoto").trigger("click");
	});
	
	
	$("#myphoto").change(function(){
		
		if($(this)[0].files[0]){
			
			var reader=new FileReader();
			
			reader.onload=function(e){
				
				$("#showimg").attr('src',e.target.result);
			}
			reader.readAsDataURL($(this)[0].files[0]);
		}
	});
});

</script>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
	<div style="margin-top:50px; margin-left:650px;">
	<h3 align="center">상품 등록</h3>
	<form action=shopinsert method="post" enctype="multipart/form-data" onsubmit="return check()">
	
        <div align="center">
	        <img alt="" id="showimg" src="../image/noimage.png" style="">
	        <br><br>
		    <input type="file" name="upload" id="myphoto" style="display: none">
			<button type="button" class="btn btn-dark btn-sm" id="btnphoto">이미지 등록</button>
		</div>
		
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;product name</label>
			<input type="text" placeholder="제품명" name="sangpum" class="form-control" style="width: 400px" required="required">
		</div>
	
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;category</label>
			<input type="text" placeholder="분류" name="category" class="form-control" style="width: 400px" required="required">
		</div>
		
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;sub_category</label>
			<input type="text" placeholder="세부 분류" name="sub_category" class="form-control" style="width: 400px" required="required">
		</div>
		
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;detail_photo</label>
			<input type="file" name="detail_upload" class="form-control" style="width: 400px" multiple="multiple">
		</div>
		
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;price</label>
			<input type="text" placeholder="가격(숫자)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="price" class="form-control" style="width: 400px" required="required">
		</div>
				
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;size</label>
			<input type="text" placeholder="사이즈(숫자)" name="sangpumsize" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" style="width: 400px" required="required">
		</div>
		
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;model</label>
			<input type="text" placeholder="모델번호(숫자)" name="model" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" class="form-control" style="width: 400px" required="required">
		</div>
		
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;color</label>
			<input type="color" name="color" class="form-control" style="width: 400px" required="required">
		</div>
		
		<br>
		
		<div>
			<label for="id" class="form-label">&nbsp;temp</label>
			<input type="text" placeholder="추천 기온(숫자)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="temp" class="form-control" style="width: 400px" required="required">
		</div>
			
		<br>
			
		<button type="submit" class="btn btn-outline-dark" style="margin-left: 100px;">상품 등록</button>
		<button type="submit" class="btn btn-outline-secondary" onclick="history.back()">뒤로 가기</button>
		<br><br>
	</form>
</div>
</body>
</html>