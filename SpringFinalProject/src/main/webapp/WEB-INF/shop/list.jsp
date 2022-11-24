<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<link rel="stylesheet" href="/css/shop.list.css" />
<div class="shop">
	<div class="shop-search">
		<div class="shop-search-box">
			<input type="text" name="keyword" value="" placeholder="브랜드명, 모델명, 모델번호 등" />
			<div class="shop-search-suggest">
				<div>
					<div class="shop-suggest-item">
						<picture>
							<img src="" />
						</picture>
						<div class="shop-suggest-text">
							<p>상품명</p>
							<p>설명 조금</p>
						</div>
					</div>
					<div class="shop-suggest-item">
						<picture>
							<img src="" />
						</picture>
						<div class="shop-suggest-text">
							<p>상품명</p>
							<p>설명 조금</p>
						</div>
					</div>
					<div class="shop-suggest-item">
						<picture>
							<img src="" />
						</picture>
						<div class="shop-suggest-text">
							<p>상품명</p>
							<p>설명 조금</p>
						</div>
					</div>
					<div class="shop-suggest-item">
						<picture>
							<img src="" />
						</picture>
						<div class="shop-suggest-text">
							<p>상품명</p>
							<p>설명 조금</p>
						</div>
					</div>
					<div class="shop-suggest-item">
						<picture>
							<img src="" />
						</picture>
						<div class="shop-suggest-text">
							<p>상품명</p>
							<p>설명 조금</p>
						</div>
					</div>
					<div class="shop-suggest-item">
						<picture>
							<img src="" />
						</picture>
						<div class="shop-suggest-text">
							<p>상품명</p>
							<p>설명 조금</p>
						</div>
					</div>
					<div class="shop-suggest-item">
						<picture>
							<img src="" />
						</picture>
						<div class="shop-suggest-text">
							<p>상품명</p>
							<p>설명 조금</p>
						</div>
					</div>
					<div class="shop-suggest-item">
						<picture>
							<img src="" />
						</picture>
						<div class="shop-suggest-text">
							<p>상품명</p>
							<p>설명 조금</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="shop-category">
		<div class="shop-category-item">
			<label>
				<input type="checkbox" name="category" value="패딩" />
				<picture>
					<img src="" />
				</picture>
				<span>패딩</span>
			</label>
		</div>
		<div class="shop-category-item">
			<label>
				<input type="checkbox" name="category" value="머플러" />
				<picture>
					<img src="" />
				</picture>
				<span>머플러</span>
			</label>
		</div>
		<div class="shop-category-item">
			<label>
				<input type="checkbox" name="category" value="신발" />
				<picture>
					<img src="" />
				</picture>
				<span>신발</span>
			</label>
		</div>
		<div class="shop-category-item">
			<label>
				<input type="checkbox" name="category" value="향수" />
				<picture>
					<img src="" />
				</picture>
				<span>향수</span>
			</label>
		</div>
		<div class="shop-category-item">
			<label>
				<input type="checkbox" name="category" value="애플" />
				<picture>
					<img src="" />
				</picture>
				<span>애플</span>
			</label>
		</div>
	</div>
	<div class="shop-content">
		<div class="shop-filter">
			<p class="shop-label">필터</p>
			<div class="filter">
				<button class="btn-filter" type="button">
					<p class="filter-name">카테고리</p>
					<p class="filter-text">모든 카테고리</p>
					<i class="bi bi-plus"></i>
					<i class="bi bi-dash"></i>
				</button>
				<div class="filter-list">
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							신발
						</label>
						<div class="filter-sub-list">
							<div class="filter-item">
								<label>
									<input type="checkbox" />
									스니커즈
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" />
									부츠
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" />
									샌들
								</label>
							</div>
						</div>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							의류
						</label>
						<div class="filter-sub-list">
							<div class="filter-item">
								<label>
									<input type="checkbox" />
									자켓
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" />
									후드
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" />
									셔츠
								</label>
							</div>
							<div class="filter-item">
								<label>
									<input type="checkbox" />
									패딩
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="filter">
				<button class="btn-filter" type="button">
					<p class="filter-name">브랜드</p>
					<p class="filter-text">모든 브랜드</p>
					<i class="bi bi-plus"></i>
					<i class="bi bi-dash"></i>
				</button>
				<div class="filter-list">
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							나이키
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							아디다스
						</label>
					</div>
				</div>
			</div>
			<div class="filter">
				<button class="btn-filter" type="button">
					<p class="filter-name">성별</p>
					<p class="filter-text">모든 성별</p>
					<i class="bi bi-plus"></i>
					<i class="bi bi-dash"></i>
				</button>
				<div class="filter-list">
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							남성
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							여성
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							키즈
						</label>
					</div>
				</div>
			</div>
			<div class="filter">
				<button class="btn-filter" type="button">
					<p class="filter-name">가격</p>
					<p class="filter-text">모든 가격</p>
					<i class="bi bi-plus"></i>
					<i class="bi bi-dash"></i>
				</button>
				<div class="filter-list">
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							10만원 이하
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							10만원 ~ 30만원
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							30만원 ~ 50만원
						</label>
					</div>
					<div class="filter-item">
						<label>
							<input type="checkbox" />
							50만원 이상
						</label>
					</div>
				</div>
			</div>
		</div>
		<div class="shop-list-wrapper">
			<div class="shop-list">
				<div class="shop-item">
					<div class="shop-image">
						<picture>
							<img src="" />
						</picture>
					</div>
					<div class="shop-text">
						<p class="shop-title">상품 정보 이름</p>
						<p class="shop-category">상의 &gt; 셔츠</p>
						<p class="shop-price">원</p>
						<div class="shop-statistics">
							<p>
								<i class="bi bi-bookmark"></i>
								<span>37</span>
							</p>
							<p>
								<i class="bi bi-chat-text"></i>
								<span>14</span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>