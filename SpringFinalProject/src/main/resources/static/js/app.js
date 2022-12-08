/**
 * 
 */

/* addSnsList(); */

var loading = false;    //중복실행여부 확인 변수
var currentPage = 1;   //불러올 페이지
next_load();

/*nextpageload function*/
function next_load() {
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
					s += "<div class='col p-4 fadein'><a num='"+item.num+"' class='cardDetail' href='#'>";
					s += "<div class='card shadow rounded'>";
					s += "	<img src='../snsphoto/" + item.photo + "' class='card-img-top' style='max-height: 200px;'>";
					s += "<div class='card-body' style='height: 200px;'>";
					s += "	<h2 class='card-title'>" + item.subject + "</h2>";
					s += "	<h4 class='card-text'>" + item.content + "<fmt:formatDate value='" + item.writeday + "' pattern='yyyy-MM-dd'/>";
					s += "	</h4>";
					s += "	<p class='text-muted cardday'>" + item.writeday + " · "+item.answer+"개의 댓글</p>";
					s += "</div>";
					s += "<div class='card-footer'>";
					s += "	<small class='text-muted'>by " + item.m_id + "</small><i class='bi bi-heart-fill'>&nbsp;" + item.likes + "</i>";
					s += "</div>";
					s += "</div></a>";
					s += "</div>";
				});
				$(".snsList").append(s);
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
			next_load();
			loading = true; //실행 불가능 상태로 변경
		}
		else            //실행 불가능 상태라면?
		{
			alert('다음페이지를 로딩중입니다.');
		}
	}
});
 
$("#writebtn").click(function(){
	var loginok=$("#thisLogin").val();
	
	if(loginok!='yes'){
		alert("로그인이 필요한 서비스입니다.");
		location.href="../login/main";
	}
	
	$("#writeModal").modal('show');
});

$("#writeSns").click(function(){
	var form = new FormData();
	form.append("photo", $("#upload")[0].files[0]); // 선택한 1개만 추가
	form.append("subject",$("#subject").val());
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
			$("#writeModal").modal('hide');
			$("#subject").val("");
			$("#content").val("");
			$("#photo").val("");
		}
	});
});

/** 디테일 페이지 모달 */
$(document).on("click",".cardDetail",function(){
	var num = $(this).attr("num");
	
	$.ajax({
		type:"get",
		data:{"num":num},
		dataType:"JSON",
		url:"getdetail",
		success:function(data){
			$("#detailModal").modal('show');
			$("#detailPhoto").attr('src', `../snsphoto/${data.photo}`);
			$("#detailId").text(data.m_id);
			$("#detailSubject").text(data.subject);
			$("#detailContent").text(data.content);
			$("#detailNum").val(data.num);
			if(data.m_photo!="no"){
				$("#M_photo").attr('src',`../photo/${data.m_photo}`);
			}
			/*$("#detailLikes").text(data.likes);*/
			addAnsList();
			
			var Nowid=$("#detailmyid").val();
			if(data.m_id == Nowid){
				var s="";
				s+="<button type='button' id='snsupdate' num='"+data.num+"' class='btn btn-outline-secondary me-2'>수정</button>";
      			s+="<button type='button' id='snsdel' num='"+data.num+"' class='btn btn-outline-danger'>삭제</button>";
      			$("#detailviewModal").html(s);
			}else{
				$("#detailviewModal").html("");
			}
		}
	});
});


/** 디테일 페이지 수정 모달 띄우기 */
$(document).on("click","#snsupdate",function(){
	var num = $(this).attr("num");
	console.log(num);
	$.ajax({
		type:"get",
		data:{"num":num},
		dataType:"JSON",
		url:"snsupdateform",
		success:function(data){
			$("#detailModal").modal('hide');
			$("#updateModal").modal('show');
			
			$("#Unum").val(data.num);
			$("#Usubject").val(data.subject);
			$("#Ucontent").text(data.content);
		}
	});
});

/** 디테일 페이지 수정 */
$("#updateSns").click(function(){
	var form = new FormData();
	
	form.append("photo", $("#Uupload")[0].files[0]); // 선택한 1개만 추가
	form.append("num", $("#Unum").val());
	form.append("subject",$("#Usubject").val());
	form.append("content", $("#Ucontent").val());
	
	// console.dir(form);
	
	$.ajax({
		type:"post",
		data:form,
		dataType:"text",
		url:"snsupdate",
		processData:false,
		contentType:false,
		success:function(){
			location.reload();
			$("#updateModal").modal('hide');
			$("#Usubject").val("");
			$("#Ucontent").val("");
		}
	});
});


/** 디테일 페이지 삭제 */
$(document).on("click","#snsdel",function(){
	var num = $(this).attr("num");
	console.log(num);
	
	$.ajax({
		type:"get",
		data:{"num":num},
		dataType:"html",
		url:"snsdelete",
		success:function(data){
			location.reload();
		}
	});
});


/* function addSnsList(){
	$.ajax({
		type: "get",
		dataType: "JSON",
		url: "getlist",
		success: function(data){
			var s = ""; 
			$.each(data, function(idx, item){
				s+="<div class='col p-4 fadein'><a class='cardDetail'>";
				s+="<div class='card shadow rounded'>";
				s+="	<img src='../snsphoto/"+item.photo+"' class='card-img-top' style='max-height: 200px;'>";
				s+="<div class='card-body' style='height: 200px;'>";
				s+="	<h2 class='card-title'>"+item.subject+"</h2>";
				s+="	<h4 class='card-text'>"+item.content+"<fmt:formatDate value='"+item.writeday+"' pattern='yyyy-MM-dd'/>";
				s+="	</h4>";		
				s+="	<p class='text-muted cardday'>"+item.writeday+" · 0개의 댓글</p>";	
				s+="</div>";
				s+="<div class='card-footer'>";
				s+="	<small class='text-muted'>by "+item.m_id+"</small><i class='bi bi-heart-fill'>&nbsp;"+item.likes+"</i>";
				s+="</div>";
				s+="</div></a>";
				s+="</div>";
			});
		$(".snsList").html(s);
		}
	});		
} */


/** 댓글 입력 */
$("#answerInsert").click(function(){
	var num = $("#detailNum").val();
	var content = $("#answerContent").val();
	
	$.ajax({
		type:"post",
		data:{"num":num,"content":content},
		dataType:"html",
		url:"answerinsert",
		success:function(){
			addAnsList();
			$("#answerContent").val("");
		}
	});
});

/**댓글 리스트 불러오기 */
function addAnsList(){
	var num = $("#detailNum").val();
	// console.log(num)
	var myid=$("#detailmyid").val();

	$.ajax({
		type:"get",
		data:{"num":num},
		dataType:"JSON",
		url:"answerlist",
		success:function(data){
			if (data) {
				var s = "";
				$.each(data, function(idx, item) {
					s += "<div style='border-bottom: 1px solid lightgray;'>";

					s += "<div class='d-flex align-items-center'>";
					s += "	<div class='flex-shrink-0'>";
					if(item.m_idphoto=="no"){
						s += "		<img id='M_photo' src='../snsphoto/user.png' style='max-width: 30px;'>";						
					}else{
						s +="<div style='width: 30px; height: 30px; border-radius:15px; overflow:hidden;'>"
						s += "		<img id='M_photo' src='../photo/"+item.m_idphoto+"' style='width: 100%; height: 100%; over-fit:cover;'>";
						s +="</div>"
					}
					s += "	</div>";
					s += "	<div class='flex-grow-1 ms-3'>";
					s += "		<div class='d-flex'>";
					s += "			<h4 class='fw-bold flex-grow-1'>" + item.m_id + "</h4>";
					if (myid == item.m_id) {
						s += "			<i class='bi bi-x-square fs-5' style='cursor:pointer;' id='answerdel' num='"+item.num+"'></i>"
					}
					s += "			&nbsp;&nbsp;<span class='text-mute fs-6 align-items-center'>" + item.writeday + "</span>"
					s += "		</div>";
					s += "	</div>";
					s += "</div>";

					s += "<p>" + item.content + "</p>";
					s += "</div>";
				});
				$(".answerList").html(s);
			} else {
				$(".answerList").html();
			}
		}
	});
}

/** 댓글 삭제 */
$(document).on("click","#answerdel",function(){
	var num = $(this).attr("num");
	
	$.ajax({
		type:"post",
		data:{"num":num},
		dataType:"html",
		url:"ansdelete",
		success:function(data){
			addAnsList();
		}
	});
});