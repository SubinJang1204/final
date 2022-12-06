package boot.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.ShopDto;
import boot.sist.mapper.LankMapperInter;

@Service
public class LankService implements LankServiceInter {

	@Autowired
	LankMapperInter mapperInter;

	@Override
	public List<ShopDto> getList() {
		// TODO Auto-generated method stub
		
		return mapperInter.getList();
	}
	
	@Override
	public List<ShopDto> getAlist() {
		// TODO Auto-generated method stub
		
		return mapperInter.getAlist();
	}
	
	@Override
	public List<ShopDto> getBlist() {
		// TODO Auto-generated method stub
		
		return mapperInter.getBlist();
	}

	@Override
	public ShopDto getNum(int shopnum) {
		// TODO Auto-generated method stub
		return mapperInter.getNum(shopnum);
	}

	@Override
	public void likesUpdate(int shopnum) {
		// TODO Auto-generated method stub
		mapperInter.likesUpdate(shopnum);
	}

}
