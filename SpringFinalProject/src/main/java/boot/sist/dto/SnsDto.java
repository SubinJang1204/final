package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("sns")
public class SnsDto {
	private int num;
	private int m_num;
	private String m_id;
	private String m_name;
	private String m_photo;
	private String subject;
	private String content;
	private String photo;
	private int likes;
	private int answer;
	
	@JsonFormat(pattern = "yyyy년 MM월 dd일")
	private Timestamp writeday;
}
