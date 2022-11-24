package boot.sist.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("StyleReviewDto")
public class ShopStyleReviewDto {
	private int num;
	private String user_id;
	private String content;
	private String user_photo;
	private String style_photo;
	private int likes;
	private int comments;
	
	public String getStylePhoto() {
		return "/upload/" + style_photo;
	}
}
