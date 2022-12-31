package hyeri.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hyeri.dto.AfterOrder;
import hyeri.dto.BeforeOrder;

@Controller
@RequestMapping("/order")
public class OrderController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/orderSheet")
	public void order(HttpSession session, Model model) {
		
		logger.info("totalCart : {}", session.getAttribute("totalCart"));
		logger.info("cartList : {}", session.getAttribute("cartList"));
	
		model.addAttribute("cartList", session.getAttribute("cartList"));
		
	}
	
	@PostMapping("/payment")
	public void payment(AfterOrder afOrder, Model model) {
		
		logger.info("{}", afOrder.getPaymentAmount());
		logger.info("{}", afOrder.getBuyerName());
		logger.info("{}", afOrder.getBuyerPhone());
		logger.info("{}", afOrder.getBuyerEmail());
		
		model.addAttribute("amount", afOrder.getPaymentAmount());
		model.addAttribute("buyerName", afOrder.getBuyerName());
		model.addAttribute("buyerTel", afOrder.getBuyerPhone());
		model.addAttribute("buyerEmail", afOrder.getBuyerEmail());
	}
	
	@PostMapping("/complete")
	public void paymentComplete(AfterOrder afOrder) {
		
		logger.info("{}", afOrder);
	}
	
	@RequestMapping("/finish")
	public void orderFinish(AfterOrder afOrder, Model model) {
		
		logger.info("afOrder : {}", afOrder);
		
		model.addAttribute("paymentMethod", afOrder.getPaymentMethod());
		model.addAttribute("perchantUid", afOrder.getPerchantUid());
		model.addAttribute("amount", afOrder.getPaymentAmount());
		model.addAttribute("buyerName", afOrder.getBuyerName());
		model.addAttribute("buyerTel", afOrder.getBuyerPhone());
		model.addAttribute("buyerEmail", afOrder.getBuyerEmail());
	}
	
	@PostMapping("/result")
	public void orderResult(BeforeOrder bfOrder, AfterOrder afOrder, Model model) {
		
		logger.info("bfOrder : {}", bfOrder);
		logger.info("afOrder : {}", afOrder);
		
		model.addAttribute("paymentMethod", afOrder.getPaymentMethod());
		model.addAttribute("perchantUid", afOrder.getPerchantUid());
		model.addAttribute("amount", afOrder.getPaymentAmount());
		model.addAttribute("buyerName", afOrder.getBuyerName());
		model.addAttribute("buyerTel", afOrder.getBuyerPhone());
		model.addAttribute("buyerEmail", afOrder.getBuyerEmail());
		
	}
}
