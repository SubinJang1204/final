package boot.sist.entity;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("StyleReviewInsertEntity")
public class ShopStyleReviewInsertEntity {
	private String shopNum;
	private String user_id;
	private String content;
	private String user_photo;
	private String style_photo;
}
