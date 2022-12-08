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
	//버튼 클릭 시 사진 불러오기
	$("#btnphoto").click(function(){
		$("#myphoto").trigger("click");
	});
	//사진 불러오면 이미지 미리보기
	$("#myphoto").change(function(){
		if($(this)[0].files[0]){
			var reader=new FileReader();
			reader.onload=function(e){
				
				$("#showimg").attr('src',e.target.result);
			}
			reader.readAsDataURL($(this)[0].files[0]);
		}
	});
	//중복체크 버튼 클릭 시 아이디 체크
	$("#btnidcheck").click(function(){
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"idcheck",
			data:{"id":$("#id").val()},
			success:function(res){
				if(res.count==0){
					$("span.idsuccess").text("가능한 아이디입니다");
				}else{
					$("span.idsuccess").text("이미 존재하는 아이디입니다");
				}
			}
		});
	});
	//아이디 입력 시 idsucccess값 지워지게
	$("#id").keyup(function(){
		$("span.idsuccess").text("");
	});
	
	//2번째 비밀번호 입력 시 체크가 되도록
	$("#pass2").keyup(function(){
		var p1=$("#pass").val();
		var p2=$(this).val();
		
		if(p1==p2){
			$("span.passsuccess").text("사용가능한 비밀번호입니다");
		}else{
			$("span.passsuccess").text("비밀번호가 일치하지 않습니다");
		}
	});
	//아이디 입력 시 idsucccess값 지워지게
	$("#pass").keyup(function(){
		$("span.passsuccess").text("");
	});
});
//submit 전에 호출
function check(){

	//비밀번호
	if($("span.passsuccess").text()!='사용가능한 비밀번호입니다'){
		alert("비밀번호가 서로 다릅니다");
		return false;
	}
}

</script>
</head>
<c:set var="root" value="<%=request.getContextPath()%>" />
<body>
	<div style="margin-top:50px;margin-left:730px;">
	<caption><h3>Join</h3></caption>
	<form action="update" method="post" enctype="multipart/form-data" onsubmit="return check()">
	<input type="hidden" name="num" value="${dto.num }">
	<br>			
			        <div>
			        <center>
			        <img alt="" id="showimg" src="../image/noimage.png" style="">
			        <br><br>
				    <input type="file" name="myphoto" id="myphoto" style="display: none">
					<button type="button" class="btn btn-dark btn-sm" id="btnphoto" style="">이미지 등록</button>
					</center>
					</div><br>
					
					
					<div>
					 <label for="id" class="form-label">&nbsp;ID</label>
						<input type="text" name="id" class="form-control" style="width: 135px" value="${dto.id }">
					</div>
				
					<br>
				
					 <div>
					 <label for="pass" class="form-label">&nbsp;Password</label>
					<input type="password" style="width:120px" class="form-control" name="pass" 
					id="pass" placeholder="****" required="required">
					
					<input type="password" style="width:120px;position:relative;top:-38px;left:130px;" class="form-control" name="pass2" 
					id="pass2" placeholder="****" required="required">
					<span class="passsuccess" style="width:70px;color:black;font-weight:bold;position:relative;top:-70px;left:270px;"></span>
					
				</div>
				
			<div>
			<label for="name" class="form-label">&nbsp;Name</label>
			<input type="text" name="name" class="form-control" style="width:150px"
			 placeholder="Name" id="name" required="required" value="${dto.name }">
			</div><br>
			
			<div>
			<label for="email" class="form-label">&nbsp;Email</label>
			<input type="email" name="email" id="email" class="form-control" style="width:200px"
			 placeholder="Email" required="required" value="${dto.email }">
			</div><br>
			
			
			<div>
			<label for="hp" class="form-label">&nbsp;Hp</label>
			<input type="text" id="hp" name="hp" placeholder="Hp"
			class="form-control" style="width:220px" required="required" value="${dto.hp }">
			</div><br>
			
			<div>
			<label for="addr" class="form-label">&nbsp;Address</label>
			<input type="text" id="addr" name="addr" placeholder="주소입력"
			class="form-control" style="width:340px" required="required" value="${dto.addr }">
			</div><br>
			
			
			
			<button type="submit" class="btn btn-dark btn-sm">회원 정보 수정</button>
		
	</form>
</div>
</body>
</html>