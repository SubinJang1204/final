/**
 * 
 */
shoplist();

$("#shoplist").click(function(){
	$("#orderList").html('');
	shoplist();
})

$("#orderlist").click(function(){
	$("#result").html('');
	orderlist();
})

$("#delmyinfo").click(function(){
	var num = $("#num").val();
	
	var del = confirm("정말 탈퇴하시겠습니까?");
	
	if(del){
		$.ajax({
			type: "GET",
			url: "deletemyinfo",
			data: { "num": num },
			dataType: "html",
			success: function(data) {
				alert("회원 탈퇴가 성공적으로 진행되었습니다.");
				location.href = '/';
			}
		});		
	}

})

function shoplist(){
	var num = $("#num").val();
	//alert(num);
	
	$.ajax({
		type: "GET",
		url: "getshoplist",
		data: { "num": num },
		dataType: "JSON",
		success: function(data) {
				var s = "";
				if(data.length==0){
					s+="<h3 class='col-12 text-center'>관심 상품이 존재하지 않습니다.</h3>"					
				}
	
				$.each(data, function(idx, item) {
					let price = item.price;
					let result = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					s+="<div class='col'>"
					s+=`<a class='locationA' href='../shop/${item.shopnum}'>`;
					s+="	<div style='width:300px; height:300px; border-radius: 10px; background-color:lightgray;'>"
					s+="		<img src='../shopphoto/"+item.photo+"' style='width:100%; over-fit:cover;'>";
					s+="	</div>"
					s+="	<h5>"+item.sangpum+"<h5>";
					s+="	<p class='fs-5'>"+result+"원</p>";
					s+="</a>"
					s+="</div>"
					
				});
				$("#result").html(s);
		}
	});
}

function orderlist(){
	var num = $("#num").val();
	//alert(num);
	
	$.ajax({
		type: "GET",
		url: "getorderlist",
		data: { "num": num },
		dataType: "JSON",
		success: function(data) {
				var s = "";
				s+="<table class='table table-striped' style='background-color:white;'>";
				s+="<th>주문번호</th><th>상품명</th><th>상품 갯수</th><th>주문일</th>";

				if(data.length==0){
					s+="<tr><td colspan='5' class='text-center'>주문 내역이 존재하지 않습니다.</td></tr>"					
				}
				$.each(data, function(idx, item) {
					s+="<tr>"
					s+="<td>"+item.o_num+"</td>"
					s+="<td>"+item.sangpum+"</td>"
					s+="<td>"+item.cnt+"</td>"
					s+="<td>"+item.orderdate+"</td>"
					s+="</tr>"
					
				});
				s+="</table>";
				$("#orderList").html(s);
		}
	});
}