package boot.sist.entity;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("StyleReviewCommentEntity")
public class ShopStyleReviewCommentEntity {
	private String user_id;
	private String m_photo;
	private String ans_content;
	private String que_num;
}
