package boot.sist.service;

import java.util.List;

import boot.sist.dto.MemberDto;



//오버라이딩 편히 하려고 얘를 씀
public interface MemberServiceInter {

	public void insertMember(MemberDto dto);
	public int getSearchId(String id);
	public String getName(String id);
	public int getIdPassCheck(String id, String pass);
	public MemberDto getDataById(String id);
	public MemberDto getDataByNum(String num);
	public List<MemberDto> getAllMembers();
	public void deleteMember(String num);
}
