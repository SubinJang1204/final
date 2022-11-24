package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.ResellDto;
import boot.sist.mapper.ResellMapperInter;

@Service
public class ResellService implements ResellServiceInter {
	
	@Autowired
	ResellMapperInter mapper;

	@Override
	public void insertResell(ResellDto dto) {
		// TODO Auto-generated method stub
		mapper.insertResell(dto);
	}

	@Override
	public List<ResellDto> getAllResell(int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		map.put("start", start);
		map.put("perpage", perpage);
		return mapper.getAllResell(map);
	}

	@Override
	public ResellDto getOneResell(int num) {
		// TODO Auto-generated method stub
		return mapper.getOneResell(num);
	}

	@Override
	public void updateResell(ResellDto dto) {
		// TODO Auto-generated method stub
		mapper.updateResell(dto);
	}

	@Override
	public void updateState(String state) {
		// TODO Auto-generated method stub
		mapper.updateState(state);
	}

	@Override
	public void deleteResell(int num) {
		// TODO Auto-generated method stub
		mapper.deleteResell(num);
	}

	

}
