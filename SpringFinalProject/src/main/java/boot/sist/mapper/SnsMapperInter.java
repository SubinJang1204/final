package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.SnsDto;

@Mapper
public interface SnsMapperInter {
	
	public void insertSns(SnsDto dto);
	public List<SnsDto> getAllSns(Map<String, Integer> map);
	public SnsDto getOneSns(int num);
	public void updateSns(SnsDto dto);
	public void deleteSns(int num);
	
	// 좋아요, 저장하기 기능
	
}
