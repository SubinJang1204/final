package boot.sist.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("StyleReviewCommentDto")
public class ShopStyleReviewCommentDto {
	private String num;
	private String user_id;
	private String m_photo;
	private String ans_content;
	private String releases;
}
