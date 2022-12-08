package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.MemberDto;
import boot.sist.dto.OrderDto;
import boot.sist.mapper.MemberMapperInter;

@Service
public class MemberService implements MemberServiceInter {

	@Autowired
	MemberMapperInter mapperInter;
	
	@Override
	public void insertMember(MemberDto dto) {
		// TODO Auto-generated method stub
		mapperInter.insertMember(dto);
	}

	@Override
	public int getSearchId(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getSearchId(id);
	}

	@Override
	public String getName(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getName(id);
	}

	@Override
	public int getIdPassCheck(String id, String pass) {
		// TODO Auto-generated method stub
		//로그인 메서드(나중에 페이징 처리하는 것도 맵 처리할 거임(start, perpage))
		Map<String, String> map=new HashMap<>();
		map.put("id", id);
		map.put("pass", pass);
		
		return mapperInter.getIdPassCheck(map);
	}

	@Override
	public MemberDto getDataById(String id) {
		// TODO Auto-generated method stub
		return mapperInter.getDataById(id);
	}

	

	@Override
	public MemberDto getDataByNum(String num) {
		// TODO Auto-generated method stub
		return mapperInter.getDataByNum(num);
	}

	@Override
	public List<MemberDto> getAllMembers() {

		return mapperInter.getAllMembers();
	}

	@Override
	public void deleteMember(String num) {

		mapperInter.deleteMember(num);
	}


	@Override
	public MemberDto getMemberInfo(int num) {
		// TODO Auto-generated method stub
		return mapperInter.getMemberInfo(num);
	}

	@Override
	public List<OrderDto> getList(String searchcolumn, String searchword, int start, int perpage) {
		// TODO Auto-generated method stub

		HashMap<String, Object> map =new HashMap<>();
		map.put("searchcolumn", searchcolumn);
		map.put("searchword", searchword);
		map.put("start", start);
		map.put("perpage", perpage);
		
		return mapperInter.getList(map);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}

	@Override
	public void deletejumunlist(String o_num) {
		// TODO Auto-generated method stub
		mapperInter.deletejumunlist(o_num);
	}

	@Override
	public void deletejumunlist2(String o_num) {
		// TODO Auto-generated method stub
		mapperInter.deletejumunlist2(o_num);
	}

}
