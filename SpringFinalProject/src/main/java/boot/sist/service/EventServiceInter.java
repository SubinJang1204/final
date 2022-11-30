package boot.sist.service;

import java.util.List;

import boot.sist.dto.EventDto;

public interface EventServiceInter {

	public void insertEvent(EventDto dto);
	public List<EventDto> getEventList(String searchcolumn,String searchword,int start,int perpage);
	public int getTotalCount(String searchcolumn,String searchword);
	public EventDto getEvent(int num);
	public int getMaxNum();
	public void updateReadCount(int num);
	public void deleteEvent(int num, String currentPage);
	public void likesUpdate(int num);
	public void updateEvent(EventDto dto);
}
