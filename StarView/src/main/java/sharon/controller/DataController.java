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
	
	@RequestMapping("/data/mainMoon")
	public void mainMoon() {
		logger.info("/data/mainMoon");
	}
	
	@RequestMapping("/data/moonToday")
	public void moonData2() {
		logger.info("/data/moonToday");
	}
	
	@RequestMapping("/data/weather2")
	public void weather() {
		logger.info("/data/weather");
	}
	
	@RequestMapping("/data/weatherdata")
	public void weatherData() {
		logger.info("/data/weatherdata");
	}
	
	@RequestMapping("/data/weather3")
	public void weather3() {
		logger.info("/data/weather3");
	}
	

}
