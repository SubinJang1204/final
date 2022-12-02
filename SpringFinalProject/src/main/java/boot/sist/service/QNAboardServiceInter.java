package boot.sist.service;

import java.util.List;

import boot.sist.dto.QNAboardDto;

public interface QNAboardServiceInter {

	public void qnaInsert(QNAboardDto dto);
	public int getTotalCnt();
	public List<QNAboardDto> getAllDatas(int start, int perpage);
	public void updateReadcount(String num);
	public QNAboardDto getData(String num);
	public void deleteQNA(String num);
	public void insertAnswer(QNAboardDto dto);
	public void updateAnswer(QNAboardDto dto);
}