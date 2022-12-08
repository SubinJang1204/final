package boot.sist.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import boot.sist.dto.CartDto;
import boot.sist.dto.MemberDto;
import boot.sist.dto.OrderDto;
import boot.sist.dto.OrderItemDto;
import boot.sist.dto.OrderPageItemDto;
import boot.sist.mapper.CartMapperInter;
import boot.sist.mapper.MemberMapperInter;
import boot.sist.mapper.OrderMapperInter;

@Service
public class OrderService implements OrderServiceInter {

	@Autowired
	OrderMapperInter orderMapperInter;
	
	@Autowired
	CartMapperInter cartMapperInter;
	
	@Autowired
	MemberMapperInter memberMapperInter;
	
	
	@Override
	public List<OrderPageItemDto> getGoodsInfo(List<OrderPageItemDto> orders) {
		// TODO Auto-generated method stub
		List<OrderPageItemDto> result = new ArrayList<OrderPageItemDto>();
		
		for(OrderPageItemDto ord: orders) {
			
			OrderPageItemDto goodsInfo = orderMapperInter.getGoodsInfo(ord.getP_num());			

			goodsInfo.setCnt(ord.getCnt());	
			
			goodsInfo.initSaleTotal();			
			
			result.add(goodsInfo);		
			
		}
		
		return result;
	}

	@Override
	@Transactional
	public void order(OrderDto dto) {
		// TODO Auto-generated method stub
		
		/* 사용할 데이터가져오기 */
		/* 회원 정보 */
		MemberDto member = memberMapperInter.getMemberInfo(dto.getM_num());
		
		/* 주문 정보 */
		List<OrderItemDto> ords = new ArrayList<>();
		for(OrderItemDto oit : dto.getOrders()) {
			OrderItemDto orderItem = orderMapperInter.getOrderInfo(oit.getP_num());
			
			// 수량 셋팅
			orderItem.setCnt(oit.getCnt());
			
			// 기본정보 셋팅
			orderItem.getTotalPrice();
			
			//List객체 추가
			ords.add(orderItem);
		}
		
		/* OrderDTO 셋팅 */
		dto.setOrders(ords);
		dto.getOrderPriceInfo();
		dto.setDelivery(0);
		
	/*DB 주문,주문상품(,배송정보) 넣기*/
		
		/* orderId만들기 및 OrderDTO객체 orderId에 저장 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = dto.getM_num() + format.format(date);
		dto.setO_num(orderId);
		
		/* db넣기 */
		orderMapperInter.enrollOrder(dto);		//vam_order 등록
		for(OrderItemDto oit : dto.getOrders()) {		//vam_orderItem 등록
			oit.setO_num(orderId);
			orderMapperInter.enrollOrderItem(oit);
		}
		
	/* 장바구니 제거 */
		for(OrderItemDto oit : dto.getOrders()) {
			CartDto cdto = new CartDto();
			cdto.setM_num(dto.getM_num());
			cdto.setP_num(oit.getP_num());
			
			cartMapperInter.deleteOrderCart(cdto);
		}
	}




}
