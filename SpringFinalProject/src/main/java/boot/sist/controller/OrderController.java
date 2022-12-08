package boot.sist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boot.sist.dto.CartDto;
import boot.sist.dto.OrderDto;
import boot.sist.dto.OrderPageDto;
import boot.sist.service.CartService;
import boot.sist.service.MemberService;
import boot.sist.service.OrderService;

@Controller
public class OrderController {


	@Autowired
	CartService cartService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	MemberService memberService;
	
   @GetMapping("/order/{myid}")
   public String orderPageGET(@PathVariable("myid") String myid, OrderPageDto opd, Model model)
   {
	   int m_num=cartService.getMnum(myid);
	   
	   List<CartDto> list= cartService.getCart(m_num);
	  model.addAttribute("m_num",m_num);
	  model.addAttribute("list",list);
	  model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
      model.addAttribute("memberInfo",memberService.getMemberInfo(m_num));
	  
      return "/cart/order";
   }
   
   
   @PostMapping("/order/order")
   public String orderPagePost(OrderDto od, HttpServletRequest request) 
   {
	   
	   orderService.order(od);
	   
		return "redirect:/";
   }

}