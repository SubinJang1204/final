package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.NoticeDto;
import boot.sist.mapper.NoticeMapperInter;

@Service
public class NoticeService implements NoticeServiceInter {

	@Autowired
	NoticeMapperInter mapperInter;
	
	@Override
	public int getTotalCount(String searchcolumn, String searchword) {
		// TODO Auto-generated method stub
		Map<String, String> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		return mapperInter.getTotalCount(map);
	}

	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return mapperInter.getMaxNum();
	}

	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		Map<String, Integer> map=new HashMap<>();
		
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		mapperInter.updateRestep(map);
	}

	@Override
	public void insertNotice(NoticeDto dto) {
		// TODO Auto-generated method stub
		int num=dto.getNum();
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0) { //새글
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}else {			
			updateRestep(regroup, restep);			
			restep++;
			relevel++;
		}
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		mapperInter.insertNotice(dto);
	}

	@Override
	public List<NoticeDto> getList(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub
		Map<String, Object> map=new HashMap<>();
		
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getList(map);
	}

	@Override
	public void updateReadcount(int num) {
		// TODO Auto-generated method stub
		mapperInter.updateReadcount(num);
	}

	@Override
	public NoticeDto getData(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getData(num);
	}

	@Override
	public void updateNotice(NoticeDto dto) {
		// TODO Auto-generated method stub
		mapperInter.updateNotice(dto);
	}

	@Override
	public void deleteNotice(int num,int currentPage) {
		// TODO Auto-generated method stub
		mapperInter.deleteNotice(num, currentPage);
	}

	@Override
	public void likesUpdate(int num) {
		// TODO Auto-generated method stub
		mapperInter.likesUpdate(num);
	}

}
