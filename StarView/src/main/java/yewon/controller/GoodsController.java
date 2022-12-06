package yewon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	//상품목록 조회
	@RequestMapping("/goods/list")
	public void goodslist(Model model) {
		logger.info("/board/list [GET]");
		
		List<Goods> goodsList = goodsService.getGoodsList();
		
		int totalCount = goodsService.totalCount();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("goodsList", goodsList);
	}
	
	//상품 더보기
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
	
	//낮은가격순 정렬
	@RequestMapping("/goods/lowPrice")
	public void sortByLowPrice(Model model) {
		logger.info("/board/lowPrice [GET]");
		
		List<Goods> lowPriceList = goodsService.sortByLowPrice();
		
		int totalCount = goodsService.totalCount();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("lowPriceList", lowPriceList);
	}
	
	//낮은가격순 더보기
	@RequestMapping(value = "/goods/more2", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	public void lowPriceMore(@RequestBody Map<String, String> param, Model model) {
		logger.info("/board/more2 [GET]");
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startIdx", Integer.parseInt(param.get("startIdx")));
		map.put("endIdx", Integer.parseInt(param.get("endIdx")));
		map.put("step", Integer.parseInt(param.get("step")));
		
		
		System.out.println(map);
		
		List<Goods> lowPriceMore = goodsService.lowPriceMore(map);
		
		model.addAttribute("lowPriceMore", lowPriceMore);
	}
	
	//높은가격순 정렬
	@RequestMapping("/goods/highPrice")
	public void sortByHighPrice(Model model) {
		logger.info("/board/highPrice [GET]");
		
		List<Goods> highPriceList = goodsService.sortByHighPrice();
		
		int totalCount = goodsService.totalCount();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("highPriceList", highPriceList);
	}
	
	//높은가격순 더보기
	@RequestMapping(value = "/goods/more3", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	public void highPriceMore(@RequestBody Map<String, String> param, Model model) {
		logger.info("/board/more3 [GET]");
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startIdx", Integer.parseInt(param.get("startIdx")));
		map.put("endIdx", Integer.parseInt(param.get("endIdx")));
		map.put("step", Integer.parseInt(param.get("step")));
		
		
		System.out.println(map);
		
		List<Goods> highPriceMore = goodsService.highPriceMore(map);
		
		model.addAttribute("highPriceMore", highPriceMore);
	}
}
