package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("answer")
public class SnsAnswerDto {
	private int num;
	private int s_num;
	private int m_num;
	private String m_id;
	private String m_name;
	private String m_idphoto;
	private String content;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:ss:mm")
	private Timestamp writeday;
}
