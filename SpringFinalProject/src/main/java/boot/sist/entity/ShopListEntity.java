package boot.sist.entity;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("ShopListEntity")
public class ShopListEntity {
	private List<String> brand;
	private List<String> category;
	private List<String> gender;
	private List<String> price;
	private String searchWord;
	private int sort;
	private int offset;
	private int length;
}
