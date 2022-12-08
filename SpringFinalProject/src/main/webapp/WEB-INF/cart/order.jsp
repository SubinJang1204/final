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
 
  <!-- 다음주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<style type="text/css">
*{
	margin: 0;
	padding:0;
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


/* 제품 목록 네비 */
.navi_bar_area{
	width: 100%;
    height: 70px;
    background-color: #7696fd;
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
	 
/* content_main */
 .content_main{
 	margin-top: 40px;
    min-height: 700px;
    padding-right: 350px;
    position: relative;
 }
 table{
 	border-collapse: collapse;
 }
 
 /* 사용자 정보  */
 .memberInfo_table{
    width: 100%;
    border-spacing: 0;
    border-top: 2px solid #363636;
    border-bottom: 1px solid #b6b6b6; 
 }
 .member_info_div td{
 	padding : 12px;
 	text-align: left;
 }

/* 이름 입력칸 */
.addressee_input{
	height: 35px;
}
/* 주소 입력칸 */
.address1_input{
	height: 35px;
}
/* 주소 입력칸 */
.address2_input{
	margin-top: 10px;
	width: 400px;
	height: 35px;
}


 /* 사용자 주소 정보 */
 .addressInfo_div{
 	margin-top: 30px;
 }
 .addressInfo_input_div_wrap{
 	border-bottom: 1px solid #f3f3f3;
 	height: 225px;
 }
.address_btn {
    background-color: #555;
    color: white;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 50%;
}

.address_btn:hover{
	background-color: #777;
}
.addressInfo_button_div::after{
	content:'';
	display:block;
	clear:both;
}
		.addressInfo_input_div{
			padding:12px;
			text-align: left;
			display: none;
			line-height: 40px;
		}
		.addressInfo_input_div th{
			border-color: transparent;
		    background-color: transparent;		
		}
		.addressInfo_input_div th{
			padding : 12px 5px 12px 20px;
			vertical-align: top;
		}
		.addressInfo_input_div td{
			padding : 8px 12px;
		}		
		.addressInfo_input_div_2 input{
			padding: 6px 5px;
		}
.address_search_btn{
    vertical-align: middle;
    display: inline-block;
    border: 1px solid #aaa;
    width: 90px;
    text-align: center;
    height: 30px;
    line-height: 30px;
    color: #555;
    cursor: pointer;
}
/* 주문상품 정보 */
.orderGoods_div{
	margin-top:30px;
}
.goods_kind_div{
	font-size: 25px;
    line-height: 35px;
    font-weight: bold;
}
.goods_subject_table{
	font-size: 14px;
    line-height: 20px;
    width: 100%;
    text-align: center; 
}
.goods_subject_table th{
		text-align: center;
	    color: #333;
	    border-bottom: 1px solid #e7e7e7;
	    border-top: 1px solid #B2B2B2;
	    background: #FAFAFA;
	    padding: 2px 0;	 	
}
.goods_table{
	font-size: 14px;
	line-height: 20px;
	border-bottom: 1px solid #e7e7e7;
}

.goods_table tr{
height: 110px;
}
.goods_table_price_td{
	text-align: center;
}


/* 포인트 영역 */
.point_div{
	margin-top: 30px;
	margin-bottom: 50px;	
}
.point_div_subject{
	font-size: 25px;
    line-height: 35px;
    font-weight: bold;
}
.point_table{
	border-color: #ddd;
    border-spacing: 0;
    border-top: 1px solid #363636;
    border-bottom: 1px solid #b6b6b6;
}
.point_table th{
	border-color: #ddd;
    vertical-align: top;
    text-align: center;
    color: #333333;
    background: #fbfbfb;
    text-indent: 0;
    padding: 12px 5px 12px 20px;
    font-size: 15px;
    line-height: 20px;
}
.point_table_td{
	border-color: #ddd;
    text-align: left;
    color: #333333;
    padding: 8px 15px;
}
.order_point_input_btn{
	vertical-align: middle;
    display: inline-block;
    border: 1px solid #aaa;
    width: 60px;
    text-align: center;
    height: 20px;
    line-height: 20px;
    color: #555;
    cursor: pointer;
    font-size: 12px;
}

/* 주문 종합 정보 */
.total_info_div{
	position:absolute;
	top: 0;
	right : 0;
	width : 300px;
	border : 1px solid #333;
	border-top-width:2px;	
	
}
.total_info_price_div{
	width: 90%;
    margin: auto;
	position: relative;
}
.total_info_div ul{
	list-style: none;
}
.total_info_div li{
	text-align: right;
	margin-top:10px;
}
.price_span_label{
	float: left;
}
.price_total_li{
	border-top: 1px solid #ddd;
	padding-top: 20px;
}
.strong_red{
	color: red;
}
.total_price_red{
	font-size: 25px;
}
.total_price_label{
	margin-top: 5px;
}
.point_li{
    padding: 15px;
    border-top: 1px solid #ddd;
    margin: 10px -15px 0;
}
.total_info_btn_div{
	border-top: 1px solid #ddd;
    text-align: center;
    padding: 15px 20px;
}
.order_btn{
    display: inline-block;
    font-size: 21px;
    line-height: 50px;
    width: 200px;
    height: 50px;
    background-color: #365fdd;
    color: #fff;
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

</style>
</head>
<body>
	
<div class="wrapper">
	<div class="wrap">
		<div class="content_area">
			<div class="content_subject"><b><br>스토어>마이페이지>장바구니>결제</b></div><br><span class="content_subjectspan">${sessionScope.myid }님의 결제창</span>
			
			<div class="content_main">
				<!-- 회원 정보 -->
				<div class="member_info_div">
					<table class="table_text_align_center memberInfo_table">
						<tbody>
							<tr>
								<th style="width: 25%;">주문자</th>
								<td style="width: *">${memberInfo.name} | ${memberInfo.email}</td>
							</tr>
						</tbody>
					</table>
				</div>				
				
				<!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #3c3838;">사용자 정보 주소록</button>
						<button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${memberInfo.name}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${memberInfo.addr}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input" value="${memberInfo.name}" type="hidden">
											<input class="address1_input" type="hidden" value="${memberInfo.addr}"><br>
											<input class="address2_input" placeholder="상세주소를 입력해주세요">

										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2">
							<table>
								<colgroup>	
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input class="addressee_input">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input class="selectAddress" value="F" type="hidden">
											<input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
											<input class="address2_input" readonly="readonly"><br>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>				
				
				<!-- 상품 정보 -->
				<div class="orderGoods_div">
					<!-- 상품 종류 -->
					<div class="goods_kind_div">
						주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
					</div>
					<!-- 상품 테이블 -->
					<table class="goods_subject_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>
						<tbody>
							<tr>
								<th> </th>
								<th>상품 정보</th>
								<th>판매가</th>
							</tr>
						</tbody>
					</table>
					<table class="goods_table">
						<colgroup>
							<col width="15%">
							<col width="45%">
							<col width="40%">
						</colgroup>					
						<tbody>
							<c:forEach items="${orderList}" var="ol" varStatus="status" >
								<tr>
								<td align="center">${status.index+1}</td>
								<td align="center">
									${ol.sangpum }/	${list[status.index].color} / ${list[status.index].sangpumsize}						 
									</td> 
									<td class="goods_table_price_td">
										<fmt:formatNumber value="${ol.price}" pattern="#,### 원" /> | 수량 ${ol.cnt}개
										<br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
										<input type="hidden" class="individual_bookPrice_input" value="${ol.price}">
										<input type="hidden" class="individual_bookCount_input" value="${ol.cnt}">
										<input type="hidden" class="individual_totalPrice_input" value="${ol.price * ol.cnt}">
										<input type="hidden" class="individual_bookId_input" value="${ol.p_num}">
									</td>
								</tr>							
							</c:forEach>

						</tbody>
					</table>
				</div>		
						
				<!-- 주문 종합 정보 -->
				<div class="total_info_div">
					<!-- 가격 종합 정보 -->
					<div class="total_info_price_div">
						<ul>
							<li>
								<span class="price_span_label">상품 금액 </span>
								<span class="totalPrice_span"></span>원
							</li>
							<li>
								<span class="price_span_label">배송비</span>
								<span class="delivery_price_span"></span>원
							</li>
									
							<li class="price_total_li">
								<strong class="price_span_label total_price_label">최종 결제 금액</strong>
								<strong class="strong_red">
									<span class="total_price_red finalTotalPrice_span">
										
									</span>원
								</strong>
							</li>
						</ul>
					</div>
					<!-- 버튼 영역 -->
					<div class="total_info_btn_div">
						<a class="order_btn">결제하기</a>
					</div>
				</div>				
				
			</div>			

			<!-- 주문 요청 form -->
			<form class="order_form" action="order" method="post">
				<!-- 주소록 & 받는이-->
				<input name="name" type="hidden">
				<input name="m_num" value="${m_num }" type="hidden">
				<input name="addr1" type="hidden">
				<input name="addr2" type="hidden">
				<!-- 상품 정보 -->
			</form>
			
		</div>
		
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->

<script type="text/javascript">

$(document).ready(function(){
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();
	
});

/* 주소입력란 버튼 동작(숨김, 등장) */
function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#555');
		/* 지정 색상 변경 */
			$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
	/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
		/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");		
		
}

/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address2_input").attr("readonly", false);
                $(".address2_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}
	
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	
	$(".goods_table_price_td").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_bookCount_input").val());
		// 총 종류
		totalKind += 1;
	
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
		
	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".goods_kind_div_count").text(totalCount);
	// 총 종류
	$(".goods_kind_div_kind").text(totalKind);
	// 배송비
	$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
	
}

/* 주문 요청 */
$(".order_btn").on("click", function(){
	/* 주소 정보 & 받는이*/
	$(".addressInfo_input_div").each(function(i, obj){
		if($(obj).find(".selectAddress").val() === 'T'){
			$("input[name='name']").val($(obj).find(".addressee_input").val());
			$("input[name='addr1']").val($(obj).find(".address1_input").val());
			$("input[name='addr2']").val($(obj).find(".address2_input").val());

		}
	});	
	

	/* 상품정보 */
	let form_contents = ''; 
	$(".goods_table_price_td").each(function(index, element){
		let p_num = $(element).find(".individual_bookId_input").val();
		let cnt = $(element).find(".individual_bookCount_input").val();
		let bookId_input = "<input name='orders[" + index + "].p_num' type='hidden' value='" + p_num + "'>";
		form_contents += bookId_input;
		let bookCount_input = "<input name='orders[" + index + "].cnt' type='hidden' value='" + cnt + "'>";
		form_contents += bookCount_input;
	});	
	$(".order_form").append(form_contents);	
	
	/* 서버 전송 */
	$(".order_form").submit();	
	
});	
</script>

</body>
</html>