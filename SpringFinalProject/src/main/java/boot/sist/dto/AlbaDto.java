package boot.sist.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("abdto")
public class AlbaDto {
	
	private String albaNum;
	private String a_id;
	private String a_part;
	private String a_photo;
	private String a_detailphoto;
	private String a_area;
	private int a_price;
	private int a_zim;
	private String a_workday;
	private String a_content;
	private String a_detailarea;
	private String a_magam;
	private Timestamp a_writeday;
	
	

}
