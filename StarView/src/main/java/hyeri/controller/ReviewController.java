package hyeri.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import hyeri.dto.PlaceReview;
import hyeri.service.face.ReviewService;
import jiwon.dto.StarPlace;

@Controller
public class ReviewController {
	
	@Autowired ReviewService reviewService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping("/place/reviewWrite")
	public String postSRWrite(
			PlaceReview placeReview
			, StarPlace starPlace
			, MultipartFile file
			) {
		
//		logger.info("{}", placeReview);
		
		//리뷰 작성 (사진 없을 경우)
		if ( file.isEmpty() ) {
			reviewService.write2(placeReview);
		} else {
			//리뷰 작성 (사진 있을 경우)
			reviewService.write(placeReview, file);
			
		}
		
		return "redirect:/place/view?arrivalNum=" + starPlace.getArrivalNum();
	}
	
	@RequestMapping("/place/review-delete")
	public String deleteReview(
			PlaceReview placeReview
			, StarPlace starPlace
			, HttpServletRequest req
			) {
		
		reviewService.delete(placeReview);
		
		String referer = req.getHeader("Referer");
	    return "redirect:"+ referer;
//		return "redirect:/place/view?arrivalNum=" + starPlace.getArrivalNum();
	}
	
	
}
