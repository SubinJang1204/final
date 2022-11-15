package boot.sist.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.MemberDto;
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

	
}
