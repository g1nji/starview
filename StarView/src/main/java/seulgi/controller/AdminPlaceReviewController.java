package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		model.addAttribute("paging", paging);
		
		//게시글 리스트
		List<AdminPlaceReview> boardList = adminBoardService.list3(paging);
		
		//for (AdminBoard b : boardList)
		//logger.info("{}", b);
		
		model.addAttribute("boardList", boardList);
	}
	
}