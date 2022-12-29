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

import seulgi.dto.AdminGoodsReview;
import seulgi.dto.AdminProduct;
import seulgi.dto.AdminProductFile;
import seulgi.service.face.AdminGoodsReviewService;
import seulgi.service.face.AdminProductService;
import seulgi.util.Paging;

@Controller
@RequestMapping(value="/admin/goods")
public class AdminGoodsReviewController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminGoodsReviewService adminBoardService;
	
	@Autowired
	private AdminProductService adminProductService;
	
	//2. 상품 리뷰
	//게시글 리스트
	@RequestMapping(value="/list")
	public void getGoodsReviewList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminBoardService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminGoodsReview> boardList = adminBoardService.list(paging);
		
		//for (AdminBoard b : boardList)
			//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//게시글 상세 페이지
	@RequestMapping("/view")
	public String viewGoodsReview(AdminGoodsReview viewBoard, Model model) {
		logger.info("/view 주소 연결");

		//잘못된 게시글 번호 처리
		if( viewBoard.getgId() < 0 ) {
			return "redirect:/admin/goods/list";
		}
		
		//게시글 상세 조회
		viewBoard = adminBoardService.view(viewBoard);
		logger.info("조회된 게시글: {}", viewBoard);
		
		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		
		//상품 사진 조회
		AdminProductFile prodFile = adminProductService.getAttachFile(viewBoard);
		logger.info("상품 번호: {}", viewBoard.getgId());

		//모델값 전달
		model.addAttribute("prodFile", prodFile);
		
		//상품명 조회
		AdminProduct viewProd = adminProductService.view(viewBoard);
		logger.info("상품 번호: {}", viewBoard.getgId());
		
		//모델값 전달
		model.addAttribute("viewProd", viewProd);
		
		return "admin/goods/view";
	}
	
	//왜 안 돼...
	//게시글 삭제 - list에서
	@ResponseBody
	@RequestMapping("/deletee")
	public int deleteselGallery(@RequestParam(value = "chbox[]") List<String> chArr, AdminGoodsReview board) {
		logger.info("/deletee 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		for(String i : chArr) {   
			select_data = Integer.parseInt(i);
			board.setgId(select_data);
			adminBoardService.delete2(board);
		}
		
		result = 1;
			  
		return result;  
	}
	
	//게시글 삭제 - view에서
	@RequestMapping("/delete")
	public String deleteGoodsReview(AdminGoodsReview board) {
		logger.info("/delete 주소 연결");
		
		adminBoardService.delete(board);
		
		return "redirect:/admin/goods/list";
	}
	
	//페이징 추가
	//게시글 검색
	@RequestMapping("/search")
	public void searchGoodsReview(Model model, @RequestParam(required = false) String keyword) {
		logger.info("/search 주소 연결");
		
		//검색된 게시글 리스트
		List<AdminGoodsReview> searchList = adminBoardService.search(keyword);
		
		//for (AdminGoodsReview b : searchList)
		//logger.info("검색된 게시글: {}", searchList);
		logger.info("검색어: {}", keyword);
	
		//모델값 전달
		model.addAttribute("searchList", searchList);
		model.addAttribute("keyword", keyword);
	}
	
}