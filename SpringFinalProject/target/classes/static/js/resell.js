/**
 * 
 */
 
var loading = false;    //중복실행여부 확인 변수
var currentPage = 1;   //불러올 페이지
next_ResellLoad();

/*nextpageload function*/
function next_ResellLoad() {
	$.ajax({
		type: "GET",
		url: "getlist",
		data: { "currentPage": currentPage },
		dataType: "JSON",
		success: function(data) {
			if (data) {
				console.log(currentPage + ' page load');
				/* 이미지 동적 추가 */
				var s = "";
				$.each(data, function(idx, item) {
					s += "<div class='card ps-0 m-3 shadow resellcard' style='max-width: 1000px;'>";
					s += "	<a num='"+item.num+"' class='cardDetail' href='#'>";
					s += "	<div class='row g-0'>";
					s += "	<div class='col-md-4'>";
					s += "		<img src='../resellphoto/" + item.photo + "' class='card-img-top'>";
					s += "	</div>";
					s += "	<div class='col-md-8'>";
					s += "	<div class='card-header fs-4' style='width: 105%; height: 50px;'>Selling</div>";
					s += " 	<div class='card-body'>";
					s += "	<div class='d-flex'>";
					s += "		<h1 class='card-title'>" + item.subject + "</h1><h3 class='ms-auto mt-auto price'>" + item.price + "</h3>";
					s += "	</div>";
					s += "  <h5 class='card-text mt-4'>" + item.content + "</h5>";
					s += "	<div class='d-flex cardday'>";
					s += "		<p class='text-muted fs-5'>by " + item.m_id + " · " + item.writeday + "</p>";
					s += "		<button type='button' class='btn btn-outline-dark ms-auto mb-3' data-bs-toggle='offcanvas'' data-bs-target='#offcanvasRight' aria-controls='offcanvasRight' style='width: 100px;'>채팅하기</button>";
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