package boot.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.ShopDto;
import boot.sist.dto.ShopStyleReviewDto;
import boot.sist.entity.ShopStyleReviewEntity;
import boot.sist.entity.ShopStyleReviewListEntity;
import boot.sist.mapper.ShopMapperInter;

@Service
public class ShopService implements ShopServiceInter {
	
	@Autowired
	ShopMapperInter shopMapper;

	@Override
	public ShopDto getShop(String shopnum) {
		return shopMapper.getShop(shopnum);
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
	public Boolean addStyleReview(ShopStyleReviewEntity styleReviewEntity) {
		return shopMapper.addStyleReview(styleReviewEntity);
	}
}
