package boot.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.SnsAnswerDto;


@Mapper
public interface SnsAnswerMapperInter {
	
	public void insertSnsAnswer(SnsAnswerDto dto);
	public List<SnsAnswerDto> getAllSnsAnswer(int s_num);
	public void deleteSnsAnswer(int num);
	
}
