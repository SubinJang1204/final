package boot.sist.dto;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("orderpageitem")
public class OrderPageItemDto {
	
	//뷰로부터 전달 받는 값 
	private int p_num;
	private int cnt;
	
	//db로 부터 꺼내는 값
	private String sangpum;
	private int price;

	//만들어낼 값
	private int totalPrice;



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

	public String getSangpum() {
		return sangpum;
	}

	public void setSangpum(String sangpum) {
		this.sangpum = sangpum;
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
		this.totalPrice = totalPrice;
	}
	

	public void initSaleTotal() {
		this.totalPrice = this.price*this.cnt;
	}
	
}

