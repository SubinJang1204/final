package boot.sist.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Alias("MypageorderDto")
public class MypageorderDto {
	
	private String o_num;
	private String p_num;
	private String sangpum;
	private String cnt; 
	private String name;
	private String m_num;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:ss:mm")
	private Date orderdate;
	
}
