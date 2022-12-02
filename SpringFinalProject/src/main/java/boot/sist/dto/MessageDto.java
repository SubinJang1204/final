package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("message")
public class MessageDto {
	
	private int num;
	private int c_num;
	private String from_id;
	private String content;
	private int readcount;
	private Timestamp writeday;

}
