package jiwon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jiwon.dto.Calendar;
import jiwon.service.face.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController<TodolistData> {

	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private CalendarService calendarservice;
	
	//캘린더 메인+todoList 폼
	@GetMapping("/todolist")
	public void calendarmain() {
		logger.info("/calendar/todolist [GET]");
		
		
	}
	
	//날짜 선택 시 호출될 메소드
	@ResponseBody
	@GetMapping("/listview")
	public void writeok( Model model ) {
		logger.info("List 요청 확인");
		
		List<Calendar> todoList = calendarservice.list();
		for (Calendar c : todoList ) logger.info("{}", c);
		
//		viewcalendar = calendarservice.view();
		
		model.addAttribute("todoList", todoList);
	}
	
	//todoList 글쓰기 처리
	@ResponseBody
	@PostMapping("/listview")
	public Map<String, Object> calendarwrite(@RequestParam Map<String, Object> calMap, HttpSession session, Model model) {
		logger.info("/calendar/todolist [POST]");
		logger.info("calendar {}", calMap);
		Map<String, Object> map = new HashMap<>();
		
		try {
			//작성자 정보 추가하기
			Calendar cal = new Calendar();
			
			cal.setuId( (String) session.getAttribute("uId"));
			cal.setTodoList(calMap.get("todoList").toString());
			cal.setsDate(calMap.get("sDate").toString());
//			cal.setsNo( (int) calMap.get("sNo") );
			
			calendarservice.write(cal); 
			List<Calendar> todoList = calendarservice.sDateTodolist(calMap.get("sDate").toString());
			
			map.put("todoList", todoList);
			map.put("result", true);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", false);
		}
		
		return map;
	}

	@ResponseBody
	@RequestMapping("/delete")
	public Map<String, Object> delete(@RequestParam int sNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
			logger.info("/delete/");
			logger.info("sNo {}", sNo);
			
		try {
			Calendar calendar = new Calendar();
			
			calendar.setsNo(sNo);
			calendarservice.delete(sNo);
			
			map.put("sNo", sNo);
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", false);
		}
		
//		return "redirect:/calendar/listview";
		return map;
		
	}
	
}
