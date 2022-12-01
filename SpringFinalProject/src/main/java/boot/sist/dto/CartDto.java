package boot.sist.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("cart")
public class CartDto {
	private int c_num;
	private int p_num;
	private int m_num;
	private int cnt;
	private int sangpumsize;
	private String color;
	
	//product
	private String photo;
	private String sangpum;
	private int price;
	
	//추가
	
	private int totalPrice;

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getSangpumsize() {
		return sangpumsize;
	}

	public void setSangpumsize(int sangpumsize) {
		this.sangpumsize = sangpumsize;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
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

	public void initSaleTotal() {
		this.totalPrice = this.price*this.cnt;
	}
	
	
	
}

