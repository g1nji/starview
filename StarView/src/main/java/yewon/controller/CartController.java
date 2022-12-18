package yewon.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import yewon.dto.Cart;
import yewon.service.face.CartService;

@Controller
@RequestMapping("/goods")
public class CartController {

	@Autowired private CartService cartService;

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/cart")
	public void viewCart(HttpSession session, Model model) {
		String uId = (String) session.getAttribute("uId");
		
		logger.info("viewCart - uId: {}", uId);
		
		List<Cart> cartList = cartService.viewCart(uId);

		model.addAttribute("cartList", cartList);
		model.addAttribute("totalCart", cartService.getCartTotal(uId));
	}
	
	@RequestMapping("/addCart")
	@ResponseBody
	public String addCart(@RequestBody Cart cart, Model model) {
		
		int addCheck = cartService.addCheck(cart);
		logger.info("addCheck: {}", addCheck);
		logger.info("addCart: {}", cart);

		if(addCheck > 0) {
			return "already_exist";
		} else {
			cartService.addCart(cart);
			return "add_success";
		}
	}
	
	@RequestMapping(value = "/deleteCart", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCart(@RequestBody Map<String, List<Integer>> param, Cart cart, HttpSession session) {
//		String uId = (String) session.getAttribute("uId");
//		cart.setuId(uId);
		
//		if(uId != null) {
//			
//		}

		logger.info("param : {}", param.get("chbox"));
		List<Integer> arr = param.get("chbox");
		int[] intarr = arr.stream().mapToInt(Integer::intValue).toArray(); 
		for(int i=0; i<intarr.length; i++) {
			cart.setcId(intarr[i]);
			cartService.deleteCart(cart);
		}
		
		return "delete_success";
	}
	
	@RequestMapping("/updateQty")
	public String updateQty(Cart cart) {
		cartService.updateQty(cart);
		return "redirect:/goods/cart";
	}
}
