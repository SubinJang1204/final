package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.MapBoardDto;

@Mapper
public interface MapMapperInter {
	
	public void insertMap(MapBoardDto dto);
	public int getMapTotalCount(Map<String, String> map);
	public List<MapBoardDto> getMapList(Map<String, Object> map);
}
