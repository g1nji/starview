package jiwon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hyeri.dto.PlaceReview;
import hyeri.dto.ReviewFile;
import jiwon.dto.StarPlace;
import jiwon.service.face.StarPlaceService;

@Controller
public class StarPlaceController {

	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private StarPlaceService starplaceService;
	
	//메인 화면
	@RequestMapping("place/main")
	public void starplace(Model model) {
		logger.info("place/main");
		
		List<StarPlace> starPlaceList = starplaceService.list();
		for(StarPlace s : starPlaceList ) logger.info("{}", s);
		
		//모델값 전달하기
		model.addAttribute("starPlaceList", starPlaceList);
	}
	
	//명소 상세 조회
	@GetMapping("place/view")
	public String placedetail(StarPlace viewStarplace, PlaceReview placeReview, int arrivalNum, Model model) {
		logger.info("/star/view");
		
		//잘못된게시글 번호 처리
		if( viewStarplace.getArrivalNum() < 0 ) {
			return "redirect:/star/place";
		}
		
		//게시글 조회
		viewStarplace = starplaceService.view(viewStarplace);
		logger.info("조회된 게시글 {}", viewStarplace);
		
		//모델값 전달
		model.addAttribute("viewStarplace", viewStarplace);
		
		//리뷰 조회
		List<PlaceReview> list = null;
		list = starplaceService.viewReview(arrivalNum);
		
		//모델값 전달
		model.addAttribute("review", list);
		
//		logger.info("리뷰 리스트 : {}", list);
		
		return "place/view";
	}
	
}
