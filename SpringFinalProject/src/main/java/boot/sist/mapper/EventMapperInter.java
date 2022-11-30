package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.EventDto;

@Mapper
public interface EventMapperInter {

	public void insertEvent(EventDto dto);
	public List<EventDto> getEventList(Map<String, Object> map);
	public int getTotalCount(Map<String, String> map);
	public EventDto getEvent(int num);
	public int getMaxNum();
	public void updateReadCount(int num);
	public void deleteEvent(int num, String currentPage);
	public void likesUpdate(int num);
	public void updateEvent(EventDto dto);
}
