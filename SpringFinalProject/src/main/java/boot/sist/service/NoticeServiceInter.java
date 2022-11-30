package boot.sist.service;

import java.util.List;

import boot.sist.dto.NoticeDto;

public interface NoticeServiceInter {

	 public int getTotalCount(String searchcolumn,String searchword);
	 public int getMaxNum();
	 public void updateRestep(int regroup,int restep);
	 public void insertNotice(NoticeDto dto);
	 public List<NoticeDto> getList(String searchcolumn,String searchword,int start,int perpage);
	 public void updateReadcount(int num);
	 public NoticeDto getData(int num);
	 public void updateNotice(NoticeDto dto); 
	 public void deleteNotice(int num, int currentPage);
	 public void likesUpdate(int num);
	 
}
