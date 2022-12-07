package boot.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.MemberDto;
import boot.sist.dto.MypageorderDto;
import boot.sist.dto.MypageshopDto;

@Mapper
public interface MypageMapperInter {
	
	public List<MypageshopDto> getShopListbyMemberNum(String num);
	public List<MypageorderDto> getOrderListbyMemberNum(String num);

	public void updateInfo(MemberDto dto);
	public void deletemyinfo(String num);
	
}
