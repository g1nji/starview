package seulgi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import seulgi.service.face.AdminCommentService;

@Controller
public class AdminCommentController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCommentService adminCommentService;
	
	
}
