setInterval(function(){
			
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-60px"});
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-120px"});
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-180px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-240px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-300px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-360px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-420px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-480px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-540px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-600px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-660px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-720px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-780px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-840px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-900px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "-960px"})
    $('#temp>ul').delay(2500);
    $('#temp>ul').animate({marginTop: "0px"});
});

async function getData(){
	
	var now = new Date();
	
	var month = now.getMonth() + 1;
    var day = now.getDate();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    
    const date =  String(now.getFullYear()) + String(month) + String(day);
	
	var sky = '';
	var pty = '';
	
	var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
			'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
			'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=73&ny=134';
	var response = await fetch(url);
	var data = await response.json();
	
	console.log("data", data);
	
	var temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	
	$("#gw").html('[강원 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=60&ny=120';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#gg").html('[경기 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=91&ny=77';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#gn").html('[경남 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=89&ny=91';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#gb").html('[경북 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=58&ny=74';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#gj").html('[광주 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=89&ny=90';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#dg").html('[대구 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=67&ny=100';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#dj").html('[대전 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=98&ny=76';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#bs").html('[부산 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=60&ny=127';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#su").html('[서울 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=66&ny=103';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#sj").html('[세종 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=102&ny=84';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#us").html('[울산 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=55&ny=124';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#ic").html('[인천 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=51&ny=67';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#jn").html('[전남 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=63&ny=89';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#jb").html('[전북 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=52&ny=38';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#jj").html('[제주 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=68&ny=100';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#cn").html('[충남 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
	
	url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?' +
	'ServiceKey=5cS9RfPI1HpXTrjjzWC%2BrDeqBmUPKz9kSdJdXdfV7xCvwRIdrg%2FQdlgP7Oa16tAqlo%2FFlJ9YLAOdHjttW3PePQ%3D%3D&' +
	'numOfRows=12&pageNo=1&dataType=JSON&base_date=' + date + '&base_time=0500&nx=69&ny=107';
	response = await fetch(url);
	data = await response.json();
	temp = data.response.body.items.item.map((temp)=>[temp.fcstValue]);
	if(temp[5] == 1){
		
		sky = '<i class="bi bi-sun-fill"></i>'
		
	} else if(temp[5] == 3){
		
		sky = '<i class="bi bi-cloud-sun-fill"></i>';
		
	} else if(temp[5] == 4){
		
		sky = '<i class="bi bi-clouds-fill"></i>';
	}
	
	if(temp[6] == 0){
		
		pty = '';
		
	} else if(temp[6] == 1){
		
		pty = ', <i class="bi bi-cloud-rain-fill"></i>';
		
	} else if(temp[6] == 2){
		
		pty = ', <i class="bi bi-cloud-sleet-fill"></i>';
		
	} else if(temp[6] == 3){
		
		pty = ', <i class="bi bi-cloud-snow-fill"></i>';
		
	} else if(temp[6] == 4){
		
		pty = ', <i class="bi bi-cloud-rain-heavy-fill"></i>';
	}
	$("#cb").html('[충북 ' + sky + pty + '] 기온: ' + temp[0] + '\'C / 강수확률: ' + temp[7] + '%');
}

getData();