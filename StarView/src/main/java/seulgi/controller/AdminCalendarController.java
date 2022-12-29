package seulgi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import seulgi.dto.AdminCalendar;
import seulgi.service.face.AdminCalendarService;

@Controller
@RequestMapping(value="/admin/calendar")
public class AdminCalendarController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCalendarService adminCalendarService;
	
	//관측 일자, 시간 API 조회
	@RequestMapping(value="/date", method = RequestMethod.GET)
	public void calendarDate() {
		logger.info("/date 연결 - [GET]");
	}
	
	//추천일 등록
	@RequestMapping(value="/date", method = RequestMethod.POST)
	public void insertcalendarDate(AdminCalendar calendar) {
		logger.info("/date 연결 - [POST]");
		
		adminCalendarService.upload(calendar);
	}
	
	//관측 시간 API 조회
	@RequestMapping("/time")
	public void calendarTime() {
		logger.info("/time 연결");
	}
	
	//추천일 리스트
	@RequestMapping("/list")
	public void calendarList() {
		logger.info("/list 연결");
	}
	
}
