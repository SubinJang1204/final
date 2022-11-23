package boot.sist.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import boot.sist.dto.MemberDto;
import boot.sist.service.MemberService;

@Controller
public class ManagerController {
	
	@Autowired
	MemberService mservice;
	

	@GetMapping("/manager/main")
	public ModelAndView managerPage() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/manager/managerpage");
		
		return mav;
	}
	
	
	@GetMapping("/manager/memberList")
	public ModelAndView memberList() {
		
		ModelAndView mav = new ModelAndView();
		
		List<MemberDto> list = mservice.getAllMembers();
		
		mav.addObject("list", list);
		mav.addObject("cnt", list.size());
		
		mav.setViewName("/manager/memberList");
		
		return mav;
	}
	
	
	@GetMapping("/manager/event")
	public String eventPage() {
		
		return "redirect:/event/eventPage";
	}
}
