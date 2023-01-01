package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import seulgi.dto.AdminComment;
import seulgi.service.face.AdminCommentService;
import seulgi.util.Paging;

@Controller
@RequestMapping(value="/admin/comment")
public class AdminCommentController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCommentService adminCommentService;
	
	//댓글 리스트
	@RequestMapping(value="/list")
	public void getcommList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminCommentService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//댓글 리스트
		List<AdminComment> commList = adminCommentService.list(paging);
		
		//모델값 전달
		model.addAttribute("commList", commList);
	}

	//댓글 삭제 - list에서
	@ResponseBody
	@RequestMapping("/deletee")
	public int deleteeComm(@RequestParam(value = "chbox[]") List<String> chArr, AdminComment board) {
		logger.info("/deletee 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		for(String i : chArr) {   
			select_data = Integer.parseInt(i);
			board.setCmNo(select_data);
			adminCommentService.delete(board);
		}
		
		result = 1;
			  
		return result;  
	}
	
	//댓글 삭제 - view에서
	@ResponseBody
	@RequestMapping("/delete")
	public int deleteComm(@RequestParam String checkArr, AdminComment board) {
		logger.info("/delete 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		select_data = Integer.parseInt(checkArr);
		board.setCmNo(select_data);
		
		adminCommentService.delete(board);
		
		result = 1;
			  
		return result;  
	}
	
	//댓글 삭제
//	@RequestMapping("/delete")
//	public String deleteComm(AdminComment board) {
//		logger.info("/delete 주소 연결");
//		
//		adminCommentService.delete(board);
//		
//		return "redirect:/admin/comment/list";
//	}
	
	//댓글 검색
	@RequestMapping("/search")
	public void searchGallery(Model model, @RequestParam(required = false) String keyword) {
		logger.info("/search 주소 연결");
		
		//검색된 댓글 리스트
		List<AdminComment> searchList = adminCommentService.search(keyword);
		
		//for (AdminComment b : searchList)
		//logger.info("검색된 댓글: {}", searchList);
		logger.info("검색어: {}", keyword);
	
		//모델값 전달
		model.addAttribute("searchList", searchList);
		model.addAttribute("keyword", keyword);
	}
	
	//댓글 신고
	@ResponseBody
	@RequestMapping(value="/reportt")
	public int reportComment(@RequestParam String checkArr, AdminComment board) {
		logger.info("/reportt 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		select_data = Integer.parseInt(checkArr);
		board.setCmNo(select_data);
		
		adminCommentService.report(board);
		
		result = 1;
			  
		return result; 
	}
	
	//페이징 추가
	//댓글 신고 리스트
	@RequestMapping(value="/report")
	public void reportCommList(Model model) {
		logger.info("/report 주소 연결");
	}
	
	
}
