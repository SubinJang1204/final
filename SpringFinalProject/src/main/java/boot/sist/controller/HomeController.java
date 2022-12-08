package boot.sist.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import boot.sist.dto.ShopDto;
import boot.sist.service.LankService;
import boot.sist.dto.CartDto;
import boot.sist.service.CartService;

@Controller
public class HomeController {
	
	@Autowired
	LankService service;
	
	@Autowired
	CartService cservice; 
	
	@GetMapping("/")
	public String List(HttpSession session, Model model)
	{
		String loginok=(String)session.getAttribute("loginok");
		List<ShopDto> list=service.getList();
		List<ShopDto> alist=service.getAlist();
		List<ShopDto> blist=service.getBlist();
		
		model.addAttribute("list", list);
		model.addAttribute("alist", alist);
		model.addAttribute("blist", blist);
		
		if(loginok!=null) {

			String myid=(String)session.getAttribute("myid");
			
			int m_num=cservice.getMnum(myid);

			List<CartDto> clist =cservice.getCart(m_num);
			model.addAttribute("count",clist.size());
			}
		
		return "/layout/main";
	}
}