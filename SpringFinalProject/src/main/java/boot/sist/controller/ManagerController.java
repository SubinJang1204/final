package boot.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {

	@GetMapping("/manager")
	public ModelAndView managerPage() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/manager/managerpage");
		
		return mav;
	}
}
