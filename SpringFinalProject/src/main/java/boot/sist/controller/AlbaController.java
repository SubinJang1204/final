package boot.sist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.service.AlbaService;

@Controller
public class AlbaController {
	
	@Autowired
	AlbaService service;
	
	@GetMapping("/alba/albalist")
	public ModelAndView albalist()
	{
		ModelAndView mview=new ModelAndView();
		
		int totalCount=service.getTotalCount();
		
		mview.addObject("totalCount", totalCount);
		mview.setViewName("/alba/albalist");
		
		return mview;
	}
	
	@GetMapping("/alba/form")
	public String form()
	{
		return "/alba/albawriteform";
	}
}
