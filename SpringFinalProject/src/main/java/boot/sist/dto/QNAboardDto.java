package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("qnaboard")
public class QNAboardDto {

	private String num;
	private String m_num;
	private String id;
	private String subject;
	private String question;
	private String answer;
	private int readcount;
	private int secret;
	private Timestamp writeday;
}
