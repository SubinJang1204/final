package boot.sist.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.MemberDto;
import boot.sist.dto.OrderDto;

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
	

	/* 주문자 주소 정보 */
	public MemberDto getMemberInfo(int num);
	/* 주문자 리스트 */
	public List<OrderDto> getList(HashMap<String, Object> map);
	/* 주문자 수 */
	public int getTotalCount();
	/* 주문자 리스트 삭제 */
	public void deletejumunlist(String o_num);

	public void deletejumunlist2(String o_num);
}
