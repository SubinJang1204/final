package boot.sist.domain;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@Alias("Pagination")
public class PaginationDomain {
	private int page;
	private int length;
	private int totalPage;
}
