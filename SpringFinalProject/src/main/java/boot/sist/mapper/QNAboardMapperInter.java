package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.QNAboardDto;

@Mapper
public interface QNAboardMapperInter {
	
	public void qnaInsert(QNAboardDto dto);
	public int getTotalCnt();
	public List<QNAboardDto> getAllDatas(Map<String, Integer> map);
	public void updateReadcount(String num);
	public QNAboardDto getData(String num);
	public void deleteQNA(String num);
	public void insertAnswer(QNAboardDto dto);
	public void updateAnswer(QNAboardDto dto);
}
