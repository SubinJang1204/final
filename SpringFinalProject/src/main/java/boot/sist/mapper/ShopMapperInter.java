package boot.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.ShopDto;
import boot.sist.dto.ShopStyleReviewDto;
import boot.sist.entity.ShopStyleReviewEntity;
import boot.sist.entity.ShopStyleReviewListEntity;

@Mapper
public interface ShopMapperInter {
	public ShopDto getShop(String shopnum);
	
	public int getStyleReviewListCount(String shopNum);
	public List<ShopStyleReviewDto> getStyleReviewList(ShopStyleReviewListEntity styleReviewListEntity);
	public Boolean addStyleReview(ShopStyleReviewEntity styleReviewEntity);
}

