package boot.sist.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WeatherApiController {

	@GetMapping("/weather/weather")
	public ModelAndView ApiGetWeather() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		String date = sdf.format(new Date());
		
		mav.addObject("date", date);
		
		mav.setViewName("/weather/weather");
		
		return mav;
	}
}
