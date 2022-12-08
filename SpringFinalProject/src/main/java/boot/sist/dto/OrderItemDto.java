package boot.sist.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("orderitemdto")
public class OrderItemDto {

	/* 주문 번호 */
	private String o_num;
	
	/* 상품 번호 */
    private int p_num;
    
	/* 주문 수량 */
    private int cnt;
    
	/* vam_orderItem 기본키 */
    private int oi_num;
    
	/* 상품 한 개 가격 */
    private int price;
 
	/* DB테이블 존재 하지 않는 데이터 */
        
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;

	public String getO_num() {
		return o_num;
	}

	public void setO_num(String o_num) {
		this.o_num = o_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getOi_num() {
		return oi_num;
	}

	public void setOi_num(int oi_num) {
		this.oi_num = oi_num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = this.price*this.cnt;
	}
	
    
}
