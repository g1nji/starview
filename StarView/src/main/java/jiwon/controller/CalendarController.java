package jiwon.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	@PostMapping("/todolist")
	public String calendarwrite( Calendar calendar, HttpSession session, Model model) {
		logger.info("/calendar/todolist [POST]");
		logger.info("{}", calendar);
		
		//작성자 정보 추가하기
		calendar.setuId( (String) session.getAttribute("uId"));
		calendarservice.write(calendar);
		
		return "redirect:/calendar/todolist";
	}
	
	//글쓰기 완료
//	@ResponseBody
//	@PostMapping("/todolist_ok")
//	public String writeok(Writer out, Calendar calendar ) {
//		logger.info("Calendar {} ", calendar);
////		logger.info("sDate {} ", sDate);
//		
//		
////		try {
////			out.write("{\"res\":true}");
////		} catch (IOException e) {
////			e.printStackTrace();
////		}
//		
//		return "";
//		
//	}
	
	
}
