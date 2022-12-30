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
	
	@PostMapping("/result")
	public void orderResult(BeforeOrder bfOrder, AfterOrder afOrder) {
		
		logger.info("bfOrder : {}", bfOrder);
		logger.info("afOrder : {}", afOrder);
		
	}
}
