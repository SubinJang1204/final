package boot.sist.service;

import java.util.List;

import boot.sist.dto.SnsDto;

public interface SnsServiceInter {
	
	public void insertSns(SnsDto dto);
	public List<SnsDto> getAllSns(int start, int perpage);
	public SnsDto getOneSns(int num);
	public void updateSns(SnsDto dto);
	public void deleteSns(int num);

}
