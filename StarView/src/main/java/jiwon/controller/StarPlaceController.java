package jiwon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StarPlaceController {

	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("star/place")
	public void starplace() {
		logger.info("star/place");
	}


}
