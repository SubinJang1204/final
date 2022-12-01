package boot.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {

	@GetMapping("/map/mappage")
	public String map() {
		
		return "/map/map";
	}
}
