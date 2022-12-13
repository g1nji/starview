package yewon.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import yewon.dto.Cart;
import yewon.service.face.CartService;

@Controller
public class CartController {

	@Autowired private CartService cartService;
	
	@RequestMapping("/goods/cart")
	public void viewCart(Cart cart) {
		
	}
	
	public void addCart(@RequestBody Cart cart, Model model) {
		cartService.addCart(cart);
	}
	
	public void deleteCart(@RequestBody Cart cart, Model model) {
		cartService.deleteCart(cart);
	}
}
