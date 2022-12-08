

package boot.sist.service;

import java.util.List;

import boot.sist.dto.CartDto;
import boot.sist.dto.OrderDto;
import boot.sist.dto.OrderItemDto;
import boot.sist.dto.OrderPageItemDto;

public interface OrderServiceInter {

			//주문정보
			public List<OrderPageItemDto> getGoodsInfo(List<OrderPageItemDto> order);
			
			public void order(OrderDto dto);
					
}
