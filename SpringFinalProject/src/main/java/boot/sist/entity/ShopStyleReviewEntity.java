package boot.sist.entity;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("StyleReviewEntity")
public class ShopStyleReviewEntity {
	private String memberId;
	private String styleReviewId;
}
