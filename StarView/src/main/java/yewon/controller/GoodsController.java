package yewon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import yewon.dto.Goods;
import yewon.service.face.GoodsService;

@Controller
public class GoodsController {

	@Autowired private GoodsService goodsService;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/goods/list")
	public void goodslist(Model model) {
		logger.info("/board/list [GET]");
		
		List<Goods> goodsList = goodsService.getGoodsList();
		
		model.addAttribute("goodsList", goodsList);
	}
}
