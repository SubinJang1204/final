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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
<script type="text/javascript">
	
	$(function(){
setInterval(function(){
			
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-60px"});
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-120px"});
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-180px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-240px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-300px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-360px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-420px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-480px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-540px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-600px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-660px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-720px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-780px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-840px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-900px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "-960px"})
		    $('#slide2>ul').delay(2500);
		    $('#slide2>ul').animate({marginTop: "0px"});
		});
	});
</script>
 
<style type="text/css">
*{
	font-family: 'Gowun Dodum', sans-serif;
	margin: 0;
    padding: 0;
    font-size: 1rem;
    text-decoration: none;
    list-style: none;
    color: black;
}

#slide2{
    height: 50px;
    overflow: hidden;
}
#slide2>ul{
    height: 50px;
}
#slide2>ul>li{
    height: 50px;
}
</style>

</head>
<body>
	<h3>날씨 API</h3>
	
	<div id="temp">
	</div>
	
		<div id="slide2">
			<ul>
				<li id="gw"></li>
				<li id="gg">경기도</li>
				<li id="gn">경상남도</li>
				<li id="gb">경상북도</li>
				<li id="gj">광주광역시</li>
				<li id="dg">대구광역시</li>
				<li id="dj">대전광역시</li>
				<li id="bs">부산광역시</li>
				<li id="su">서울특별시</li>
				<li id="sj">세종특별자치시</li>
				<li id="us">울산광역시</li>
				<li id="ic">인천광역시</li>
				<li id="jn">전라남도</li>
				<li id="jb">전라북도</li>
				<li id="jj">제주특별자치도</li>
				<li id="cn">충청남도</li>
				<li id="cb">충청북도</li>
			</ul>
		</div>
	
	<script type="text/javascript">
	
		async function getData(){
			
			const date = ${ date };
			
			var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
					'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
					'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=73&ny=134';
			var response = await fetch(url);
			var data = await response.json();
			var temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#gw").text('[강원] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=60&ny=120';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#gg").text('[경기] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=91&ny=77';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#gn").text('[경남] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=89&ny=91';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#gb").text('[경북] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=58&ny=74';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#gj").text('[광주] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=89&ny=90';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#dg").text('[대구] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=67&ny=100';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#dj").text('[대전] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=98&ny=76';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#bs").text('[부산] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=60&ny=127';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#su").text('[서울] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=66&ny=103';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#sj").text('[세종] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=102&ny=84';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#us").text('[울산] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=55&ny=124';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#ic").text('[인천] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=51&ny=67';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#jn").text('[전남] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=63&ny=89';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#jb").text('[전북] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=52&ny=38';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#jj").text('[제주] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=68&ny=100';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#cn").text('[충남] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
			
			url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=69&ny=107';
			response = await fetch(url);
			data = await response.json();
			temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
			$("#cb").text('[충북] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
		}
		
		getData();
	</script>
</body>
</html>