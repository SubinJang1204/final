package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("mapboard")
public class MapBoardDto {
	
	private String num;
	private String subject;
	private String content;
	private String photo;
	private String keyword;
	private String latitude;
	private String longitude;
	private int likes;
	private Timestamp writeday;
	
}
