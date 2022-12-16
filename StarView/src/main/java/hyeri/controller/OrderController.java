package hyeri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {

	@RequestMapping("/orderSheet")
	public void order() {
	
	}
	
	@PostMapping("/result")
	public void orderResult() {
		
	}
}
