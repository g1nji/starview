package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import seulgi.dto.AdminBoard;
import seulgi.service.face.AdminBoardService;

@Controller
@RequestMapping(value="/admin/board")
public class AdminBoardController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminBoardService adminBoardService;
	
	//나중에 페이징 추가하기
	//갤러리
	@RequestMapping(value="/list")
	public void getBoardList(Model model) {
		logger.info("/list 주소 연결");
		
		//상품 리스트
		List<AdminBoard> boardList = adminBoardService.list();
		
		for (AdminBoard b : boardList)
			logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
}