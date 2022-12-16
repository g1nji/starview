package jiwon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SunsetController {
	
	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	@Autowired private SunsetService sunsetService;
	
	@RequestMapping("/sunset/time")
	public void sunsettime() {
		logger.info("/sunset/time - [GET]");
		
	} 
	
	
}
