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
import org.springframework.web.bind.annotation.RequestParam;

import yewon.dto.Goods;
import yewon.service.face.GoodsService;
import yewon.service.face.WishService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired private GoodsService goodsService;
	@Autowired private WishService wishService;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//상품목록 조회
	@RequestMapping("/list")
	public void goodslist(Model model) {
		
		List<Goods> goodsList = goodsService.getGoodsList();
		
		int totalCount = goodsService.totalCount();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("goodsList", goodsList);
	}
	
	//상품 더보기
	@RequestMapping(value = "/more", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	public void moreGoodslist(@RequestBody Map<String, String> param, Model model) {
		
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
	@RequestMapping("/lowPrice")
	public void sortByLowPrice(Model model) {
		
		List<Goods> lowPriceList = goodsService.sortByLowPrice();
		
		int totalCount = goodsService.totalCount();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("lowPriceList", lowPriceList);
	}
	
	//낮은가격순 더보기
	@RequestMapping(value = "/more2", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	public void lowPriceMore(@RequestBody Map<String, String> param, Model model) {
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startIdx", Integer.parseInt(param.get("startIdx")));
		map.put("endIdx", Integer.parseInt(param.get("endIdx")));
		map.put("step", Integer.parseInt(param.get("step")));
		
		System.out.println(map);
		
		List<Goods> lowPriceMore = goodsService.lowPriceMore(map);
		
		model.addAttribute("lowPriceMore", lowPriceMore);
	}
	
	//높은가격순 정렬
	@RequestMapping("/highPrice")
	public void sortByHighPrice(Model model) {
		
		List<Goods> highPriceList = goodsService.sortByHighPrice();
		
		int totalCount = goodsService.totalCount();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("highPriceList", highPriceList);
	}
	
	//높은가격순 더보기
	@RequestMapping(value = "/more3", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	public void highPriceMore(@RequestBody Map<String, String> param, Model model) {
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startIdx", Integer.parseInt(param.get("startIdx")));
		map.put("endIdx", Integer.parseInt(param.get("endIdx")));
		map.put("step", Integer.parseInt(param.get("step")));
		
		System.out.println(map);
		
		List<Goods> highPriceMore = goodsService.highPriceMore(map);
		
		model.addAttribute("highPriceMore", highPriceMore);
	}
	
	//최신등록순 정렬
	@RequestMapping("/latest")
	public void sortByDate(Model model) {
		
		List<Goods> latestList = goodsService.sortByDate();
		
		int totalCount = goodsService.totalCount();
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("latestList", latestList);
	}
	
	//최신등록순 더보기
	@RequestMapping(value = "/more4", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	public void latestMore(@RequestBody Map<String, String> param, Model model) {
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("startIdx", Integer.parseInt(param.get("startIdx")));
		map.put("endIdx", Integer.parseInt(param.get("endIdx")));
		map.put("step", Integer.parseInt(param.get("step")));
		
		System.out.println(map);
		
		List<Goods> latestMore = goodsService.latestMore(map);
		
		model.addAttribute("latestMore", latestMore);
	}
	
	//상품 상세보기
	@RequestMapping("/view")
	public void viewGoods(@RequestParam Map<String, Object> map, Model model) {
		
		System.out.println(map);
		
		Goods goodsInfo = goodsService.viewGoods(map);
		
		//wishlist tb에서 사용자가 해당 상품에 좋아요를 눌렀는지 확인
		int findLike = wishService.findLike(map);
		int likeCntAll = wishService.getLikeCntAll(map);
		logger.info("likeCntAll: {}", likeCntAll);
		
		model.addAttribute("goodsInfo", goodsInfo);
		model.addAttribute("findLike", findLike);
		model.addAttribute("likeCntAll", likeCntAll);
		
	}
}
