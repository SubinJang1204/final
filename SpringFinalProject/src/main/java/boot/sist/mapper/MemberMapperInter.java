package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

	public void insertMember(MemberDto dto);
	public int getSearchId(String id);
	public String getName(String id);
	public int getIdPassCheck(Map<String, String> map);
	public MemberDto getDataById(String id);
	public MemberDto getDataByNum(String num);
	public List<MemberDto> getAllMembers();
	public void deleteMember(String num);
}
