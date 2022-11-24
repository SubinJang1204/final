package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.ResellDto;

@Mapper
public interface ResellMapperInter {
	
	public void insertResell(ResellDto dto);
	public List<ResellDto> getAllResell(Map<String, Integer> map);
	public ResellDto getOneResell(int num);
	public void updateResell(ResellDto dto);
	public void updateState(String state);
	public void deleteResell(int num);
	
	// 좋아요, 저장하기 기능
	
}
