package boot.sist.entity;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("ShopLikeEntity")
public class ShopLikeEntity {
	private String memberNum;
	private String shopNum;
}
