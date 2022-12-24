package seulgi.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import seulgi.dto.AdminBoard;
import seulgi.dto.AdminBoardFile;
import seulgi.service.face.AdminBoardService;
import seulgi.util.Paging;

@Controller
@RequestMapping(value="/admin")
public class AdminBoardController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminBoardService adminBoardService;
	
	//1. 갤러리
	//게시글 리스트
	@RequestMapping(value="/gallery/list")
	public void getGalleyList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminBoardService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminBoard> boardList = adminBoardService.list(paging);
		
		//for (AdminBoard b : boardList)
			//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//게시글 상세 페이지
	@RequestMapping("/gallery/view")
	public String viewGalley(AdminBoard viewBoard, Model model) {
		logger.info("/view 주소 연결");

		//잘못된 게시글 번호 처리
		if( viewBoard.getGalleryNo() < 0 ) {
			return "redirect:/admin/gallery/list";
		}
		
		//게시글 상세 조회
		viewBoard = adminBoardService.view(viewBoard);
		logger.info("조회된 게시글: {}", viewBoard);
		
		//모델값 전달
		model.addAttribute("viewBoard", viewBoard);
		
		//첨부파일 모델값 전달
		AdminBoardFile boardFile = adminBoardService.getAttachFile(viewBoard);
		model.addAttribute("boardFile", boardFile);
		
		return "admin/gallery/view";
	}
	
	//게시글 업로드 페이지
	@RequestMapping(value="/gallery/insert", method = RequestMethod.GET)
	public void insertGallery() {
		logger.info("/insert 주소 연결 - [GET]");
	}
	
	//게시글 업로드
//	@RequestMapping(value="/gallery/insert", method = RequestMethod.POST)
//	public String insertGalleryProc(AdminBoard board, MultipartFile file) {
//		logger.info("/insert 주소 연결 - [POST]");
//		logger.info("게시글 정보: {}", board);
//		
//		//게시글, 첨부파일 처리
//		adminBoardService.upload(board, file);
//		
//		return "redirect:/admin/gallery/list";
//	}
	
	//게시글 업로드
	@RequestMapping(value="/gallery/insert", method = RequestMethod.POST)
	public String insertGalleryProc(AdminBoard board, MultipartFile file, HttpSession session) {
		logger.info("/insert 주소 연결 - [POST]");
		logger.info("게시글 정보: {}", board);
		logger.info("파일 정보: {}", file);
		
		//작성자 정보 추가
		board.setuId( (String) session.getAttribute("uId") );

		//게시글, 첨부파일 처리
		adminBoardService.upload(board, file);
		
		return "redirect:/admin/gallery/list";
	}
	
	//첨부파일 다운로드
//	@RequestMapping("/gallery/download")
//	public String downloadGalleyFile(AdminBoardFile boardFile, Model model) {
//		logger.info("download 주소 연결");
//		
//		//첨부파일 정보 객체
//		boardFile = adminBoardService.getFile(boardFile);
//		logger.info("{}", boardFile);
//		
//		//모델값 전달
//		model.addAttribute("boardFile", boardFile);
//
//		//다운로드 빈 객체 만들기?
//		return "down";
//	}

	//게시글 수정 페이지
	@RequestMapping(value="/gallery/update", method = RequestMethod.GET)
	public String updateGalley(AdminBoard board, Model model) {
		logger.info("/update 주소 연결 - [GET]");
		
		//잘못된 게시글 번호 처리
		if( board.getGalleryNo() < 0 ) {
			return "redirect:/admin/gallery/list";
		}
		
		//게시글 상세 조회
		board = adminBoardService.view(board);
		logger.info("조회된 게시글: {}", board);
		
		//모델값 전달
		model.addAttribute("updateBoard", board);
		
		//수정
		//첨부파일 모델값 전달
		AdminBoardFile boardFile = adminBoardService.getAttachFile(board);
		model.addAttribute("boardFile", boardFile);
		
		return "admin/gallery/update";
	}

	//게시글 수정
	@RequestMapping(value="/gallery/update", method = RequestMethod.POST)
	public String updateGalleyProc(AdminBoard board, MultipartFile file) {
		logger.info("/update 주소 연결 - [POST]");
		
		//adminBoardService.update(board);
		adminBoardService.update(board, file);
		
		return "redirect:/admin/gallery/view?galleryNo=" + board.getGalleryNo();
	}
	
	//게시글 삭제
	@RequestMapping("/gallery/delete")
	public String deleteGallery(AdminBoard board) {
		logger.info("/delete 주소 연결");
		
		adminBoardService.delete(board);
		
		return "redirect:/admin/gallery/list";
	}
	
	//나중에 페이징 처리도 할 것
	//게시글 검색
	@RequestMapping("/gallery/search")
	//public void searchGallery(Model model, @RequestParam(value="option", required = false) String option, @RequestParam(value="keyword", required = false) String keyword) {
	//public void searchGallery(Model model, Search search) {
	public void searchGallery(Model model, @RequestParam(required = false) String keyword) {
		logger.info("/search 주소 연결");
		
		//검색된 게시글 리스트
		List<AdminBoard> searchList = adminBoardService.search(keyword);
		
		//for (AdminBoard b : searchList)
		logger.info("검색된 게시글: {}", searchList);
		
		//String option = search.getOption();
		//String keyword = search.getKeyword();
		
		//logger.info("검색항목: {}", option);
		logger.info("검색어: {}", keyword);
	
		model.addAttribute("searchList", searchList);
		//model.addAttribute("option", option);
		model.addAttribute("keyword", keyword);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	//2. 상품 리뷰
	//하나의 매퍼로 시도하다 포기함...
	//게시글 리스트
	@RequestMapping(value="/goods/list")
	public void getGoodsReviewList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminBoardService.getPaging2(curPage);
		logger.info("페이징 정보: {}", paging);
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminBoard> boardList = adminBoardService.list2(paging);
		
		//for (AdminBoard b : boardList)
			//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	//3. 명소 후기
	//게시글 리스트
	@RequestMapping(value="/place/list")
	public void getPlaceReviewList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminBoardService.getPaging3(curPage);
		logger.info("페이징 정보: {}", paging);
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminBoard> boardList = adminBoardService.list3(paging);
		
		//for (AdminBoard b : boardList)
		//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	//4. 공지사항
	//전체 공지사항
	//게시글 리스트
//	@RequestMapping(value="/board/list")
//	public void getBoardList(Model model, @RequestParam(defaultValue = "0") int curPage) {
//	//public void getBoardList(Model model) {
//		logger.info("/list 주소 연결");
//		
//		//페이징 추가
//		Paging paging = adminBoardService.getPagingAll(curPage);
//		logger.info("페이징 정보: {}", paging);
//		model.addAttribute("paging", paging);
//		
//		//게시글 리스트
//		List<AdminBoard> boardList = adminBoardService.listAll(paging);
//		
//		//for (AdminBoard b : boardList)
//		//logger.info("{}", b);
//		
//		model.addAttribute("boardList", boardList);
//	}
	
	//게시글 업로드 페이지(공지사항)
//	@RequestMapping(value="/board/insert", method = RequestMethod.GET)
//	public void insertBoard() {
//		logger.info("/insert 주소 연결 - [GET]");
//	}
	
	//게시글 업로드
//	@RequestMapping(value="/board/insert", method = RequestMethod.POST)
//	public String insertBoardProc(AdminBoard board, MultipartFile file) {
//		logger.info("/insert 주소 연결 - [POST]");
//		logger.info("게시글 정보: {}", board);
//		
//		//게시글 처리
//		adminBoardService.upload(board);
//		
//		return "redirect:/admin/board/list";
//	}
}