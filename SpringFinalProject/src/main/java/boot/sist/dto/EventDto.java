package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("event")
public class EventDto {

	private int num;
	private String name; 
	private String myid;
	private String subject;
	private String content;
	private String mainphoto;
	private MultipartFile upload;
	private int readcount;
	private int likes;
	private Timestamp writeday;
}
