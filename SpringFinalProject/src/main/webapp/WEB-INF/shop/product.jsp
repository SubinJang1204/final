<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/shop.product.css" />
<div class="shop">
	<div class="shop-info">
		<div class="shop-image">
			<picture>
				<img src="" />
			</picture>
		</div>
		<div class="shop-detail">
			<div class="shop-data">
				<input type="hidden" id="shopId" value="${shop.getShopnum()}" />
				<p class="shop-title">${shop.getSangpum()}</p>
				<p class="shop-category">${shop.getCategory()} &gt; ${shop.getSub_category()}</p>
				<div class="shop-price">
					<p>판매가</p>
					<p><strong>${shop.getPriceWithCommas()}</strong>원</p>
				</div>
			</div>
			<div class="shop-action">
				<button class="btn-cart" type="button">장바구니 등록</button>
				<button class="btn-buy" type="button">바로 구매</button>
				<button class="btn-interest" type="button"><i class="bi bi-bookmark"></i><i class="bi bi-bookmark-fill"></i> 관심상품 ${shop.getLikes()}</button>
			</div>
			<div class="shop-content">
				<p class="shop-labeltext">상품 정보</p>
				<div class="shop-info-content">
					<p>
						<span>모델번호</span>
						<span>${shop.getModel()}</span>
					</p>
					<p>
						<span>출시일</span>
						<span>${shop.getReleases()}</span>
					</p>
					<p>
						<span>컬러</span>
						<span>${shop.getColor()}</span>
					</p>
					<p>
						<span>발매가</span>
						<span>${shop.getPriceWithCommas()}원</span>
					</p>
				</div>
				<div class="shop-delivery-info">
					<p class="shop-sublabeltext">배송 정보</p>
					<div class="shop-delivery-list">
						<div class="shop-delivery">
							<picture>
								<img src="" />
							</picture>
							<div class="shop-delivery-text">
								<p><strong>일반배송</strong> 3,000원</p>
								<p>검수 후 배송 ・ 5-7일 내 도착 예정</p>
							</div>
						</div>
						<div class="shop-delivery">
							<picture>
								<img src="" />
							</picture>
							<div class="shop-delivery-text">
								<p><strong>빠른배송</strong> 5,000원</p>
								<p>지금 결제시 <mark>내일 11/21(월) 도착 예정</mark></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="shop-content">
				<p class="shop-labeltext">구매 전 꼭 확인해주세요!</p>
				<div class="shop-notice-content">
					<div class="shop-notice">
						<button class="btn-notice" type="button">
							배송 기간 안내
							<i class="bi bi-caret-down"></i>
							<i class="bi bi-caret-up"></i>
						</button>
						<div class="shop-notice-detail"><b>{프로젝트명}은 최대한 빠르게 모든 상품을 배송하기 위해 노력하고 있습니다. 배송 시간은 판매자가 검수를 위하여 상품을 검수센터로 보내는 속도에 따라 차이가 있습니다.</b>

[빠른배송 구매]

- 판매자가 보관 신청한 상품 중 검수에 합격한 상품을 {프로젝트명}의 전용 창고에 보관합니다. 보관 상품에 한하여 바로 구매와 95점 구매가 가능합니다.
- 오늘(오후 11:59까지) 결제하면 내일 바로 출고되어 빠른 배송이 가능합니다. (연휴 및 공휴일, 천재지변, 택배사 사유 등 예외적으로 출고일이 변경될 수 있습니다. 빠른배송 안내

[일반 구매]

- 거래가 체결된 시점부터 48시간(일요일•공휴일 제외) 내에 판매자가 상품을 발송해야 하며, 통상적으로 발송 후 1-2일 내에 {프로젝트명} 검수센터에 도착합니다.
- 검수센터에 도착한 상품은 입고 완료 후 3영업일 이내에 검수를 진행합니다. 검수 합격시 배송을 준비합니다.
* 상품 종류 및 상태에 따라 검수 소요 시간은 상이할 수 있으며, 구매의사 확인에 해당할 경우 구매자와 상담 진행으로 인해 지연이 발생할 수 있습니다.
- 검수센터 출고는 매 영업일에 진행하고 있으며, 출고 마감시간은 오후 5시입니다. 출고 마감시간 이후 검수 완료건은 운송장번호는 입력되지만 다음 영업일에 출고됩니다.</div>
					</div>
					<div class="shop-notice">
						<button class="btn-notice" type="button">
							검수 안내
							<i class="bi bi-caret-down"></i>
							<i class="bi bi-caret-up"></i>
						</button>
						<div class="shop-notice-detail"><b>판매자의 상품이 검수센터에 도착하면 전담 검수팀이 철저한 분석과 검사로 정가품 확인을 진행합니다.</b>

- 검수센터에서는 정가품 여부를 확인하기 위하여, 지속적으로 데이터를 쌓고 분석하여 기록하고 있습니다.
- 업계 전문가로 구성된 검수팀은 박스와 상품의 라벨에서 바느질, 접착, 소재 등 모든 것을 검수합니다.

<b>검수 결과는 불합격•검수 보류•합격의 세가지 상태로 결과가 변경됩니다.</b>

* 검수 합격: {프로젝트명} 검수택(Tag)이 부착되어 배송을 준비함
* 검수 보류: 앱에서 사진으로 상품의 상태 확인 및 구매 여부를 선택. (24시간 이후 자동 검수 합격)
* 검수 불합격: 즉시 거래가 취소되고 구매하신 금액을 환불 처리함.(환불 수단은 결제 수단과 동일)</div>
					</div>
					<div class="shop-notice">
						<button class="btn-notice" type="button">
							구매 환불/취소/교환 안내
							<i class="bi bi-caret-down"></i>
							<i class="bi bi-caret-up"></i>
						</button>
						<div class="shop-notice-detail"><b>{프로젝트명}은 익명 거래를 기반으로 판매자가 판매하는 상품을 구매자가 실시간으로 구매하여 거래를 체결합니다.</b>

- 단순 변심이나 실수에 의한 취소/교환/반품이 불가능합니다. 상품을 원하지 않으시는 경우 언제든지 {프로젝트명}에서 재판매를 하실 수 있습니다.
- 상품 수령 후, 이상이 있는 경우 {프로젝트명} 고객센터로 문의해주시기 바랍니다.</div>
					</div>
					<div class="shop-notice-info">
						<div class="shop-notice-item">
							<img src="" />
							<div class="shop-notice-text">
								<p><strong>100% 정품 보증</strong></p>
								<p>검수한 상품이 정품이 아닐 경우, 구매가의 3배를 보상합니다.</p>
							</div>
						</div>
						<div class="shop-notice-item">
							<img src="" />
							<div class="shop-notice-text">
								<p><strong>엄격한 다중 검수</strong></p>
								<p>모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의 체계적인 시스템을 거쳐 검수를 진행합니다.</p>
							</div>
						</div>
						<div class="shop-notice-item">
							<img src="" />
							<div class="shop-notice-text">
								<p><strong>정품 인증 패키지</strong></p>
								<p>검수에 합격한 경우에 한하여 정품 인증 패키지가 포함된 상품이 배송됩니다.</p>
							</div>
						</div>
					</div>
					<div class="shop-notice-disclaimer">
						<p>{프로젝트명}은 통신판매 중개자로서 통신판매의 당사자가 아닙니다. 본 상품은 개별판매자가 등록한 상품으로 상품, 상품정보, 거래에 관한 의무와 책임은 각 판매자에게 있습니다. 단, 거래과정에서 검수하고 보증하는 내용에 대한 책임은 {프로젝트명}에 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="shop-section">
		<p class="shop-label">스타일 리뷰 (${styleReviewListCount})</p>
	<%
		String memberId = (String) session.getAttribute("myid");
		
		if (!"".equals(memberId) && memberId != null) {
	%>
		<button class="btn-review">리뷰 등록</button>
	<%
		}
	%>
		<input type="hidden" id="styleReviewListPage" value="${styleReviewListPage}" />
		<input type="hidden" id="styleReviewListPageLength" value="${styleReviewListPageLength}" />
		<input type="hidden" id="styleReviewListCount" value="${styleReviewListCount}" />
		<div class="style-review-list">
		<c:forEach var="styleReview" items="${styleReviewList}">
			<div class="style-review">
				<div class="review-image">
					<picture>
						<img src="${styleReview.getStylePhoto()}" />
					</picture>
				</div>
				<div class="review-text">
					<div class="user-profile">
						<img src="${styleReview.getUser_photo()}" />
						<span>${styleReview.getUser_id()}</span>
					</div>
					<p class="review">${styleReview.getContent()}</p>
					<div class="statistics">
						<p>
							<i class="bi bi-emoji-smile"></i>
							<span>${styleReview.getLikes()}</span>
						</p>
						<p>
							<i class="bi bi-chat"></i>
							<span>${styleReview.getComments()}</span>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
		</div>
	<c:if test="${(styleReviewListPage + 1) * styleReviewListPageLength < styleReviewListCount}">
		<div class="style-review-action">
			<button class="btn-learn-more">더보기</button>
		</div>
		<script type="text/template" id="styleReview">
			<div class="style-review">
				<div class="review-image">
					<picture>
						<img src="{stylePhoto}" />
					</picture>
				</div>
				<div class="review-text">
					<div class="user-profile">
						<img src="{user_photo}" />
						<span>{user_id}</span>
					</div>
					<p class="review">{content}</p>
					<div class="statistics">
						<p>
							<i class="bi bi-emoji-smile"></i>
							<span>{likes}</span>
						</p>
						<p>
							<i class="bi bi-chat"></i>
							<span>{comments}</span>
						</p>
					</div>
				</div>
			</div>
		</script>
	</c:if>
		<div class="style-review-form">
			<div class="insert-form">
				<strong>스타일 후기 등록</strong>
				<div class="input-image">
					<label>
						스타일 사진
						<input type="file" id="review-image" />
						<figure>
							<picture></picture>
							<figcaption>클릭하여 사진을 업로드해주세요.</figcaption>
						</figure>
					</label>
				</div>
				<div class="input-item">
					<label>
						리뷰 내용
						<textarea id="review-content"></textarea>
					</label>
				</div>
				<div class="action-group">
					<button class="btn-cancel">취소</button>
					<button class="btn-submit">후기 등록</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/js/shop.detail.js"></script>