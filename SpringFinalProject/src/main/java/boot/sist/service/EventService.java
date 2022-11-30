package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.EventDto;
import boot.sist.mapper.EventMapperInter;

@Service
public class EventService implements EventServiceInter {

	@Autowired
	EventMapperInter mapperInter;
	
	@Override
	public void insertEvent(EventDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertEvent(dto);
	}

	@Override
	public List<EventDto> getEventList(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		return mapperInter.getEventList(map);
	}

	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
        Map<String, String> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return mapperInter.getTotalCount(map);
	}

	@Override
	public EventDto getEvent(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getEvent(num);
	}

	@Override
	public void deleteEvent(int num, String currentPage) {
		// TODO Auto-generated method stub
		mapperInter.deleteEvent(num, currentPage);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	@Override
	public void updateReadCount(int num) {
		// TODO Auto-generated method stub
		mapperInter.updateReadCount(num);
	}

	@Override
	public void likesUpdate(int num) {
		// TODO Auto-generated method stub
		mapperInter.likesUpdate(num);
	}

	@Override
	public void updateEvent(EventDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateEvent(dto);
	}

}
