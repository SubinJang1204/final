package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.MapBoardDto;
import boot.sist.dto.ShopDto;
import boot.sist.mapper.AlbaMapperInter;
import boot.sist.mapper.MapMapperInter;

@Service
public class MapService implements MapServiceInter {

	@Autowired
MapMapperInter mapperInter;

	@Override
	public void insertMap(MapBoardDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertMap(dto);
	}
	
	@Override
	public int getMapTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		
		return mapperInter.getMapTotalCount(map);
	}

	@Override
	public List<MapBoardDto> getMapList(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);

		return mapperInter.getMapList(map);
	}

	
	}

