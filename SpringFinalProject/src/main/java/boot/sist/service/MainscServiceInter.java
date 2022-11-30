package boot.sist.service;

import java.util.List;

import boot.sist.dto.ShopDto;

public interface MainscServiceInter {

	public List<ShopDto> getList(String searchword,int start,int perpage);
	public int getTotalCount(String searchword);
	public ShopDto getNum(int shopnum);	
	public void likesUpdate(int shopnum);
	
}
