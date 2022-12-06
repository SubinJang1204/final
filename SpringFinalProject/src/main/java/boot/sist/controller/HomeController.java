package boot.sist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import boot.sist.dto.ShopDto;
import boot.sist.service.LankService;

@Controller
public class HomeController {
	
	@Autowired
	LankService service;
	
	@GetMapping("/")
	public String List(Model model)
	{
		List<ShopDto> list=service.getList();
		List<ShopDto> alist=service.getAlist();
		List<ShopDto> blist=service.getBlist();
		
		model.addAttribute("list", list);
		model.addAttribute("alist", alist);
		model.addAttribute("blist", blist);
		
		return "/layout/main";
	}
}
