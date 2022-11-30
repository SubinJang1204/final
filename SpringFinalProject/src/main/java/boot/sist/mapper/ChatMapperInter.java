package boot.sist.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.ChatDto;
import boot.sist.dto.MessageDto;

@Mapper
public interface ChatMapperInter {
	
	public int getMaxNum();
	public void insertChat(ChatDto dto);
	public List<ChatDto> getAllChat(String myid);
	public List<ChatDto> getEveryChatList();
	public ChatDto getOneChat(int num);
	public void deleteChat(int num);
	public int searchChat(Map<String, Object>map);
	
	// 메세지 로직
	public void insertMessage(MessageDto dto);
	public List<MessageDto> getMessageList(int num);
	
	public int getMaxNuminmessage();
	public int searchUnreadMesssage(Map<String, Object>map);
	public void updateReadMessage(Map<String, Object>map);
}
