package boot.sist.entity;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("ShopEntity")
public class ShopEntity {
	private String memberNum;
	private String shopNum;
}
