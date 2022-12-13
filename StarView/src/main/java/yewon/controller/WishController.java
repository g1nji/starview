package yewon.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind .annotation.ResponseBody;

import yewon.service.face.WishService;

@Controller
public class WishController {
	
	@Autowired private WishService wishService;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/wish/clickLike")
	@ResponseBody
	public Map<String, Object> clickLike(@RequestBody Map<String, Object> map, Model model) {
		
		logger.info("map: {}", map);
		
		int findLike = wishService.findLike(map);
		logger.info("findLike: {}", findLike);
		
		//처음 좋아요 누름, 하트 빨간색
		if( findLike == 0) {
			wishService.insertLike(map); 
		} else {
			wishService.deleteLike(map);
		}
		
		Map<String, Object> likemap = new HashMap<>();
		likemap.put("totalLike", wishService.getLikeCntAll(map));
		likemap.put("findLike", findLike);
		
		return likemap;
	}
}
