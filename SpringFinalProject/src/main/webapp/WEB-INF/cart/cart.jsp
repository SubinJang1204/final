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
	margin: 0;
	padding:0;
	font-family: 'Gowun Dodum', sans-serif;
	
}
a{
	text-decoration: none;
}
/* 화면 전체 렙 */
.wrapper{
	width: 100%;
}
/* content 랩 */
.wrap{
	width : 1200px;
	margin-left: 350px;
	margin-top: 150px;
}

/* 홈페이지 메인 제품 목록  */
.content_area{
	width: 100%;
    min-height: 1000px;
}
	 table{
	 	border-collapse: collapse;
	 	width: 100%;
	 }
	 .table_text_align_center{
		text-align: center;
	 }	
	 caption{
	    visibility: hidden;
	    width: 0;
	    height: 0;
	    font-size: 0;
	    line-height: 0;
	    overflow: hidden; 
	 }	  

	 .content_subject{
		height: 10px;
	    line-height: 30px;
	    background-color: #000000;
	    margin-bottom: 40px;
	 }
		 .content_subjectspan{ 
		    padding-left: 30 px;
		    color: black;
		    font-size: 50px;
		    font-weight: bolder; 
		 }
	 
	 .content_totalCount_section{
	 	margin-bottom: 12px;
	 }
	 .content_btn_section{
	 	margin-top: 20px;
	 	text-align: right;
	 }
	 	.content_btn_section a{
	    color: #fefeff;
	    background-color: #000000;
	    min-width: 125px;
	    padding: 17px 25px;
	    display: inline-block;
	    height: 70px;
	    font-size: 23px;
	    font-weight: bold;
	    text-align: center;
	    margin-right: 14px;
	    line-height: 39px; 	
	 	}
	 

	 .subject_table{
		font-size: 16px;
	    line-height: 40px;
	    width: 100%;
	    text-align: center; 	
	 }

		 th{
		text-align: center;
	    color: #333;
	    border-bottom: 1px solid #e7e7e7;
	    border-top: 1px solid #B2B2B2;
	    background: #FAFAFA;
	    padding: 2px 0;	 
		 }
		.td_width_1{
			width: 5%;
		}	 	 	 
		.td_width_2{
			width: 10%;
		}	 	 
		.td_width_3{
			width: 25%;
		}	 
		.td_width_4{
			width: 15%;
		}	
		.cart_table{
			font-size: 14px;
			line-height: 20px;
		}  
			.cart_table tr{
				height: 110px;
			}
			.price_td{
				padding-left: 5px;
			}
				.red_color{
					color : red;
				}
				.green_color{
					color : green;
				}
			.cart_table td{
				border-bottom: 1px solid #e7e7e7;
			}
			.quantity_div{
				position: relative;
			    width: 80px;
			    height: 25px;
			    text-align: left;
			    margin: 5px auto;		
			}
			.quantity_input{
				position: absolute;
				width: 27px;
			    height: 24px;
			    text-align: center;
			    border: 1px solid #c6c6c6;
			    border-right: 0px;
			    line-height: 19px;
			    font-size: 12px;
			    color: #4c4848;	
			    left: 20px;
			}
			.quantity_btn{
				position: absolute;
				left:50px;
			    border: 1px solid #aaa;
			    color: #3a60df;
			    width: 14px;
			    height: 14px;
			    padding: 0px;
			    background-color: #fff;
			    font-weight: bold;
			    font-size: 7px;
			    line-height: 6px;
			    vertical-align: middle;
			}
			.plus_btn{
				top: 0;
				right: 0
			}
			.minus_btn{
				bottom: 0;
				right: 0
			}		
			.quantity_modify_btn{
				border: 1px solid #d0d0d0;
			 	padding: 3px 6px 2px;
			    height: 20px;
			    line-height: 13px;
			    background-color: #fff;
			    text-align: center;
			    width: 40px;
			}
			.table_text_align_center{
				text-align: center;
			}
			.delete_btn{
				width: 60px;		
			}
		
	.content_total_section{
		    background-color: #FAFAFA;
		    border-bottom: 1px solid #B2B2B2;
		    border-top: 1px solid #e7e7e7;
		    
	}		
		.total_wrap{
			width: 80%;
		    margin: auto;
		    padding: 10px 0 10px 0;	
		}
			.total_wrap td{
				width : 50%;
			}
			.finalTotalPrice_span{
				color: #854A72;
				font-size: 17px;
				font-weight: bold;
			}
			.boundary_div{
				font-size: 0;
			    border: 1px dotted #d1c7c7;
			    margin: 5px 0 5px 0;		
			}
			
		.input_size_20{
			width:20px;
			height:20px;
		}
		.all_check_input{
			margin: 18px 0 18px 18px;
		}
		.all_chcek_span{
			padding-left: 8px;
	    	font-size: 20px;
	    	font-weight: bold;		
		}			

		/* 이미지 */
		.image_wrap{
			width: 100%;
			height: 100%;
		}
		.image_wrap img{
		    max-width: 85%;
		    height: auto;
		    display: block;		
		}

/* float 속성 해제 */
.clearfix{
	clear: both;
}
</style>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="content_area">
			
			<div class="content_subject"><b><br>스토어>마이페이지>장바구니</b></div><br><span class="content_subjectspan">${sessionScope.myid }님의 장바구니</span>
			
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>				
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명  [색상/사이즈]</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_5">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${list}" var="l" varStatus="status">
							<tr>
								<td  class="td_width_1 cart_info_td">
									<input  type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<input type="hidden" class="individual_bookPrice_input" value="${l.price}">
									<input type="hidden" class="individual_bookCount_input" value="${l.cnt}">
									<input type="hidden" class="individual_totalPrice_input" value="${l.price * l.cnt}">
									<input type="hidden" id="p_num" class="individual_bookId_input" value="${l.p_num}">								
								</td>
								<td class="td_width_2">
									<div class="image_wrap" data-bookid="${l.price}" data-path="${l.price}" data-uuid="${l.price}" data-filename="${l.price}">
									</div>								
								</td>
								<td class="td_width_3">${l.sangpum}<br>[${l.color }/${l.sangpumsize }]</td>
								<td class="td_width_4 price_td">
									판매가 : <span class="red_color"><fmt:formatNumber value="${l.price}" pattern="#,### 원" /></span><br>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${l.cnt}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									
										<a class="quantity_modify_btn" data-cartId="${l.c_num}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${l.price * l.cnt}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
									<button class="delete_btn btn btn-danger" data-cartid="${l.c_num}">삭제</button>
								</td>
							</tr>							
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span"></span> 원
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price"></span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>권</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span"></span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a class="order_btn">주문하기</a>
			</div>
			
			<!-- 수량 조정 form -->
			<form action="update" method="post" class="quantity_update_form">
				<input type="hidden" name=c_num class="update_cartId">
				<input type="hidden" name="cnt" class="update_bookCount">
			</form>	
			
			<!-- 삭제 form -->
			<form action="delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="c_num" class="delete_cartId">
			</form>		
			<!-- 주문 form -->
			<form action="/order/${sessionScope.myid}" method="get" class="order_form">
			</form>
			</div>
		</div>
	
</div>	<!-- class="wrapper" -->

<script>
$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();	
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
	
		const bobj = $(obj);
		
		if(bobj.data("bookid")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/img/goodsNoImage.png');
		}
		
	});
	
	
});	
/* 체크여부에따른 종합 정보 변화 */
$(".individual_cart_checkbox").on("change", function(){
	/* 총 주문 정보 세팅(배송비, 총 가격, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));
});
/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){
	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	} else{
		$(".individual_cart_checkbox").attr("checked", false);
	}
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));	
	
});
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_bookCount_input").val());
			// 총 종류
			totalKind += 1;
		}
	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 총 종류
	$(".totalKind_span").text(totalKind);
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}
/* 수량버튼 */
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
	$(this).parent("div").find("input").val(--quantity);		
	}
});
/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function(){
	let cartId = $(this).data("cartid");
	let bookCount = $(this).parent("td").find("input").val();
	$(".update_cartId").val(cartId);
	$(".update_bookCount").val(bookCount);
	$(".quantity_update_form").submit();
	
});
/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	e.preventDefault(); //클릭 했을 시 잠시 기능을 멈추고 아래 작업을 먼저 수행
	const cartId = $(this).data("cartid");
	$(".delete_cartId").val(cartId);
	$(".quantity_delete_form").submit();
});
	
/* 주문 페이지 이동 */	
$(".order_btn").on("click", function(){
	
	let form_contents ='';
	let orderNumber = 0;
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			
			let p_num = $(element).find(".individual_bookId_input").val();
			let cnt = $(element).find(".individual_bookCount_input").val();
			
			let bookId_input = "<input name='orders[" + orderNumber + "].p_num' type='hidden' value='" + p_num + "'>";
			form_contents += bookId_input;
			
			let bookCount_input = "<input name='orders[" + orderNumber + "].cnt' type='hidden' value='" + cnt + "'>";
			form_contents += bookCount_input;
			
			orderNumber += 1;
			
		}
	});	
	$(".order_form").html(form_contents);
	$(".order_form").submit();
	
});
	
function doAction(){
	let msgEle= document.getElementByID(".order_form");
	if(msgEle.value.length == 0){
		alert("장바구니에 물건을 담아주세요");
		return false;
	}
	
	return true;
}

</script>


</body>
</html>