package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("notice")
public class NoticeDto {

	private int num;
	private String id;
	private String subject;
	private String photo;
	private String content;
	private int readcount;
	private int likes;
	private int regroup;
	private int restep;
	private int relevel;
	private Timestamp writeday;
}
