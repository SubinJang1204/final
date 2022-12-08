package boot.sist.dto;

import java.util.List;

import lombok.Data;

public class OrderPageDto {

	private List<OrderPageItemDto> orders;

	public List<OrderPageItemDto> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderPageItemDto> orders) {
		this.orders = orders;
	}

	
	
}
