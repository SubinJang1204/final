package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.SnsDto;
import boot.sist.mapper.SnsMapperInter;

@Service
public class SnsService implements SnsServiceInter {
	
	@Autowired
	SnsMapperInter mapper;
	
	
	@Override
	public void insertSns(SnsDto dto) {
		// TODO Auto-generated method stub
		mapper.insertSns(dto);
	}

	@Override
	public List<SnsDto> getAllSns(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapper.getAllSns(map);
	}

	@Override
	public SnsDto getOneSns(int num) {
		// TODO Auto-generated method stub
		return mapper.getOneSns(num);
	}

	@Override
	public void updateSns(SnsDto dto) {
		// TODO Auto-generated method stub
		mapper.updateSns(dto);
	}

	@Override
	public void deleteSns(int num) {
		// TODO Auto-generated method stub
		mapper.deleteSns(num);
	}

}
