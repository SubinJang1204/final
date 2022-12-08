package boot.sist.dto;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MypageshopDto")
public class MypageshopDto {
	
	private String shopnum;
	private String sangpum;
	private String photo;
	private int price;
	private String memberNum;
	
}
