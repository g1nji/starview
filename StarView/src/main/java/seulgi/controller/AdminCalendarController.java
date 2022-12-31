package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import seulgi.dto.AdminCalendar;
import seulgi.service.face.AdminCalendarService;
import seulgi.util.Paging;

@Controller
@RequestMapping(value="/admin/calendar")
public class AdminCalendarController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCalendarService adminCalendarService;
	
	//관측 일자, 시간 API 조회
	//추천일 등록 페이지
	@RequestMapping(value="/date", method = RequestMethod.GET)
	public void insertcalendar() {
		logger.info("/date 연결 - [GET]");
	}
	
	//추천일 등록
	@RequestMapping(value="/date", method = RequestMethod.POST)
	public void insertCalendarProc(AdminCalendar calendar) {
		logger.info("/date 연결 - [POST]");
		
		adminCalendarService.upload(calendar);
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.GET)
	public void insertCalendar2(AdminCalendar calendar) {
		logger.info("/upload 연결 - [GET]");
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public String insertCalendarProc2(AdminCalendar calendar) {
		logger.info("/upload 연결 - [POST]");
		
		adminCalendarService.upload(calendar);
		
		return "redirect:/admin/calendar/list";
	}
	
	//관측 시간 API 조회
	@RequestMapping("/time")
	public void calendarTime() {
		logger.info("/time 연결");
	}
	
	//추천일 리스트 - 관리자
	@RequestMapping("/list")
	public void calendarList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 연결");
		
		//페이징 추가
		Paging paging = adminCalendarService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminCalendar> boardList = adminCalendarService.list(paging);
		
		//for (AdminBoard b : boardList)
			//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//추천일 리스트 - 회원
	@RequestMapping("/list2")
	public void calendarList2(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 연결");
		
		//페이징 추가
		Paging paging = adminCalendarService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminCalendar> boardList = adminCalendarService.list(paging);
		
		//for (AdminBoard b : boardList)
		//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//추천일 상세 조회
	@RequestMapping("/view")
	public String viewCalendar(AdminCalendar viewBoard, Model model) {
		logger.info("/view 주소 연결");

		//잘못된 추천일 번호 처리
		if( viewBoard.getRecomCode() < 0 ) {
			return "redirect:/admin/calendar/list";
		}
		
		//게시글 상세 조회
		viewBoard = adminCalendarService.view(viewBoard);
		logger.info("조회된 추천일: {}", viewBoard);
		
		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		
		return "admin/calendar/view";
	}
	
	//추천일 수정 페이지
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public String updateCalendar(AdminCalendar board, Model model) {
		logger.info("/update 주소 연결 - [GET]");
		
		//잘못된 추천일 번호 처리
		if( board.getRecomCode() < 0 ) {
			return "redirect:/admin/calendar/list";
		}
		
		//게시글 상세 조회
		board = adminCalendarService.view(board);
		logger.info("조회된 게시글: {}", board);
		
		//모델값 전달
		model.addAttribute("updateBoard", board);
		
		return "admin/calendar/update";
	}

	//추천일 수정
	@RequestMapping(value="/update", method = RequestMethod.POST)
	public String updateCalendarProc(AdminCalendar board) {
		logger.info("/update 주소 연결 - [POST]");
		
		adminCalendarService.update(board);
		
		return "redirect:/admin/calendar/view?recomCode=" + board.getRecomCode();
	}

	//게시글 삭제 - list에서
	@ResponseBody
	@RequestMapping("/deletee")
	public int deleteeCalendar(@RequestParam(value = "chbox[]") List<String> chArr, AdminCalendar board) {
		logger.info("/deletee 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		for(String i : chArr) {   
			select_data = Integer.parseInt(i);
			board.setRecomCode(select_data);
			adminCalendarService.delete(board);
		}
		
		result = 1;
			  
		return result;  
	}
	
	//게시글 삭제 - view에서
	@RequestMapping("/delete")
	public String deleteCalendar(AdminCalendar board) {
		logger.info("/delete 주소 연결");
		
		adminCalendarService.delete(board);
		
		return "redirect:/admin/calendar/list";
	}
}
