package boot.sist.service;

import java.util.List;

import boot.sist.dto.ShopDto;
import boot.sist.dto.ShopStyleReviewDto;
import boot.sist.entity.ShopStyleReviewEntity;
import boot.sist.entity.ShopStyleReviewListEntity;

public interface ShopServiceInter {
	public ShopDto getShop(String shopnum);
	
	public int getStyleReviewListCount(String shopNum);
	public List<ShopStyleReviewDto> getStyleReviewList(ShopStyleReviewListEntity styleReviewListEntity);
	public Boolean addStyleReview(ShopStyleReviewEntity styleReviewEntity);
}

