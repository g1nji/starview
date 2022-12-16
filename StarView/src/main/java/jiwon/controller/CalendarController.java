package jiwon.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jiwon.dto.Calendar;
import jiwon.service.face.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private CalendarService calendarservice;
	
	//캘린더 메인+todoList 폼
	@GetMapping("/todolist")
	public void calendarmain() {
		logger.info("/calendar/todolist [GET]");
		
	}
	
	//todoList 글쓰기 처리
	@PostMapping("/todolist")
	public String calendarwrite( Calendar scheduler, HttpSession session) {
		logger.info("/calendar/todolist [POST]");
		logger.info("{}", scheduler);
		
		//작성자 정보 추가하기
		scheduler.setuId( (String) session.getAttribute("uId"));
		
		calendarservice.write(scheduler);
		
		return "redirect:/calendar/todolist";
	}
}
