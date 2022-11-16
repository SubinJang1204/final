<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
</style>
</head>
<%
String saveok=(String)session.getAttribute("saveok");
String myid="";
if(saveok!= null){
	myid=(String)session.getAttribute("myid");
}
%>
<body>

<div style="margin-top:220px;margin-left:730px;">
<caption><h3>Login</h3></caption><br>
<form action="loginprocess" method="post" class="row g-3">
<div class="col-md-6">
<label for="inputEmail4" class="form-label">&nbsp;ID</label>

<input type="text" name="id" autofocus="autofocus" value="${sessionScope.saveok==null?"":sessionScope.myid }" required="required" placeholder="-" class="form-control" id="inputEmail4">
<br>

<div class="form-check form-switch">
  <input type="checkbox" class="form-check-input" role="switch" id="flexSwitchCheckChecked" checked name="cbsave" ${sessionScope.saveok==null?"":"checked" }>
  <label class="form-check-label" for="flexSwitchCheckChecked">&nbsp;아이디 저장</label>
</div>


</div>

 <div class="col-md-6">
 <label for="inputPassword4" class="form-label">&nbsp;Password</label>

<input type="password" name="pass" autofocus="autofocus" required="required" id="inputPassword4" placeholder="****" class="form-control" style="width:150px">
<br><br><br></div>

<button type="submit" class="btn btn-dark" style="width:120px;">로그인</button>&nbsp;&nbsp;
<button type="submit" class="btn btn-dark" style="width:120px;" onclick="location.href='${root}/member/form'">회원가입</button>
</form>
</div>

</body>
</html>