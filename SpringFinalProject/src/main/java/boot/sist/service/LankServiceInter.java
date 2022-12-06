package boot.sist.service;

import java.util.List;

import boot.sist.dto.ShopDto;

public interface LankServiceInter {

	public List<ShopDto> getList();
	public List<ShopDto> getAlist();
	public List<ShopDto> getBlist();
	public ShopDto getNum(int shopnum);	
	public void likesUpdate(int shopnum);
	
}
