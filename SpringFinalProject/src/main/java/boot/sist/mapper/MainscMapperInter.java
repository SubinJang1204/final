package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.ShopDto;

@Mapper
public interface MainscMapperInter {

	public List<ShopDto> getList(Map<String, Object> map);
	public int getTotalCount(Map<String, String> map);
	public ShopDto getNum(int shopnum);
	public void likesUpdate(int shopnum);
	
}
