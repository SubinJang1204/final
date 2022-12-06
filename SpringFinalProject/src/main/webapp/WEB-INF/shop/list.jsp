<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/css/shop.list.css" />
<div class="shop">
	<div class="shop-search">
		<div class="shop-search-box">
			<input type="text" id="search-word" value="${searchWord}" placeholder="브랜드명, 모델명, 모델번호 등" />
			<div class="shop-search-suggest">
				<div></div>
			</div>
			<script type="text/template" id="searchBlock">
				<a href="/shop/{shopnum}">
					<picture>
						<img src="{photo}" />
					</picture>
					<div class="shop-suggest-text">
						<p>{sangpum}</p>
						<p>{category} &gt; {sub_category}</p>
					</div>
				</button>
			</script>
		</div>
	</div>
	<div class="shop-category">
		<div class="shop-category-list">
			<div class="shop-category-item">
				<label>
					<input type="radio" name="filter" value="패딩" />
					<span>패딩</span>
				</label>
			</div>
			<div class="shop-category-item">
				<label>
					<input type="radio" name="filter" value="머플러" />
					<span>머플러</span>
				</label>
			</div>
			<div class="shop-category-item">
				<label>
					<input type="radio" name="filter" value="신발" />
					<span>신발</span>
				</label>
			</div>
			<div class="shop-category-item">
				<label>
					<input type="radio" name="filter" value="향수" />
					<span>향수</span>
				</label>
			</div>
			<div class="shop-category-item">
				<label>
					<input type="radio" name="filter" value="애플" />
					<span>애플</span>
				</label>
			</div>
		</div>
		<div class="shop-category-detail">
			<div class="shop-category-items">
				<button>
					<picture>
						<img src="/image/filter-apple.png" />
					</picture>
					<span>제목</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-muffler.png" />
					</picture>
					<span>상품</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-padding.png" />
					</picture>
					<span>어우러진</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-perfume.png" />
					</picture>
					<span>테스트</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-shoes.png" />
					</picture>
					<span>신박한</span>
				</button>
			</div>
			<div class="shop-category-items">
				<button>
					<picture>
						<img src="/image/filter-apple.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-muffler.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-padding.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-perfume.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-shoes.png" />
					</picture>
					<span>아이템1</span>
				</button>
			</div>
			<div class="shop-category-items">
				<button>
					<picture>
						<img src="/image/filter-apple.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-muffler.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-padding.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-perfume.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-shoes.png" />
					</picture>
					<span>아이템1</span>
				</button>
			</div>
			<div class="shop-category-items">
				<button>
					<picture>
						<img src="/image/filter-apple.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-muffler.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-padding.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-perfume.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-shoes.png" />
					</picture>
					<span>아이템1</span>
				</button>
			</div>
			<div class="shop-category-items">
				<button>
					<picture>
						<img src="/image/filter-apple.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-muffler.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-padding.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-perfume.png" />
					</picture>
					<span>아이템1</span>
				</button>
				<button>
					<picture>
						<img src="/image/filter-shoes.png" />
					</picture>
					<span>아이템1</span>
				</button>
			</div>
		</div>
	</div>
	<div class="shop-content">
		<c:set var="category" value="${fn:join(categoryList.toArray(), ', ')}" />
		<c:set var="brand" value="${fn:join(brandList.toArray(), ', ')}" />
		<c:set var="gender" value="${fn:join(genderList.toArray(), ', ')}" />
		<c:set var="price" value="" />
		<c:forEach var="item" items="${priceList}">
			<c:if test="${item eq 1}">
				<c:if test="${price != ''}">
					<c:set var="price" value="${price}, " />
				</c:if>
				<c:set var="price" value="${price}10만원 이상" />
			</c:if>
			<c:if test="${item eq 2}">
				<c:if test="${price != ''}">
					<c:set var="price" value="${price}, " />
				</c:if>
				<c:set var="price" value="${price}10만원 ~ 30만원" />
			</c:if>
			<c:if test="${item eq 3}">
				<c:if test="${price != ''}">
					<c:set var="price" value="${price}, " />
				</c:if>
				<c:set var="price" value="${price}30만원 ~ 50만원" />
			</c:if>
			<c:if test="${item eq 4}">
				<c:if test="${price != ''}">
					<c:set var="price" value="${price}, " />
				</c:if>
				<c:set var="price" value="${price}50만원 이상" />
			</c:if>
		</c:forEach>
		<div class="shop-filter">
			<div class="filter-status<c:if test="${category != '' || brand != '' || gender != '' || price != ''}"> filtered</c:if>">
				<p>필터</p>
				<button class="btn-clear">모두 삭제</button>
			</div>
			<div class="filter<c:if test="${category != ''}"> filtered</c:if>">
				<button class="btn-filter" type="button">
					<p class="filter-name">카테고리</p>
					<p class="filter-text">
						<c:choose>
							<c:when test="${category != ''}">${category}</c:when>
							<c:otherwise>모든 카테고리</c:otherwise>
						</c:choose>
					</p>
					<i class="bi bi-plus"></i>
					<i class="bi bi-dash"></i>
				</button>
				<div class="filter-list">
					<div class="filter-item">
						<label>
							<input type="checkbox" name="category" value="신발"<c:if test="${fn:contains(categoryList, '신발')}"> checked</c:if> />
							<span>신발</span>
						</label>
						<div class="filter-sub-list">
							<div class="filter-item">
								<label>
									<input type="checkbox" name="category" value="스니커즈"<c:if test="${fn:contains(categoryList, '스니커즈')}"> checked</c:if> />
									<span>스니커즈</span>
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" name="category" value="부츠"<c:if test="${fn:contains(categoryList, '부츠')}"> checked</c:if> />
									<span>부츠</span>
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" name="category" value="샌들"<c:if test="${fn:contains(categoryList, '샌들')}"> checked</c:if> />
									<span>샌들</span>
								</label>
							</div>
						</div>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" name="category" value="의류"<c:if test="${fn:contains(categoryList, '의류')}"> checked</c:if> />
							<span>의류</span>
						</label>
						<div class="filter-sub-list">
							<div class="filter-item">
								<label>
									<input type="checkbox" name="category" value="자켓"<c:if test="${fn:contains(categoryList, '자켓')}"> checked</c:if> />
									<span>자켓</span>
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" name="category" value="후드"<c:if test="${fn:contains(categoryList, '후드')}"> checked</c:if> />
									<span>후드</span>
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" name="category" value="셔츠"<c:if test="${fn:contains(categoryList, '셔츠')}"> checked</c:if> />
									<span>셔츠</span>
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" name="category" value="패딩"<c:if test="${fn:contains(categoryList, '패딩')}"> checked</c:if> />
									<span>패딩</span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="filter<c:if test="${brand != ''}"> filtered</c:if>">
				<button class="btn-filter" type="button">
					<p class="filter-name">브랜드</p>
					<p class="filter-text">
						<c:choose>
							<c:when test="${brand != ''}">${brand}</c:when>
							<c:otherwise>모든 브랜드</c:otherwise>
						</c:choose>
					</p>
					<i class="bi bi-plus"></i>
					<i class="bi bi-dash"></i>
				</button>
				<div class="filter-list">
					<div class="filter-item">
						<label>
							<input type="checkbox" name="brand" value="나이키"<c:if test="${fn:contains(brandList, '나이키')}"> checked</c:if> />
							<span>나이키</span>
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" name="brand" value="아디다스"<c:if test="${fn:contains(brandList, '아디다스')}"> checked</c:if> />
							<span>아디다스</span>
						</label>
					</div>
				</div>
			</div>
			<div class="filter<c:if test="${gender != ''}"> filtered</c:if>">
				<button class="btn-filter" type="button">
					<p class="filter-name">성별</p>
					<p class="filter-text">
						<c:choose>
							<c:when test="${gender != ''}">${gender}</c:when>
							<c:otherwise>모든 성별</c:otherwise>
						</c:choose>
					</p>
					<i class="bi bi-plus"></i>
					<i class="bi bi-dash"></i>
				</button>
				<div class="filter-list">
					<div class="filter-item">
						<label>
							<input type="checkbox" name="gender" value="남성"<c:if test="${fn:contains(genderList, '남성')}"> checked</c:if> />
							<span>남성</span>
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" name="gender" value="여성"<c:if test="${fn:contains(genderList, '여성')}"> checked</c:if> />
							<span>여성</span>
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" name="gender" value="키즈"<c:if test="${fn:contains(genderList, '키즈')}"> checked</c:if> />
							<span>키즈</span>
						</label>
					</div>
				</div>
			</div>
			<div class="filter<c:if test="${price != ''}"> filtered</c:if>">
				<button class="btn-filter" type="button">
					<p class="filter-name">가격</p>
					<p class="filter-text">
						<c:choose>
							<c:when test="${price != ''}">${price}</c:when>
							<c:otherwise>모든 가격</c:otherwise>
						</c:choose>
					</p>
					<i class="bi bi-plus"></i>
					<i class="bi bi-dash"></i>
				</button>
				<div class="filter-list">
					<div class="filter-item">
						<label>
							<input type="checkbox" name="price" value="1"<c:if test="${fn:contains(priceList, '1')}"> checked</c:if> />
							<span>10만원 이하</span>
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" name="price" value="2"<c:if test="${fn:contains(priceList, '2')}"> checked</c:if> />
							<span>10만원 ~ 30만원</span>
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" name="price" value="3"<c:if test="${fn:contains(priceList, '3')}"> checked</c:if> />
							<span>30만원 ~ 50만원</span>
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" name="price" value="4"<c:if test="${fn:contains(priceList, '4')}"> checked</c:if> />
							<span>50만원 이상</span>
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="shop-list-wrapper">
			<div class="shop-filter-sort">
				<button class="btn-sort">
					<span>
						<c:choose>
							<c:when test="${sort eq 1}">최신순</c:when>
							<c:when test="${sort eq 2}">후기 많은 순</c:when>
							<c:when test="${sort eq 3}">구매가 높은 순</c:when>
							<c:when test="${sort eq 4}">구매가 낮은 순</c:when>
							<c:otherwise>최신순</c:otherwise>
						</c:choose>
					</span>
					<i class="bi bi-arrow-down-up"></i>
				</button>
				<div class="sort-list">
					<button class="<c:if test="${sort eq 1}">active</c:if>" data-sort="1">
						<strong>최신순</strong>
						<p>최신 상품 순서대로 정렬합니다.</p>
					</button>
					<button class="<c:if test="${sort eq 2}">active</c:if>" data-sort="2">
						<strong>후기 많은 순</strong>
						<p>후기 작성이 많은 순서대로 정렬합니다.</p>
					</button>
					<button class="<c:if test="${sort eq 3}">active</c:if>" data-sort="3">
						<strong>구매가 높은 순</strong>
						<p>구매가가 높은 순서대로 정렬합니다.</p>
					</button>
					<button class="<c:if test="${sort eq 4}">active</c:if>" data-sort="4">
						<strong>구매가 낮은 순</strong>
						<p>구매가가 낮은 순서대로 정렬합니다.</p>
					</button>
				</div>
			</div>
			<div class="shop-filter-status">
				<c:forEach var="item" items="${categoryList}"><button>${item}</button></c:forEach>
				<c:forEach var="item" items="${brandList}"><button>${item}</button></c:forEach>
				<c:forEach var="item" items="${genderList}"><button>${item}</button></c:forEach>
				<c:forEach var="item" items="${priceList}">
					<c:if test="${item eq 1}"><button>10만원 이하</button></c:if>
					<c:if test="${item eq 2}"><button>10만원 ~ 30만원</button></c:if>
					<c:if test="${item eq 3}"><button>30만원 ~ 50만원</button></c:if>
					<c:if test="${item eq 4}"><button>50만원 이상</button></c:if>
				</c:forEach>
			</div>
			<input type="hidden" id="shopListTotalPage" value="${shopListTotalPage}" /> 
			<div class="shop-list">
				<c:forEach var="shop" items="${shopList}">
				<div class="shop-item">
					<a href="/shop/${shop.getShopnum()}">
						<div class="shop-image">
							<picture>
								<img src="/shopphoto/${shop.getPhoto()}" />
							</picture>
						</div>
						<div class="shop-text">
							<p class="shop-title">${shop.getSangpum()}</p>
							<p class="shop-categories">${shop.getCategory()} &gt; ${shop.getSub_category()}</p>
							<p class="shop-price">${shop.getPriceWithCommas()}원</p>
							<div class="shop-statistics">
								<p>
									<i class="bi bi-bookmark"></i>
									<span>${shop.getBookmarks()}</span>
								</p>
								<p>
									<i class="bi bi-chat-text"></i>
									<span>${shop.getReviews()}</span>
								</p>
							</div>
						</div>
					</a>
				</div>
				</c:forEach>
			</div>
			<script type="text/template" id="shop">
				<div class="shop-item">
					<a href="/shop/{shopnum}">
						<div class="shop-image">
							<picture>
								<img src="/shopphoto/{photo}" />
							</picture>
						</div>
						<div class="shop-text">
							<p class="shop-title">{sangpum}</p>
							<p class="shop-categories">{category} &gt; {sub_category}</p>
							<p class="shop-price">{priceWithCommas}원</p>
							<div class="shop-statistics">
								<p>
									<i class="bi bi-bookmark"></i>
									<span>{bookmarks}</span>
								</p>
								<p>
									<i class="bi bi-chat-text"></i>
									<span>{reviews}</span>
								</p>
							</div>
						</div>
					</a>
				</div>
			</script>
		</div>
	</div>
</div>
<script src="/js/shop.list.js"></script>