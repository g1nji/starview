package seulgi.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import seulgi.service.face.AdminReportService;

@Controller
public class AdminReportController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired
	private AdminReportService adminReportService;
	
	//조회-페이징
	//상세 조회
	//삭제
}
