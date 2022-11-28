package boot.sist.domain;

import java.util.List;

import org.apache.ibatis.type.Alias;

import boot.sist.dto.ShopListDto;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("ShopList")
public class ShopListDomain {
	private List<ShopListDto> shopList;
	private PaginationDomain pagination;
}
