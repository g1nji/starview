package hyeri.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hyeri.dto.AfterOrder;
import hyeri.service.face.OrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired OrderService orderService;
	
	@RequestMapping("/orderSheet")
	public void order(HttpSession session, Model model) {
		
		logger.info("totalCart : {}", session.getAttribute("totalCart"));
		logger.info("cartList : {}", session.getAttribute("cartList"));
	
		model.addAttribute("cartList", session.getAttribute("cartList"));
		
	}
	
	@PostMapping("/payment")
	public void payment(AfterOrder afOrder, Model model) {
		
		//주문정보 DB 저장
		logger.info("{}", afOrder);
		
		orderService.addOrder(afOrder);
		
		logger.info("{}", afOrder);
		//결제 시 필요한 정보 모델값 전달
//		model.addAttribute("amount", afOrder.getPaymentAmount());
//		model.addAttribute("buyerName", afOrder.getBuyerName());
//		model.addAttribute("buyerTel", afOrder.getBuyerPhone());
//		model.addAttribute("buyerEmail", afOrder.getBuyerEmail());
		
		model.addAttribute("OrderList", afOrder);
		
	}
	
	@PostMapping("/complete")
	public String paymentComplete(AfterOrder afOrder, Model model, HttpServletRequest req) {
		
		//주문번호 DB 추가
		logger.info("{}", afOrder);
		
		String puid = afOrder.getPerchantUid();
		orderService.addPUID(puid);
		
		logger.info(req.getParameter("orderList"));
		
//		model.addAttribute("perchantUid", puid);
		
		model.addAttribute("OrderList", afOrder);
		
		return "/order/finish";
	}
	
	@RequestMapping("/finish")
	public void orderFinish(AfterOrder afOrder, Model model, HttpSession session) {
		
		logger.info("afOrder : {}", afOrder);
		
//		model.addAttribute("paymentMethod", afOrder.getPaymentMethod());
//		model.addAttribute("perchantUid", afOrder.getPerchantUid());
//		model.addAttribute("amount", afOrder.getPaymentAmount());
//		model.addAttribute("buyerName", afOrder.getBuyerName());
//		model.addAttribute("buyerTel", afOrder.getBuyerPhone());
//		model.addAttribute("buyerEmail", afOrder.getBuyerEmail());
		
	}
	
	@PostMapping("/result")
	public void orderResult(AfterOrder afOrder, Model model, HttpSession session) {
		
		logger.info("afOrder : {}", afOrder);

		orderService.addOrder(afOrder);
		
		logger.info("afOrder : {}", afOrder);
		
		//주문번호 추가
		
		model.addAttribute("orderList", afOrder);
		
	}
}
