/**
 * 
 */
 
var loading = false;    //중복실행여부 확인 변수
var currentPage = 1;   //불러올 페이지
next_ResellLoad();

/*nextpageload function*/
function next_ResellLoad() {
	var myid=$("#thisId").val();
	$.ajax({
		type: "GET",
		url: "getlist",
		data: { "currentPage": currentPage },
		dataType: "JSON",
		success: function(data) {
			if (data) {
				// console.log(currentPage + ' page load');
				/* 이미지 동적 추가 */
				var s = "";
				$.each(data, function(idx, item) {
					let price = item.price;
					let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				
					s += "<div class='card ps-0 m-3 shadow-sm resellcard fadein' style='max-width: 1000px;'>";
					s += "	<a num='"+item.num+"' class='cardDetail' href='#'>";
					s += "	<div class='row g-0'>";
					s += "	<div class='col-md-4'>";
					s += "		<img src='../resellphoto/" + item.photo + "' class='card-img-top'>";
					s += "	</div>";
					s += "	<div class='col-md-8'>";
					s += "	<div class='card-header fs-4' style='width: 105%; height: 50px;'>Selling</div>";
					s += " 	<div class='card-body'>";
					s += "	<div class='d-flex'>";
					s += "		<h1 class='card-title'>" + item.subject + "</h1><h3 class='ms-auto mt-auto price'>" + result + "원</h3>";
					s += "	</div>";
					s += "  <h5 class='card-text mt-4'>" + item.content + "</h5>";
					s += "	<div class='d-flex cardday'>";
					s += "		<p class='text-muted fs-5'>by " + item.m_id + " · " + item.writeday + "</p>";
					if(item.m_id != myid){
					s += "		<button type='button' class='btn btn-outline-dark ms-auto mb-3' data-bs-toggle='offcanvas'' data-bs-target='#offcanvasRight' aria-controls='offcanvasRight'" 
					+ "style='width: 100px;' num='"+item.num+"' seller='"+item.m_id+"' id='chatbtn' >채팅하기</button>";
					}
					s += "	</div></div></div></div></a></div>";
				});
				$(".resellList").append(s);
				currentPage++; //페이지 증가
				loading = false;    //실행 가능 상태로 변경
			}
			else {
				alert('failed');
			}
		},
		error: function(xhr, status, error) {
			alert(error);
		}
	});
}


$(window).scroll(function(e) {
	const { clientHeight, scrollTop, scrollHeight } = e.target.scrollingElement;
	if (clientHeight + scrollTop >= scrollHeight) {
		if (!loading)    //실행 가능 상태라면?
		{
			next_ResellLoad();
			loading = true; //실행 불가능 상태로 변경
		}
		else            //실행 불가능 상태라면?
		{
			alert('다음페이지를 로딩중입니다.');
		}
	}
});
 
 
/** 새 판매글 입력 */ 
 $("#writeresell").click(function(){
	var loginok=$("#thisLogin").val();
	
	if(loginok!='yes'){
		alert("로그인이 필요한 서비스입니다.");
		location.href="../login/main";
	}
	
	$("#writeResellModal").modal('show');
});

$("#writeResell").click(function(){
	var form = new FormData();
	form.append("photo", $("#upload")[0].files[0]); // 선택한 1개만 추가
	form.append("subject",$("#subject").val());
	form.append("price",$("#price").val());
	form.append("content", $("#content").val());
	
	// console.dir(form);
	
	$.ajax({
		type:"post",
		data:form,
		dataType:"text",
		url:"insert",
		processData:false,
		contentType:false,
		success:function(){
			location.reload();
			$("#writeResellModal").modal('hide');
			$("#subject").val("");
			$("#price").val("");
			$("#content").val("");
			$("#photo").val("");
		}
	});
});

/** 채팅 만들기 */
/** 채팅방 유효성 검사 */
$(document).on("click","#chatbtn",function(){
	var num = $(this).attr("num");
	var seller = $(this).attr("seller");
	var buyer = $("#thisId").val();
	
	var loginok=$("#thisLogin").val();
	if(loginok!='yes'){
		alert("로그인이 필요한 서비스입니다.");
		location.href="../login/main";
		return
	}
	
	$.ajax({
		type:"get",
		data:{"num":num,"myid":buyer},
		dataType:"JSON",
		url:"searchchat",
		success:function(data){
			if(data){
				alert("이미 존재하는 채팅방입니다")
			}else{
				$.ajax({
					type: "post",
					data: { "num": num, "buyer": buyer, "seller": seller },
					dataType: "JSON",
					url: "insertchat",
					success: function(data) {
						chatList();

						var msg = { "roomName": data.roomName, "roomNumber": data.roomNumber };
						console.log(msg);
						commonAjax('/createRoom', msg, 'post', function(result) {
							createChatingRoom(result);
							goRoom(data.roomNumber);
						});

					}
				}); 
			}
		}
	}); 
});

chatList();
/** 채팅방 불러오기 */
function chatList(){
	var myid=$("#thisId").val();
	var loginok=$("#thisLogin").val();
	
	$.ajax({
		type: "get",
		dataType: "JSON",
		data:{"myid":myid},
		url: "getchat",
		success: function(data){
			var s = ""; 
			
			if(loginok!='yes'){
				s+="<h4 class='text-center shadow p-3'>로그인 후<br> 채팅방을 개설할 수 있습니다</h4>";
			}else{
				$.each(data, function(idx, item){
					let price = item.r_price;
					let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					
					s+="<div class='d-flex rounded shadow-sm mb-3 chattingCard'>";
					s+="	<div style='width:150px; max-height:130px;'>";
					s+="		<img src='../resellphoto/"+item.r_photo+"' class='rounded chattingCardimg'>"
					s+="	</div>";
					s+="	<div class='p-2 w-100'>";
					s+="		<div class='d-flex'>"
					s+="			<h5 class='flex-fill w-100'>"+item.r_subject+" ∙ " + result + "원</h5>";
					s+="			<a id='chatdel' num='"+item.num+"' style='cursor:pointer;'><i class='bi bi-x-circle' style='font-size:1.3em;'></i></a>";
					s+="		</div>";
					s+="		<p>seller ID : "+item.seller+" ∙ buyer ID : "+item.buyer+"</p>";				
					s+="		<button type='button' onclick='goRoom(\"" + item.num + "\", \"" + item.r_subject + "\")' num='"+item.num+"' class='btn btn-outline-dark btn-sm position-relative writeresell'>채팅 방 바로가기";
					if(item.unreadMessage>0){
						s+=" <span class='position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger'>";
						s+=item.unreadMessage+"+";
						s+="</span>"			
					}
					s+="	</button></div>";
					s+="</div>";
				});
			}
		$(".chatList").html(s);
		}
	});	
}

/** 채팅방 삭제하기 */
$(document).on("click","#chatdel",function(){
	var num=$(this).attr('num');
	$.ajax({
		type: "get",
		dataType: "html",
		data:{"num": num},
		url: "deletechat",
		success: function(){
			chatList();
		}
	});	
});


/** $(document).on("click","#gochat",function(){
	var num=$(this).attr('num');
	alert(num);
	$.ajax({
		type: "get",
		dataType: "html",
		data:{"roomNumber": num},
		url: "gochat",
		success: function(){
		}
	});	
}); */

/** 채팅방 */
var ws;
/**makingroom();*/

window.onload = function() {
	getRoom();
	createRoom();
}

/**처음 시작할 때 채팅방 리스트 만들기 */

/**function makingroom(){
	commonAjax('/makingRoom', "", 'post', function(result) {
		createChatingRoom(result);
	});
	
	makingroom = function(){} // 함수 초기화 하기 , 한번만 실행 되도록
}*/

function getRoom() {
	commonAjax('/getRoom', "", 'post', function(result) {
		createChatingRoom(result);
	});
}

function createRoom() {
	$("#createRoom").click(function() {
		var msg = { roomName: $('#roomName').val() };

		commonAjax('/createRoom', msg, 'post', function(result) {
			createChatingRoom(result);
		});

		$("#roomName").val("");
	});
}

function goRoom(number, name) {
	location.href = "/moveChating?roomName=" + name + "&" + "roomNumber=" + number;
}

/**function goChat(number) {
	location.href = "/moveChating?roomNumber=" + number;
}*/

function createChatingRoom(res) {
	if (res != null) {
		var tag = "<tr><th class='num'>순서</th><th class='room'>방 이름</th><th class='go'></th></tr>";
		res.forEach(function(d, idx) {
			var rn = d.roomName.trim();
			var roomNumber = d.roomNumber;
			tag += "<tr>" +
				"<td class='num'>" + (idx + 1) + "</td>" +
				"<td class='room'>" + rn + "</td>" +
				"<td class='go'><button type='button' onclick='goRoom(\"" + roomNumber + "\", \"" + rn + "\")'>참여</button></td>" +
				"</tr>";
		});
		$("#roomList").empty().append(tag);
	}
}

function commonAjax(url, parameter, type, calbak, contentType) {
	$.ajax({
		url: url,
		data: parameter,
		type: type,
		contentType: contentType != null ? contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success: function(res) {
			calbak(res);
		},
		error: function(err) {
			console.log('error');
			calbak(err);
		}
	});
}