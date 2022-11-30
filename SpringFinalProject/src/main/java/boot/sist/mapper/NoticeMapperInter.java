package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.NoticeDto;

@Mapper
public interface NoticeMapperInter {
	
  	 public int getTotalCount(Map<String, String> map);
	 public int getMaxNum();
	 public void updateRestep(Map<String, Integer> map);
	 public void insertNotice(NoticeDto dto);
	 public List<NoticeDto> getList(Map<String, Object> map);	
	 public void updateReadcount(int num);
	 public NoticeDto getData(int num);
	 public void updateNotice(NoticeDto dto); 
	 public void deleteNotice(int num, int currentPage);
	 public void likesUpdate(int num);
	 
	
}
