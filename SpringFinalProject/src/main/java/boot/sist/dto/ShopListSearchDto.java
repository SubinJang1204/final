package boot.sist.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ShopListSearchDto")
public class ShopListSearchDto {
	private String shopnum;
	private String sangpum;
	private String category;
	private String sub_category;
	private String photo;
}
