package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.QNAboardDto;
import boot.sist.mapper.QNAboardMapperInter;

@Service
public class QNAboardService implements QNAboardServiceInter {

	@Autowired
	QNAboardMapperInter mapperInter;

	@Override
	public void qnaInsert(QNAboardDto dto) {

		mapperInter.qnaInsert(dto);
	}

	@Override
	public List<QNAboardDto> getAllDatas(int start, int perpage) {

		Map<String, Integer> map = new HashMap<>();
		
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getAllDatas(map);
	}

	@Override
	public int getTotalCnt() {

		return mapperInter.getTotalCnt();
	}

	@Override
	public void updateReadcount(String num) {

		mapperInter.updateReadcount(num);
	}

	@Override
	public QNAboardDto getData(String num) {

		return mapperInter.getData(num);
	}

	@Override
	public void deleteQNA(String num) {

		mapperInter.deleteQNA(num);
	}

	@Override
	public void insertAnswer(QNAboardDto dto) {

		mapperInter.insertAnswer(dto);
	}

	@Override
	public void updateAnswer(QNAboardDto dto) {

		mapperInter.updateAnswer(dto);
	}

}