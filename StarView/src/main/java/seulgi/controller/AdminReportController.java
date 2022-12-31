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
import seulgi.dto.AdminGallery;
import seulgi.dto.AdminReport;
import seulgi.service.face.AdminCommentService;
import seulgi.service.face.AdminGalleryService;
import seulgi.service.face.AdminReportService;
import seulgi.util.Paging;

@Controller
@RequestMapping(value="/admin/report")
public class AdminReportController {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired
	private AdminReportService adminReportService;
	
	@Autowired
	private AdminGalleryService adminBoardService;
	
	@Autowired
	private AdminCommentService adminCommentService;
	
	//신고 게시글 리스트
	@RequestMapping(value="/boardList")
	public void getReportGalleyList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminReportService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//신고 게시글 리스트
		List<AdminReport> boardList = adminReportService.list(paging);
		
		//모델값 전달
		model.addAttribute("boardList", boardList);
	}
	
	//신고 댓글 리스트
	@RequestMapping(value="/commList")
	public void getReportcommList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminReportService.getPaging2(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//신고 댓글 리스트
		List<AdminReport> commList = adminReportService.list2(paging);
		
		//모델값 전달
		model.addAttribute("commList", commList);
	}
	
	//게시글 삭제 - list에서
	//신고 글, 갤러리 테이블에서 동시에 삭제되도록
	@ResponseBody
	@RequestMapping("/deletee")
	public int deleteeReportBoard(@RequestParam(value = "chbox[]") List<String> chArr, AdminReport board, AdminGallery gallery) {
		logger.info("/deletee 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		for(String i : chArr) {   
			select_data = Integer.parseInt(i);
			
			//신고 글 삭제
			board.setGalleryNo(select_data);
			adminReportService.delete(board);

			//갤러리 삭제
			gallery.setGalleryNo(select_data);
			adminBoardService.delete(gallery);
		}
		
		result = 1;
			  
		return result;  
	}
	
	//댓글 삭제 - list에서
	//신고 댓글, 갤러리 댓글 테이블에서 동시에 삭제되도록
	@ResponseBody
	@RequestMapping("/deleteee")
	public int deleteeeReportComm(@RequestParam(value = "chbox[]") List<String> chArr, AdminReport board, AdminComment comment) {
		logger.info("/deleteee 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		for(String i : chArr) {   
			select_data = Integer.parseInt(i);
			
			//신고 댓글 삭제
			board.setCmNo(select_data);
			adminReportService.delete2(board);
			
			//갤러리 댓글 테이블
			comment.setCmNo(select_data);
			adminCommentService.delete(comment);
		}
		
		result = 1;
			  
		return result;  
	}
}
