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

import seulgi.dto.AdminComment;
import seulgi.service.face.AdminCommentService;

@Controller
@RequestMapping(value="/admin/comment")
public class AdminCommentController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCommentService adminCommentService;
	
	//페이징 추가
	//댓글 리스트
	@RequestMapping(value="/list")
	public void commList(Model model) {
		logger.info("/list 주소 연결");
		
		//댓글 조회
		List<AdminComment> commList = adminCommentService.list();
		
		//모델값 전달
		model.addAttribute("commList", commList);
		
	}

	//댓글 삭제 - list에서
	@ResponseBody
	@RequestMapping("/deletesel")
	public int deleteselComm(@RequestParam(value = "chbox[]") List<String> chArr, AdminComment board) {
		logger.info("/delete 주소 연결");
		
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
	@RequestMapping("/delete")
	public String deleteComm(AdminComment board) {
		logger.info("/delete 주소 연결");
		
		adminCommentService.delete(board);
		
		return "redirect:/admin/comment/list";
	}
	
	//검색-아이디, 페이징
	
	//댓글 신고
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public void reportComment() {
		logger.info("/report 주소 연결");
	}
	
	
}
