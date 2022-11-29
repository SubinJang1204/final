package boot.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.ChatDto;

@Mapper
public interface ChatMapperInter {
	
	public int getMaxNum();
	public void insertChat(ChatDto dto);
	public List<ChatDto> getAllChat(String myid);
	public List<ChatDto> getEveryChatList();
	public ChatDto getOneChat(int num);
	public void deleteChat(int num);

}
