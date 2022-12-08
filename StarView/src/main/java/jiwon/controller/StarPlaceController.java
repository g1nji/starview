package jiwon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jiwon.dto.StarPlace;
import jiwon.service.face.StarPlaceService;

@Controller
public class StarPlaceController {

	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired private StarPlaceService starplaceService;
	
	@RequestMapping("star/place")
	public void starplace(Model model) {
		logger.info("star/place [get]");
		
		List<StarPlace> starPlaceList = starplaceService.list();
		for(StarPlace s : starPlaceList ) logger.info("{}", s);
		
		//모델값 전달하기
		model.addAttribute("starPlaceList", starPlaceList);
		
	}


}
