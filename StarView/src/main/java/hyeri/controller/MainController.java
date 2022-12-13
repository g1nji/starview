package hyeri.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import sharon.service.face.LoginService;

@Controller
public class MainController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private LoginService loginService;
	
	@RequestMapping("/")
	public String main() {
		logger.info("별 보러 가자 main 접속");
		
		return ("/main/main");
	}
	
}
