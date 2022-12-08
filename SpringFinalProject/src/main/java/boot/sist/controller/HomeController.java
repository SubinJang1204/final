package boot.sist.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import boot.sist.dto.CartDto;
import boot.sist.service.CartService;

@Controller
public class HomeController { 
	
	@GetMapping("/")
	public String start(HttpSession session,Model model)
	{		
		
		return "/layout/main";
	}
	
}
