package sharon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DataController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
		
	@RequestMapping("/data/astro")
	public void astroData() {
		logger.info("/data/astro");
	}
	
	@RequestMapping("/data/astroMonth")
	public void astroData2() {
		logger.info("/data/astroMonth");
	}
	
	@RequestMapping("/data/moon")
	public void moonData() {
		logger.info("/data/moon");
	}
	
	@RequestMapping("/data/moonToday")
	public void moonData2() {
		logger.info("/data/moonToday");
	}
	
	@RequestMapping("/data/weather")
	public void weatherData() {
		logger.info("/data/weather");
	}
	
	@RequestMapping("/data/data3")
	public void weather() {
		logger.info("/data/data3");
	}
	
	

}
