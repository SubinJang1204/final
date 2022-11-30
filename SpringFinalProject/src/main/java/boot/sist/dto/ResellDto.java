package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("resell")
public class ResellDto {
	private int num;
	private int m_num;
	private String m_id;
	private String state;
	private String subject;
	private int price;
	private String content;
	private String photo;
	private int likes;
	
	@JsonFormat(pattern = "yyyy년 MM월 dd일")
	private Timestamp writeday;
}
