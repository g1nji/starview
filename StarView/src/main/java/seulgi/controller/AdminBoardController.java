package seulgi.controller;

import java.util.List;

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
import seulgi.dto.AdminProduct;
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
		
		for (AdminBoard b : boardList)
			logger.info("{}", b);
		
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
	
	//게시글 업로드 페이지(공지사항?)
	@RequestMapping(value="/gallery/insert", method = RequestMethod.GET)
	public void insertGallery() {
		logger.info("/insert 주소 연결 - [GET]");
	}
	
	//게시글 업로드
	@RequestMapping(value="/gallery/insert", method = RequestMethod.POST)
	public String insertGalleryProc(AdminBoard board, MultipartFile file) {
		logger.info("/insert 주소 연결 - [POST]");
		logger.info("게시글 정보: {}", board);
		
		//게시글, 첨부파일 처리
		adminBoardService.upload(board, file);
		
		return "redirect:/admin/gallery/list";
	}
	
	//첨부파일 다운로드
	@RequestMapping("/gallery/download")
	public String downloadGalleyFile(AdminBoardFile boardFile, Model model) {
		logger.info("download 주소 연결");
		
		//첨부파일 정보 객체
		boardFile = adminBoardService.getFile(boardFile);
		logger.info("{}", boardFile);
		
		//모델값 전달
		model.addAttribute("boardFile", boardFile);
		
		return "down";
	}

	//게시글 수정
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
	
}