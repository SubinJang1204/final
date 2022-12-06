package boot.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.ShopDto;

@Mapper
public interface LankMapperInter {

	public List<ShopDto> getList();
	public List<ShopDto> getAlist();
	public List<ShopDto> getBlist();
	public ShopDto getNum(int shopnum);
	public void likesUpdate(int shopnum);
	
}
