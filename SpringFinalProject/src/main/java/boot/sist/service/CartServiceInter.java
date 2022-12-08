package boot.sist.service;

import java.util.List;

import boot.sist.dto.CartDto;

public interface CartServiceInter {

	//카트추가
			public int addCart(CartDto cart) throws Exception; 
			
			//카트삭제
			public void deleteCart(int c_num); 
			
			//카트수량수정
			public void modifyCount(CartDto cart); 
			
			//카트목록
			public List<CartDto> getCart(int m_num); 
			
			//카트확인
			public CartDto checkCart(CartDto cart);
	
			//myid 세션에서 m_num 추출
			public int getMnum(String id);

			/* 카트 제거(주문) */
			public int deleteOrderCart(CartDto dto);
}
