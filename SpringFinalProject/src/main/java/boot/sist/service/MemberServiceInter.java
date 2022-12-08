package boot.sist.service;

import java.util.List;

import boot.sist.dto.MemberDto;
import boot.sist.dto.OrderDto;



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
	

	/* 주문자 주소 정보 */
	public MemberDto getMemberInfo(int num);
	/* 주문자 리스트 */
	public List<OrderDto> getList(String searchcolumn, String searchword, int start, int perpage);
	/* 주문자 수 */
	public int getTotalCount();
	/* 주문자 리스트 삭제 */
	public void deletejumunlist(String o_num);
	public void deletejumunlist2(String o_num);
}
