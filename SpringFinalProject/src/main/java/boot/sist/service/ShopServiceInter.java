package boot.sist.service;

import java.util.List;

import boot.sist.dto.ShopDto;
import boot.sist.dto.ShopListDto;
import boot.sist.dto.ShopListSearchDto;
import boot.sist.dto.ShopStyleReviewCommentDto;
import boot.sist.dto.ShopStyleReviewDto;
import boot.sist.entity.ShopEntity;
import boot.sist.entity.ShopLikeEntity;
import boot.sist.entity.ShopListEntity;
import boot.sist.entity.ShopStyleReviewCommentEntity;
import boot.sist.entity.ShopStyleReviewEntity;
import boot.sist.entity.ShopStyleReviewInsertEntity;
import boot.sist.entity.ShopStyleReviewListEntity;

public interface ShopServiceInter {
	public List<ShopListDto> getShopList(ShopListEntity shopListEntity);
	public int getShopListCount(ShopListEntity shopListEntity);
	public List<ShopListSearchDto> getShopListSearch(String searchWord);
	
	public int getShopLike(ShopLikeEntity shopLikeEntity);
	public int getShopLikeCount(String shopNum);
	public int setShopLike(ShopLikeEntity shopLikeEntity);
	public int unsetShopLike(ShopLikeEntity shopLikeEntity);
	
	public ShopDto getShop(ShopEntity shopEntity);
	
	public int getStyleReviewListCount(String shopNum);
	public List<ShopStyleReviewDto> getStyleReviewList(ShopStyleReviewListEntity styleReviewListEntity);
	public Boolean addStyleReview(ShopStyleReviewInsertEntity styleReviewInsertEntity);
	
	public ShopStyleReviewDto getStyleReview(ShopStyleReviewEntity styleReviewEntity);
	public List<ShopStyleReviewCommentDto> getStyleReviewComment(ShopStyleReviewEntity styleReviewEntity);
	public Boolean addStyleReviewComment(ShopStyleReviewCommentEntity styleReviewCommentEntity);
	public int getStyleReviewLike(ShopStyleReviewEntity styleReviewEntity);
	public int getStyleReviewLikeCount(String styleReviewId);
	public int setStyleReviewLike(ShopStyleReviewEntity styleReviewEntity);
	public int unsetStyleReviewLike(ShopStyleReviewEntity styleReviewEntity);
}
