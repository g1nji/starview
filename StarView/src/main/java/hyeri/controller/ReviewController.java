package hyeri.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

import hyeri.dto.PlaceReview;
import jiwon.dto.StarPlace;

@Controller
public class ReviewController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	public String postSRWrite(PlaceReview placeReview, StarPlace starPlace ) {
		
		logger.info("{}", placeReview);
		
		return "redirect:/palce/view?arrivalNum=" + starPlace.getArrivalNum();
	}
	
}
