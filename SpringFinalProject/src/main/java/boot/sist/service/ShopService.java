package boot.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.ShopDto;
import boot.sist.dto.ShopListDto;
import boot.sist.dto.ShopListSearchDto;
import boot.sist.dto.ShopStyleReviewCommentDto;
import boot.sist.dto.ShopStyleReviewDto;
import boot.sist.entity.ShopEntity;
import boot.sist.entity.ShopLikeEntity;
import boot.sist.entity.ShopListEntity;
import boot.sist.entity.ShopStyleReviewCommentDeleteEntity;
import boot.sist.entity.ShopStyleReviewCommentEntity;
import boot.sist.entity.ShopStyleReviewEntity;
import boot.sist.entity.ShopStyleReviewInsertEntity;
import boot.sist.entity.ShopStyleReviewListEntity;
import boot.sist.mapper.ShopMapperInter;

@Service
public class ShopService implements ShopServiceInter {
	
	@Autowired
	ShopMapperInter shopMapper;

	@Override
	public List<ShopListDto> getShopList(ShopListEntity shopListEntity) {
		return shopMapper.getShopList(shopListEntity);
	}
	
	@Override
	public int getShopListCount(ShopListEntity shopListEntity) {
		return shopMapper.getShopListCount(shopListEntity);
	}
	
	@Override
	public List<ShopListSearchDto> getShopListSearch(String searchWord) {
		return shopMapper.getShopListSearch(searchWord);
	}

	@Override
	public int getShopLike(ShopLikeEntity shopLikeEntity) {
		return shopMapper.getShopLike(shopLikeEntity);
	}
	
	@Override
	public int getShopLikeCount(String shopNum) {
		return shopMapper.getShopLikeCount(shopNum);
	}

	@Override
	public int setShopLike(ShopLikeEntity shopLikeEntity) {
		return shopMapper.setShopLike(shopLikeEntity);
	}

	@Override
	public int unsetShopLike(ShopLikeEntity shopLikeEntity) {
		return shopMapper.unsetShopLike(shopLikeEntity);
	}

	@Override
	public ShopDto getShop(ShopEntity shopEntity) {
		return shopMapper.getShop(shopEntity);
	}
	
	@Override
	public int getStyleReviewListCount(String shopNum) {
		return shopMapper.getStyleReviewListCount(shopNum);
	}

	@Override
	public List<ShopStyleReviewDto> getStyleReviewList(ShopStyleReviewListEntity styleReviewListEntity) {
		return shopMapper.getStyleReviewList(styleReviewListEntity);
	}

	@Override
	public Boolean addStyleReview(ShopStyleReviewInsertEntity styleReviewInsertEntity) {
		return shopMapper.addStyleReview(styleReviewInsertEntity);
	}
	
	@Override
	public ShopStyleReviewDto getStyleReview(ShopStyleReviewEntity styleReviewEntity) {
		return shopMapper.getStyleReview(styleReviewEntity);
	}

	@Override
	public List<ShopStyleReviewCommentDto> getStyleReviewComment(ShopStyleReviewEntity styleReviewEntity) {
		return shopMapper.getStyleReviewComment(styleReviewEntity);
	}

	@Override
	public Boolean addStyleReviewComment(ShopStyleReviewCommentEntity styleReviewCommentEntity) {
		return shopMapper.addStyleReviewComment(styleReviewCommentEntity);
	}
	
	@Override
	public Boolean removeStyleReviewComment(ShopStyleReviewCommentDeleteEntity styleReviewCommentDeleteEntity) {
		return shopMapper.removeStyleReviewComment(styleReviewCommentDeleteEntity);
	}

	@Override
	public int getStyleReviewLike(ShopStyleReviewEntity styleReviewEntity) {
		return shopMapper.getStyleReviewLike(styleReviewEntity);
	}

	@Override
	public int getStyleReviewLikeCount(String styleReviewId) {
		return shopMapper.getStyleReviewLikeCount(styleReviewId);
	}

	@Override
	public int setStyleReviewLike(ShopStyleReviewEntity styleReviewEntity) {
		return shopMapper.setStyleReviewLike(styleReviewEntity);
	}

	@Override
	public int unsetStyleReviewLike(ShopStyleReviewEntity styleReviewEntity) {
		return shopMapper.unsetStyleReviewLike(styleReviewEntity);
	}

	@Override
	public void insertShop(ShopDto dto) {

		shopMapper.insertShop(dto);
	}

	@Override
	public void deleteShop(String num) {

		shopMapper.deleteShop(num);
	}

	@Override
	public ShopDto getProduct(String num) {

		return shopMapper.getProduct(num);
	}
}
