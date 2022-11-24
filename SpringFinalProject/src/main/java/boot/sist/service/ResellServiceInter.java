package boot.sist.service;

import java.util.List;
import java.util.Map;

import boot.sist.dto.ResellDto;

public interface ResellServiceInter {
	
	public void insertResell(ResellDto dto);
	public List<ResellDto> getAllResell(int start, int perpage);
	public ResellDto getOneResell(int num);
	public void updateResell(ResellDto dto);
	public void updateState(String state);
	public void deleteResell(int num);

}
