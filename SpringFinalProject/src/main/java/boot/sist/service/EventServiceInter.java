package boot.sist.service;

import java.util.List;

import boot.sist.dto.EventDto;

public interface EventServiceInter {

	public void insertEvent(EventDto dto);
	public List<EventDto> getEventList(int start, int perpage);
	public int getTotalCount();
	public EventDto getEvent(int num);
	public int getMaxNum();
	public void updateReadCount(int num);
	public void deleteEvent(int num, String currentPage);
	public void likesUpdate(int num);
	public void updateEvent(EventDto dto);
}
