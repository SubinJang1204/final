package boot.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {

	@GetMapping("/event/list")
	public String list() {
		return "/event/list";
	}
}
