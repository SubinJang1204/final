package boot.sist.dto;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ShopListDto")
public class ShopListDto {
	private String shopnum;
	private String sangpum;
	private String category;
	private String sub_category;
	private String photo;
	private int price;
	private String bookmarks;
	private String reviews;
	
	public String getPriceWithCommas() {
		StringBuilder builder = new StringBuilder();
		builder.append(price);

		Pattern pattern = Pattern.compile("\\B(?<!\\.\\d*)(?=(\\d{3})+(?!\\d))");
		Matcher matcher = pattern.matcher(builder);
		
		builder.replace(0, builder.length(), matcher.replaceAll(","));
		
		return builder.toString();
	}
}
