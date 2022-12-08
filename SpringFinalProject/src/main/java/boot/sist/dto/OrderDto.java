package boot.sist.dto;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("orderdto")
public class OrderDto {

	/* 주문 번호 */
	private String o_num;
	
	/* 배송 받는이 */
	private String name;
	
	/* 주문 회원 아이디 */
	private int m_num;
	
	/* 우편번호 */
	private String addr1;
	
	/* 회원 주소 */
	private String addr2;
	
	/* 주문 상태 */
	private String state;
	
	/* 주문 상품 */
	private List<OrderItemDto> orders;	
	
	/* 배송비 */
	private int delivery;
	
	/* 주문 날짜 */
	private Timestamp orderDate;
	
	/* DB테이블 존재 하지 않는 데이터 */
	
	/* 판매가(모든 상품 비용) */
	private int orderSalePrice;
	
	/* 최종 판매 비용 */
	private int orderFinalSalePrice;

	public String getO_num() {
		return o_num;
	}

	public void setO_num(String o_num) {
		this.o_num = o_num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	
	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	

	public int getDelivery() {
		
		return delivery;
	}

	public void setDelivery(int delivery) {
		this.delivery=delivery;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<OrderItemDto> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderItemDto> orders) {
		this.orders = orders;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderSalePrice() {
		return orderSalePrice;
	}

	public void setOrderSalePrice(int orderSalePrice) {
		this.orderSalePrice = orderSalePrice;
	}

	public int getOrderFinalSalePrice() {
		return orderFinalSalePrice;
	}

	public void setOrderFinalSalePrice(int orderFinalSalePrice) {
		this.orderFinalSalePrice = orderFinalSalePrice;
	}
	
	
	public void getOrderPriceInfo() {
		/* 상품 비용 */
			for(OrderItemDto order : orders) {
				orderSalePrice += order.getTotalPrice();
			}
		/* 배송비용 */
			if(orderSalePrice >= 30000) {
				delivery = 0;
			} else {
				delivery = 3000;
			}
		/* 최종 비용(상품 비용 + 배송비 ) */
			orderFinalSalePrice = orderSalePrice + delivery;
	}	
}
