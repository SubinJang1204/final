package boot.sist.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.sist.dto.MemberDto;
import boot.sist.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login/main")

	public String form(HttpSession session,Model model)
	{
		
		String loginok=(String)session.getAttribute("loginok");
	
		String myid=(String)session.getAttribute("myid");
	
		if(loginok==null)
			return "/login/loginform";
		else {

			String name=service.getName(myid);
	
			model.addAttribute("name", name);
			
			return "/";
	}}
	
	@PostMapping("/login/loginprocess")
	public String loginProc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave,
			HttpSession session) {
		
		int check=service.getIdPassCheck(id, pass);
		
		if(check==1) {
			session.setMaxInactiveInterval(60*60*8);
			
			MemberDto mdto=service.getDataById(id);
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave);
			session.setAttribute("loginphoto", mdto.getPhoto());
			session.setAttribute("loginname", mdto.getName());
			session.setAttribute("loginid", mdto.getNum());
			
			return "redirect:/";
		}else {
			return "/member/passfail";
		}
	}
	@GetMapping("/login/logoutprocess")
	public String logoutProc(HttpSession session) {
		session.removeAttribute("loginok");
		return "/";
	}
}
