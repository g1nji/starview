package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import seulgi.dto.AdminBoard;
import seulgi.dto.AdminProduct;
import seulgi.service.face.AdminBoardService;
import seulgi.util.Paging;

@Controller
@RequestMapping(value="/admin/board")
public class AdminBoardController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminBoardService adminBoardService;
	
	//갤러리
	@RequestMapping(value="/list")
	public void getBoardList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminBoardService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminBoard> boardList = adminBoardService.list(paging);
		
		for (AdminBoard b : boardList)
			logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//파일 추가
	//게시글 상세 페이지
	@RequestMapping("/view")
	public String viewBoard(AdminBoard viewBoard, Model model) {
		logger.info("/view 주소 연결");

		//잘못된 게시글 번호 처리
		if( viewBoard.getGalleryNo() < 0 ) {
			return "redirect:admin/board/list";
		}
		
		//게시글 상세 조회
		viewBoard = adminBoardService.view(viewBoard);
		logger.info("조회된 게시글: {}", viewBoard);
		
		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		
		return "admin/board/view";
	}
}