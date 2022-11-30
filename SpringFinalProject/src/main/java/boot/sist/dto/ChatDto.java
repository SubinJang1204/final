package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.json.simple.JSONObject;
import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("chat")
public class ChatDto {
	
	private int num;
	private int r_num;
	private String r_subject;
	
	@NumberFormat(pattern = "###,###")
	private int r_price;
	private String r_photo;
	private String seller;
	private String buyer; 
	
	@JsonFormat(pattern = "yyyy년 MM월 dd일")
	private Timestamp writeday;
	
	private int unreadMessage;

}
