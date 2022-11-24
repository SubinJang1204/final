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