// Review Add
$(function() {
	const html = $(document.documentElement);
	
	const shopId = $('#shopId').val();
	let styleReviewListPage = parseInt($('#styleReviewListPage').val());
	let styleReviewListPageLength = parseInt($('#styleReviewListPageLength').val());
	let styleReviewListCount = parseInt($('#styleReviewListCount').val());
	
	const reviewList = $('.style-review-list');
	const reviewTemplate = $('#styleReview');
	const reviewForm = $('.style-review-form');
	const reviewButton = $('.btn-review');
	const reviewLearnMoreButton = $('.btn-learn-more');
	const reviewCancelButton = reviewForm.find('.btn-cancel');
	const reviewSubmitButton = reviewForm.find('.btn-submit');
	
	reviewButton.on('click', function() {
		reviewForm.addClass('view');
		
		const scrollTop = html.scrollTop();
		html.css({
			position: 'fixed',
			width: '100%',
			top: -scrollTop
		});
		html.data('scrollTop', scrollTop);
	});
	
	reviewLearnMoreButton.on('click', function() {
		$.ajax({
			method: 'GET',
			url: `/shop/${shopId}/style`,
			data: {
				page: styleReviewListPage + 1,
				length: styleReviewListPageLength,
			},
			dataType: 'json',
			success: (response) => {
				const { list, count, page, length } = response;
				
				styleReviewListPage = page;
				styleReviewListPageLength = length;
				styleReviewListCount = count;
				
				list.forEach((item) => {
					let templateHTML = reviewTemplate.html();
					
					for (let name in item) {
						templateHTML = templateHTML.replace(new RegExp('{' + name + '}', 'g'), item[name]);
					}
					
					const element = $(templateHTML);
					
					reviewList.append(element);
				});
				
				if ((styleReviewListPage + 1) * styleReviewListPageLength >= styleReviewListCount) {
					reviewLearnMoreButton.css({'display': 'none'});
				}
			},
			error: (reason) => {
				const data = reason.responseJSON;
				
				if (data.message) {
					alert(data.message);
				}
			},
		});
	});
	
	const reviewImage = reviewForm.find('#review-image');
	const reviewPicture = reviewForm.find('.input-image picture');
	const reviewContent = reviewForm.find('#review-content');
	
	reviewImage.on('input', function() {
		const image = reviewImage[0].files[0];
		const imageURL = URL.createObjectURL(image);
		
		const imageElement = new Image();
		imageElement.src = imageURL;
		
		reviewPicture.empty();
		reviewPicture.append(imageElement);
		
		reviewImage.data('image', image);
		reviewImage.val('');
		reviewImage.addClass('selected');
	});
	
	reviewCancelButton.on('click', function() {
		const scrollTop = html.data('scrollTop');
		html.css({
			position: '',
			width: '',
			top: '',
			scrollBehavior: 'auto',
		});
		html.scrollTop(scrollTop);
		
		setTimeout(() => {
			html.css({
				scrollBehavior: '',
			});
		}, 10);
		
		html.removeData('scrollTop');
		
		reviewForm.scrollTop(0);
		reviewForm.removeClass('view');
		
		reviewImage.removeData('image');
		reviewImage.val('');
		reviewImage.removeClass('selected');
		reviewPicture.empty();
		reviewContent.val('');
	});
	
	reviewSubmitButton.on('click', function() {
		if (reviewImage.data('image') === void 0) {
			alert('스타일 사진을 선택해주세요.');
			reviewImage.click();
			return;
		}
		
		if (reviewContent.val() === '') {
			alert('리뷰 내용을 입력해주세요.');
			reviewContent.focus();
			return;
		}
		
		const formData = new FormData;
		formData.append('image', reviewImage.data('image'));
		formData.append('content', reviewContent.val());
		
		$.ajax({
			method: 'POST',
			url: `/shop/${shopId}/style`,
			data: formData,
			dataType: 'json',
			processData: false,
			contentType: false,
			success: (response) => {
				if (response.message) {
					alert(response.message);
				}
				
				location.reload();
			},
			error: (reason) => {
				const data = reason.responseJSON;
				
				if (data.message) {
					alert(data.message);
				}
			},
		});
	});
});

// Review Detail
$(function() {
	const html = $(document.documentElement);

	const shopId = $('#shopId').val();
	const styleReviewList = $('.style-review-list');
	const styleReviewCommentList = $('.review-comment-list');
	const styleReviewCommentTemplate = $('#commentBlock');

	const reviewPopup = $('.style-review-detail');
	const cancelButton = reviewPopup.find('.btn-cancel');

	styleReviewList.on('click', '.style-review', function() {
		const reviewId = $(this).attr('data-id');

		loadStyleReview(reviewId);
	});

	const likeButton = $('.btn-like');
	const commentButton = $('.btn-comment');

	const reviewId = $('#review-id');
	const reviewProfile = $('#review-profile');
	const reviewName = $('#review-name');
	const reviewDate = $('#review-date');
	const reviewImage = $('#review-image');
	const reviewContent = $('#review-content');
	const reviewLikes = $('#review-likes');
	const reviewComments = $('#review-comments');
	const reviewComment = $('#review-comment');

	function loadStyleReview(reviewId) {
		$.ajax({
			method: 'GET',
			url: `/shop/${shopId}/style/${reviewId}`,
			dataType: 'json',
			success: (response) => {
				getStyleReview(response.review);
				getStyleReviewComment(response.comments);
			},
		});
	}

	function clearStyleReview() {
		reviewPopup.scrollTop(0);
		reviewPopup.removeClass('view');

		reviewId.val('');
		reviewProfile.attr('src', '');
		reviewName.text('');
		reviewDate.text('');
		reviewImage.attr('src', '');
		reviewContent.text('');
		reviewLikes.text(0);
		reviewComments.text(0);
		reviewComment.val('');
		
		likeButton.removeClass('active');

		styleReviewCommentList.empty();
	}

	function getStyleReview(review) {
		reviewId.val(review.num);
		reviewProfile.attr('src', review.user_photo);
		reviewName.text(review.user_id);
		reviewDate.text(review.releases);
		reviewImage.attr('src', review.style_photo);
		reviewContent.text(review.content);
		reviewLikes.text(review.likes);
		reviewComments.text(review.comments);

		if (review.isLike) {
			likeButton.addClass('active');
		} else {
			likeButton.removeClass('active');
		}

		reviewPopup.addClass('view');
		
		const scrollTop = html.scrollTop();
		html.css({
			position: 'fixed',
			width: '100%',
			top: -scrollTop
		});
		html.data('scrollTop', scrollTop);
	}

	function getStyleReviewComment(comments) {
		comments.forEach(function(comment) {
			appendStyleReviewComment(comment);
		});
	}

	function appendStyleReviewComment(comment) {
		let templateHTML = styleReviewCommentTemplate.html();
		
		for (let name in comment) {
			templateHTML = templateHTML.replace(new RegExp('{' + name + '}', 'g'), comment[name]);
		}
		
		const element = $(templateHTML);
		
		styleReviewCommentList.append(element);
	}

	cancelButton.on('click', function() {
		const scrollTop = html.data('scrollTop');
		html.css({
			position: '',
			width: '',
			top: '',
			scrollBehavior: 'auto',
		});
		html.scrollTop(scrollTop);
		
		setTimeout(() => {
			html.css({
				scrollBehavior: '',
			});
		}, 10);
		
		html.removeData('scrollTop');

		clearStyleReview();
	});

	likeButton.on('click', () => {
		$.ajax({
			method: 'POST',
			url: `/shop/${shopId}/style/${reviewId.val()}/like`,
			dataType: 'json',
			success: (response) => {
				if (response.status === 'like') {
					likeButton.addClass('active');
				} else {
					likeButton.removeClass('active');
				}

				reviewLikes.text(response.like);
			},
			error: (reason) => {
				location.href = '/login/main';
			}
		});
	});

	commentButton.on('click', () => {
		reviewComment.focus();
	});

	reviewComment.on('keydown', (event) => {
		if (event.keyCode === 13) {
			const id = reviewId.val();
			const comment = reviewComment.val();

			$.ajax({
				method: 'POST',
				url: `/shop/${shopId}/style/${id}/comment`,
				data: {
					comment,
				},
				dataType: 'json',
				success: (response) => {
					if (response.message) {
						alert(response.message);
					}
					
					clearStyleReview();
					loadStyleReview(id);
				},
				error: (reason) => {
					location.href = '/login/main';
				}
			});

			reviewComment.val('');
		}
	});
});

// Button Notice
$(function() {
	const notice = $('.shop-notice');

	notice.on('click', '.btn-notice', function() {
		$(this).parents('.shop-notice').toggleClass('active');
	});
});

// Like
$(function() {
	const like = $('.btn-interest');
	const likeText = $('#like');
	const shopId = $('#shopId').val();

	like.on('click', () => {
		$.ajax({
			method: 'POST',
			url: `/shop/${shopId}/like`,
			dataType: 'json',
			success: (response) => {
				if (response.status === 'like') {
					like.addClass('active');
				} else {
					like.removeClass('active');
				}

				likeText.text(response.like);
			},
			error: (reason) => {
				location.href = '/login/main';
			}
		});
	});
});
