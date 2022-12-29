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

	//댓글 삭제
	@ResponseBody
	@RequestMapping("/delete")
	public int deleteselComm(@RequestParam String checkArr, AdminComment board) {
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
	
	//검색-아이디
	
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
