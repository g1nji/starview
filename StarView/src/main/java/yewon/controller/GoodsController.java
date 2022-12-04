package yewon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		int totalCount = goodsService.totalCount();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("goodsList", goodsList);
	}
	
	@RequestMapping(value = "/goods/more", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	public void moreGoodslist(@RequestBody Map<String, String> param, Model model) {
		logger.info("/board/more [GET]");
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startIdx", Integer.parseInt(param.get("startIdx")));
		map.put("endIdx", Integer.parseInt(param.get("endIdx")));
		map.put("step", Integer.parseInt(param.get("step")));
//		map.put("endIdx", param.get("endIdx"));
//		map.put("step", param.get("step"));
		
		System.out.println(map);
		
		List<Goods> moreGoods = goodsService.getMoreGoods(map);
		
		model.addAttribute("moreGoods", moreGoods);
	}
}
