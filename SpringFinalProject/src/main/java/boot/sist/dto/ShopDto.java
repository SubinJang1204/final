package boot.sist.dto;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Shop")
public class ShopDto {
	private int shopnum;
	private String sangpum;
	private String category;
	private String photo;
	private String sub_category;
	private String detail_photo;
	private int price;
	private int sangpumsize;
	private int model;
	private String color;
	private int likes;
	private int isLike;
	private int temp;
	private String releases;
	
	public String getPriceWithCommas() {
		StringBuilder builder = new StringBuilder();
		builder.append(price);

		Pattern pattern = Pattern.compile("\\B(?<!\\.\\d*)(?=(\\d{3})+(?!\\d))");
		Matcher matcher = pattern.matcher(builder);
		
		builder.replace(0, builder.length(), matcher.replaceAll(","));
		
		return builder.toString();
	}
}
