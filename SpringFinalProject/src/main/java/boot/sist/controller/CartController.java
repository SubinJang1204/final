package boot.sist.controller;

import java.io.Console;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.parser.RecoveredRequiresStatement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.CartDto;
import boot.sist.dto.MemberDto;
import boot.sist.service.CartService;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	/* 카트 인서트 */
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCart(CartDto cart, HttpSession session ) {
		
		//로그인체크
		String loginok=(String)session.getAttribute("loginok");
		String myid=(String)session.getAttribute("myid");
	
		if(loginok==null) {
			return "5";
		}
		//카트등록
		int result= cartService.addCart(cart);
		
		return result+"";
	}
	

	/* 카트 리스트 */
	@GetMapping("/cart/cart")
	public String listCart(HttpSession session, Model model) {
		
		String id=(String) session.getAttribute("myid");
				
		int m_num=cartService.getMnum(id);
				
		List<CartDto> list=cartService.getCart(m_num);
		
		model.addAttribute("list",list);
		
		return "/cart/cart";
	}
	
	

	/* 카트 수량 업데이트 */
	@PostMapping("/cart/update")
	public String updateCart(CartDto cart, HttpSession session) {
		
		String id=(String) session.getAttribute("myid");
		
		cartService.modifyCount(cart);
		
		return "redirect:/cart/cart?myid="+id ;
	}
	
	
	/* 카트 수량 삭제 */
	@PostMapping("/cart/delete")
	public String deleteCart(CartDto cart, HttpSession session) {
	
		String id=(String) session.getAttribute("myid");

		cartService.deleteCart(cart.getC_num());
		
		return "redirect:/cart/cart?myid="+id ;
	}
	
}
