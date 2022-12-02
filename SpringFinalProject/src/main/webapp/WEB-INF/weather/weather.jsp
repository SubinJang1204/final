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
	<h3>날씨 API</h3>
	
	<div id="temp">
		
	</div>
	<script type="text/javascript">
	
		async function getData(){
			
			const url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&numOfRows=10&pageNo=1&dataType=JSON&base_date=20221130&base_time=0500&nx=63&ny=111';
			const response = await fetch(url);
			const data = await response.json();
			console.log("data", data);
			const temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			const temp1 = temp(0);
			const temp2 = temp(7);
			console.log(temp);
		}
		
		getData();
	</script>
</body>
</html>