package boot.sist.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.sist.dto.CartDto;
import boot.sist.dto.OrderDto;
import boot.sist.dto.OrderItemDto;
import boot.sist.dto.OrderPageItemDto;

@Mapper
public interface OrderMapperInter {
	
	/* 주문 상품 정보 (주문 페이지)*/
	public OrderPageItemDto getGoodsInfo(int p_num);
	
	/* 주문 상품 정보(주문 처리)*/
	public OrderItemDto getOrderInfo(int p_num);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDto dto);
	
	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDto odto);

}
