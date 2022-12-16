package seulgi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCalendarController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("admin/calendar/date")
	public void calendarDate() {
		logger.info("/date 연결");
	}
	
	@RequestMapping("admin/calendar/time")
	public void calendarTime() {
		logger.info("/time 연결");
	}
	
}
