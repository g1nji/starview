package yewon.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import yewon.dto.Cart;
import yewon.service.face.CartService;

@Controller
@RequestMapping("/goods")
public class CartController {

	@Autowired private CartService cartService;

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//비회원 카트조회
	@RequestMapping("/nonuser")
	public void nonuserCart(HttpSession session) {
		List<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList"); 
		logger.info("session cart : {}", cartList);
		if(session.getAttribute("totalCart")!=null) {
			int cnt = (Integer) session.getAttribute("totalCart");
			logger.info("session totalCart : {}", cnt);
		}
	}
	
	//회원카트조회
	@RequestMapping("/cart")
	public void viewCart(
			HttpSession session, 
			Cart cart, 
			Model model) {
		String uId = (String) session.getAttribute("uId");
		logger.info("viewCart - uId: {}", uId);
		cart.setuId(uId);
		List<Cart> cartList = cartService.viewCart(cart);
		model.addAttribute("cartList", cartList);
		model.addAttribute("totalCart", cartService.getCartTotal(cart));
	}
	
	@RequestMapping("/addCart")
	@ResponseBody
	public String addCart( @RequestBody Cart cart, HttpSession session ) {
		
		//세션에서 꺼내온 리스트
		List<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList"); 
		logger.info("session cart : {}", cartList);
		logger.info("cart param : {}", cart);
		String uId = (String) session.getAttribute("uId");


		//비회원 장바구니 상품추가	
		if( uId == null ) {
			
			
			if( cartList == null) {
				//상품정보 가져오기
				Cart c = cartService.nonuserCart(cart);
				c.setcQty(cart.getcQty());
				cartList = new ArrayList<>();
				cartList.add(c);
				logger.info("addCart() - nonuserList: {}", cartList);
				session.setAttribute("cartList", cartList);
				session.setAttribute("totalCart", cartList.size());

				//비회원 장바구니 추가(세션값 null이 아닐 때)
			} else {
				
				boolean isExistGoods = false;
				Cart addItem = null;
				
				
				for(Cart goods : cartList) {
					if( goods.getgId() == cart.getgId() ) {
						isExistGoods = true;
					} 
				}
				
				
				if( isExistGoods ) {
					return "already_exist";
				} else {
					//추가할 상품
					addItem = cartService.nonuserCart(cart);
					addItem.setcQty(cart.getcQty());
					
					cartList.add( addItem );
					logger.info("중복체크후 cartList : {}", cartList);
					session.setAttribute("cartList", cartList);
					session.setAttribute("totalCart", cartList.size());
				}
			}
		}
		
		
		//회원 장바구니 상품추가
		if( uId != null ) {	
			cart.setuId(uId);
			//장바구니 중복체크
			int addCheck = cartService.addCheck(cart);
			if(addCheck > 0) {
				return "already_exist";
			} else {
				cartService.addCart(cart);
			}
		}
		
		return "add_success";
	}
	
	//개별상품 삭제
	@RequestMapping(value = "/deleteCart", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCart(
			@RequestBody Map<String, Integer> param, 
			Cart cart,
			HttpSession session) {
		
		List<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList"); 
		String uId = (String) session.getAttribute("uId");
		int gId = param.get("gId");

		//비회원 장바구니 삭제
		if( uId == null ) {
			for(int i=0; i<cartList.size(); i++) {
				if(gId == cartList.get(i).getgId()) {
					cartList.remove(i);
				}
				session.setAttribute("cartList", cartList);
				session.setAttribute("totalCart", cartList.size());
			}
		//회원 장바구니 삭제
		} else if(uId != null) {
			cart.setuId(uId);
			cart.setgId(gId);
			logger.info("cart: {}", cart);
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
			HttpSession session
			) {
		
		List<Cart> cartList = (ArrayList<Cart>) session.getAttribute("cartList"); 
		String uId = (String) session.getAttribute("uId");
		List<Integer> gidlist = param.get("chbox");
		logger.info("param : {}", param.get("chbox"));
		int[] arr = gidlist.stream().mapToInt(Integer::intValue).toArray(); 

		//비회원 장바구니 삭제
		if( uId == null ) {
			for(int i=0; i<arr.length; i++) {
				for(int j=0; i<cartList.size(); j++) {
					if(arr[i] == cartList.get(i).getgId()) {
						cartList.remove(i);
					}
					session.setAttribute("cartList", cartList);
					session.setAttribute("totalCart", cartList.size());
				}	
			}
		//회원 장바구니 삭제
		} else if(uId != null) {
			cart.setuId(uId);
			for(int i=0; i<arr.length; i++) {
				cart.setgId(arr[i]);
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
			HttpSession session
			) {
		String uId = (String) session.getAttribute("uId");

		//비회원 장바구니 삭제
//		if(uId == null) {
//			cartService.updateQty(cart);
		//회원 장바구니 삭제
//		} else if(uId != null) {
			cart.setuId(uId);
			cartService.updateQty(cart);
			
//		}
		return "update_done";
	}
}
