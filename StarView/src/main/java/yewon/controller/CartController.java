package yewon.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public void viewCart(
			HttpSession session, 
			@CookieValue(value="cartid", required=false) Cookie cookie, 
			Cart cart, 
			Model model) {
		String uId = (String) session.getAttribute("uId");
		logger.info("viewCart - uId: {}", uId);
		
		if(uId==null && cookie != null) {
			
			String ckid = cookie.getValue();
			logger.info("viewCart - ckid : {}", ckid);
			cart.setCkId(ckid);
			logger.info("viewCart - cart : {}", cart);
			List<Cart> cartList = cartService.viewCart(cart);
			logger.info("viewCart - cartList : {}", cartList);
			model.addAttribute("cartList", cartList);
			model.addAttribute("totalCart", cartService.getCartTotal(cart));
					
		} else if(uId!=null) {
			cart.setuId(uId);
			List<Cart> cartList = cartService.viewCart(cart);
			model.addAttribute("cartList", cartList);
			model.addAttribute("totalCart", cartService.getCartTotal(cart));
		}
	}
	
	@RequestMapping("/addCart")
	@ResponseBody
	public String addCart(
			@RequestBody Cart cart, 
			HttpSession session, 
			@CookieValue(value="cartid", required=false) Cookie cookie,
			HttpServletRequest req,
			HttpServletResponse resp) {
		
		String uId = (String) session.getAttribute("uId");
		
		//비회원 장바구니 첫 클릭시 쿠키 생성
		if(uId == null && cookie == null) {
			Cookie ckid = new Cookie("cartid", "ckid");
			ckid.setMaxAge(60 * 60 * 24);
			ckid.setPath("/");
			resp.addCookie(ckid);
			cart.setCkId(ckid.getValue());

			//장바구니 상품 중복체크
			int addCheck = cartService.addCheck(cart);
			if(addCheck > 0) {
				return "already_exist";
			} else {
				cartService.addCart(cart);
				return "add_success";
			}
			
		//비회원 장바구니 쿠키생성 후 상품추가
		} else if(uId == null && cookie != null) {
			
			logger.info("cartid_value :{} ", cookie.getValue());
			logger.info("uId :{} ", uId);
			cart.setCkId(cookie.getValue());
			
			//쿠키시간 재설정
			Cookie[] cookies = req.getCookies();
			for(Cookie ck : cookies) {
				if(ck.getName().equals("cartid")) {
					ck.setMaxAge(60*60*24);
					resp.addCookie(ck);
				}
			}
			logger.info("cart: {}", cart);
			
			//장바구니 상품 중복체크
			int addCheck = cartService.addCheck(cart);
			if(addCheck > 0) {
				return "already_exist";
			} else {
				cartService.addCart(cart);
				return "add_success";
			}
			
		//회원 장바구니 상품추가	
		} else {
			cart.setuId(uId);
			//장바구니 상품 중복체크
			int addCheck = cartService.addCheck(cart);
			if(addCheck > 0) {
				return "already_exist";
			} else {
				cartService.addCart(cart);
				return "add_success";
			}
		}
	}
	
	//개별상품 삭제
	@RequestMapping(value = "/deleteCart", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCart(
			@RequestBody Map<String, Integer> param, 
			Cart cart,
			@CookieValue(value="cartid", required=false) Cookie cookie,
			HttpSession session) {
		
		String uId = (String) session.getAttribute("uId");
		int item = param.get("item");

		//비회원 장바구니 삭제
		if(uId == null && cookie != null) {
			cart.setcId(item);
			cart.setCkId(cookie.getValue());
			cartService.deleteCart(cart);
		//회원 장바구니 삭제
		} else if(uId != null) {
			cart.setuId(uId);
			cart.setcId(item);
			cartService.deleteCart(cart);
			
		}
		return "delete_success";
	}
	
	//선택상품 삭제
	@RequestMapping(value = "/selectDelete", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String selectDelete(
			@RequestBody Map<String, List<Integer>> param, 
			Cart cart, 
			HttpSession session, 
			@CookieValue(value="cartid", required=false) Cookie cookie
			) {
		
		String uId = (String) session.getAttribute("uId");
		List<Integer> arr = param.get("chbox");
		logger.info("param : {}", param.get("chbox"));
		int[] intarr = arr.stream().mapToInt(Integer::intValue).toArray(); 

		//비회원 장바구니 삭제
		if(uId == null && cookie != null) {
			cart.setCkId( cookie.getValue() );
			for(int i=0; i<intarr.length; i++) {
				cart.setcId(intarr[i]);
				cartService.deleteCart(cart);
			}	
			
		//회원 장바구니 삭제
		} else if(uId != null) {
			cart.setuId(uId);
			for(int i=0; i<intarr.length; i++) {
				cart.setcId(intarr[i]);
				cartService.deleteCart(cart);
			}
		}
		return "delete_success";
	}
	
	//수량변경
	@RequestMapping("/updateQty")
	@ResponseBody
	public String updateQty(
			@RequestBody Cart cart, 
			HttpSession session,
			@CookieValue(value="cartid", required=false) Cookie cookie
			) {
		String uId = (String) session.getAttribute("uId");

		//비회원 장바구니 삭제
		if(uId == null && cookie != null) {
			cart.setCkId(cookie.getValue());
			cartService.updateQty(cart);
		//회원 장바구니 삭제
		} else if(uId != null) {
			cart.setuId(uId);
			cartService.updateQty(cart);
			
		}
		return "update_done";
	}
}
