package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="/list")
	public void commentList(Model model) {
		logger.info("/list 주소 연결");
		
		//댓글 조회
		List<AdminComment> commentList = adminCommentService.list();
		
		//모델값 전달
		model.addAttribute("commentList", commentList);
		
	}
	
	@RequestMapping(value="/report", method = RequestMethod.GET)
	public void reportComment() {
		logger.info("/report 주소 연결");
	}
	
}
