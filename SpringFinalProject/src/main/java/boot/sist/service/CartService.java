package boot.sist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boot.sist.dto.CartDto;
import boot.sist.mapper.CartMapperInter;

@Service
public class CartService implements CartServiceInter {

	@Autowired
	CartMapperInter mapperinter;
	
	
	@Override
	public int addCart(CartDto cart) {
		// TODO Auto-generated method stub
	
		//장바구니 데이터 체크
				CartDto checkCart= mapperinter.checkCart(cart);
				
				if(checkCart != null) {
					return 2;
				}
				//장바구니 등록 & 에러시 0반환
				try {
					return mapperinter.addCart(cart);
				} catch (Exception e) {
					return 0;
					// TODO: handle exception
				}
		
	}

	@Override
	public void deleteCart(int c_num) {
		// TODO Auto-generated method stub
		mapperinter.deleteCart(c_num);
	}

	@Override
	public void modifyCount(CartDto cart) {
		// TODO Auto-generated method stub
		mapperinter.modifyCount(cart);
	}

	@Override
	public List<CartDto> getCart(int m_num) {
		// TODO Auto-generated method stub
		List<CartDto> cart = mapperinter.getCart(m_num);
		
		for(CartDto dto: cart) {
			dto.initSaleTotal();
		}
		
		return cart;
	}

	@Override
	public CartDto checkCart(CartDto cart) {
		// TODO Auto-generated method stub
		return mapperinter.checkCart(cart);
	}

	@Override
	public int getMnum(String id) {
		// TODO Auto-generated method stub
		return mapperinter.getMnum(id);
	}


	@Override
	public int deleteOrderCart(CartDto dto) {
		// TODO Auto-generated method stub
		return mapperinter.deleteOrderCart(dto);
	}
	
}