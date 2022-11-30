package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.ShopDto;
import boot.sist.mapper.MainscMapperInter;

@Service
public class MainscService implements MainscServiceInter {

	@Autowired
	MainscMapperInter mapperInter;

	@Override
	public List<ShopDto> getList(String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		return mapperInter.getList(map);
	}

	@Override
	public int getTotalCount(String searchword) {
        Map<String, String> map=new HashMap<>();
		
		map.put("searchword", searchword);
		return mapperInter.getTotalCount(map);
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
