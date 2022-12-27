package yewon.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind .annotation.ResponseBody;

import yewon.dto.Wish;
import yewon.service.face.WishService;

@Controller
public class WishController {
	
	@Autowired private WishService wishService;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/wish/clickLike")
	@ResponseBody
	public Map<String, Object> clickLike(@RequestBody Wish wish, HttpSession session) {
		
		wish.setuId((String) session.getAttribute("uId"));
		logger.info("wish param: {}", wish);
		
		int findLike = wishService.findLike(wish);
		logger.info("findLike: {}", findLike);
		
		//처음 좋아요 누름, 하트 빨간색
		if( findLike == 0) {
			wishService.insertLike(wish); 
		} else {
			wishService.deleteLike(wish);
		}
		
		//AJAX 응답 map에 담아 보내기
		Map<String, Object> likemap = new HashMap<>();
		likemap.put("totalLike", wishService.getLikeCntAll(wish));
		likemap.put("findLike", findLike);
		
		return likemap;
	}
}
