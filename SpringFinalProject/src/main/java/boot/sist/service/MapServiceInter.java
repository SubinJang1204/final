package boot.sist.service;

import java.util.List;

import boot.sist.dto.MapBoardDto;
import boot.sist.dto.SnsDto;

public interface MapServiceInter {
	
	public void insertMap(MapBoardDto dto);
	public List<MapBoardDto> getMapList(String searchcolumn, String searchword, int start, int perpage);
	public int getMapTotalCount(String searchcolumn, String searchword);
}
