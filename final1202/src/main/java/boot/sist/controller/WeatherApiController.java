package boot.sist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WeatherApiController {

	@GetMapping("/weather/weather")
	public String restApiGetWeather() throws Exception {
		
		
		
		return "/weather/weather";
	}
}