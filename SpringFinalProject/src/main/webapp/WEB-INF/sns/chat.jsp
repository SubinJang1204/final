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
<style type="text/css">
* { font-family: 'Gowun Dodum', sans-serif;}

.chatcontainer{
	width: 500px;
	margin: auto;
	padding: 10px;
	border-radius: 7px;
	border: 1px solid lightgray;
}

.chating {
	background-color: white;
	padding: 10px;
	width: 100%;
	height: 500px;
	overflow: auto;
}

.chating .me {
	margin-bottom: 5px;
	display: flex;
	justify-content: flex-end;
}
.me span{
	background-color: gray;
	border-radius: 5px;
	padding: 10px;
	color: #F6F6F6;
	text-align: right; 
}

.chating .others {
	margin-bottom: 5px;
	display: flex;
	justify-content: flex-start;
}

.others span{
	background-color: #2545A7;
	border-radius: 5px;
	padding: 10px;
	color: white;
	text-align: right; 
}

#chatting {
	width: 330px;
	height: 50px;
	border-top-left-radius: 50px;
	border-bottom-left-radius: 50px;
}

#sendBtn{
	height: 50px;
	border-top-right-radius: 50px;
	border-bottom-right-radius: 50px;
}

.chattingCard{
	padding-bottom: 10px;
	border-bottom : 1px solid lightgray;
}
</style>
</head>
<body>
<div style="width: 100vw;">

<!-- 채팅 목록 -->
 	<div id="chatcontainer" class="chatcontainer shadow">
		<input type="hidden" id="sessionId" value="${sessionScope.myid }">
		<input type="hidden" id="roomNumber" value="${roomNumber}">
		
		<div class="w-100 d-flex rounded mb-3 chattingCard">
			<div>
				<img src="../resellphoto/${dto.r_photo}" class="rounded" style="max-width:130px">
			</div>
			<div class="p-2 w-100">
				<div class="d-flex">
					<h5 class="flex-fill w-100">${dto.r_subject } ∙  <fmt:formatNumber value="${dto.r_price }" pattern="###,###" />원</h5>
				</div>
				<p>seller ID : ${dto.seller} ∙ buyer ID : ${dto.buyer}</p>
				<button type='button' onclick="location.href='../resell/list'" class='btn btn-outline-dark btn-sm writeresell'>이전 페이지로 이동</button>
			</div>
		</div>
		
		<div id="chating" class="chating">
		
		<c:forEach items="${d}" var="d">
			<c:if test="${d.from_id == sessionScope.myid }">
				<div class='me'><span>${d.content }</span></div>
			</c:if>
			<c:if test="${d.from_id != sessionScope.myid }">
				${d.from_id}<div class='others'><span>${d.content }</span></div>
			</c:if>
		</c:forEach>
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName" value="${sessionScope.myid }"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg" class="d-flex">
			<input id="chatting" class="form-control w-100" placeholder="보내실 메시지를 입력하세요.">
			<button onclick="send()" id="sendBtn" class="btn btn-secondary"><i class="bi bi-chat-square-text" style="font-size:1.3em;"></i></button>
		</div>
	</div>

</div>

<script type="text/javascript">
var ws;
chatName();

function wsOpen(){
	//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
	ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
	wsEvt();
}
	
function wsEvt() {
	ws.onopen = function(data){
		//소켓이 열리면 동작
	}
	
	ws.onmessage = function(data) {
		//메시지를 받으면 동작
		var msg = data.data;
		if(msg != null && msg.trim() != ''){
			var d = JSON.parse(msg);
			if(d.type == "getId"){
				var si = d.sessionId != null ? d.sessionId : "";
				if(si != ''){
					$("#sessionId").val(si); 
				}
			}else if(d.type == "message"){
				if(d.sessionId == $("#sessionId").val()){
					$("#chating").append("<div class='me'><span>" + d.msg + "</span></div>");	
				}else{
					$("#chating").append(d.userName+"<div class='others'><span>" + d.msg + "</span></div>");
				}
					
			}else{
				console.warn("unknown type!")
			}
		}
	}

	document.addEventListener("keypress", function(e){
		if(e.keyCode == 13){ //enter press
			send();
		}
	});
}

function chatName(){
	var userName = $("#userName").val();
	if(userName == null || userName.trim() == ""){
		alert("사용자 이름을 입력해주세요.");
		$("#userName").focus();
	}else{
		wsOpen();
		$("#yourName").hide();
		$("#yourMsg").show();
	}
}

function send() {
	var option ={
		type: "message",
		roomNumber: $("#roomNumber").val(),
		sessionId : $("#sessionId").val(),
		userName : $("#userName").val(),
		msg : $("#chatting").val()
	}
	ws.send(JSON.stringify(option));
	
	// db 저장하기
	$.ajax({
        url: "/insertMessage",
        type: "POST",
        data: option,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8;"
    });
	
	$('#chatting').val("");
}
</script>
</body>
</html>