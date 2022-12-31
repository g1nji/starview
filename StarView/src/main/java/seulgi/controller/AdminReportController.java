package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import seulgi.dto.AdminReport;
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
	
	//조회-페이징
	//게시글 리스트
	@RequestMapping(value="/boardList")
	public void getReportGalleyList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminReportService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminReport> boardList = adminReportService.list(paging);
		
		//for (AdminBoard b : boardList)
			//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
	//댓글 리스트
	@RequestMapping(value="/commList")
	public void getReportcommList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminReportService.getPaging2(curPage);
		logger.info("페이징 정보: {}", paging);
		
		//모델값 전달
		model.addAttribute("paging", paging);
		
		//댓글 리스트
		List<AdminReport> commList = adminReportService.list2(paging);
		
		//모델값 전달
		model.addAttribute("commList", commList);
	}
	
}
