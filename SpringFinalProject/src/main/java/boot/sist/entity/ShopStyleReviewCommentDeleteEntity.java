package boot.sist.entity;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("StyleReviewCommentDeleteEntity")
public class ShopStyleReviewCommentDeleteEntity {
	private String num;
	private String user_id;
}