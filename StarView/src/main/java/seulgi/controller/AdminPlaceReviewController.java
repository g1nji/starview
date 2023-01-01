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

import seulgi.dto.AdminPlaceReview;
import seulgi.service.face.AdminPlaceReviewService;
import seulgi.util.Paging;

@Controller
@RequestMapping(value="/admin/place")
public class AdminPlaceReviewController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminPlaceReviewService adminBoardService;
	
	//3. 명소 후기
	//게시글 리스트
	@RequestMapping(value="/list")
	public void getPlaceReviewList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminBoardService.getPaging3(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminPlaceReview> boardList = adminBoardService.list3(paging);
		
		//for (AdminBoard b : boardList)
		//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//게시글 상세 페이지
	@RequestMapping("/view")
	public String viewPlaceReview(AdminPlaceReview viewBoard, Model model) {
		logger.info("/view 주소 연결");

		//잘못된 게시글 번호 처리
		if( viewBoard.getSreviewNo() < 0 ) {
			return "redirect:/admin/place/list";
		}
		
		//게시글 상세 조회
		viewBoard = adminBoardService.view(viewBoard);
		logger.info("조회된 게시글: {}", viewBoard);
		
		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		
		//연결하기
		//명소 사진 조회
		//명소명 조회
		
		return "admin/place/view";
	}
	
	//왜 안 돼...
	//게시글 삭제 - list에서
	@ResponseBody
	@RequestMapping("/deletee")
	public int deleteePlaceReview(@RequestParam(value = "chbox[]") List<String> chArr, AdminPlaceReview board) {
		logger.info("/deletee 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		for(String i : chArr) {   
			select_data = Integer.parseInt(i);
			board.setSreviewNo(select_data);
			adminBoardService.delete(board);
		}
		
		result = 1;
			  
		return result;  
	}
	
	//게시글 삭제 - view에서
	@RequestMapping("/delete")
	public String deletePlaceReview(AdminPlaceReview board) {
		logger.info("/delete 주소 연결");
		
		adminBoardService.delete(board);
		
		return "redirect:/admin/place/list";
	}
	
	//페이징 추가
	//게시글 검색
	@RequestMapping("/search")
	public void searchPlaceReview(Model model, @RequestParam(required = false) String keyword) {
		logger.info("/search 주소 연결");
		
		//검색된 게시글 리스트
		List<AdminPlaceReview> searchList = adminBoardService.search(keyword);
		
		logger.info("검색어: {}", keyword);
	
		//모델값 전달
		model.addAttribute("searchList", searchList);
		model.addAttribute("keyword", keyword);
	}
	
}