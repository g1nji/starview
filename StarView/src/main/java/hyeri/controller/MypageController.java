package hyeri.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hyeri.dto.Gallery;
import hyeri.service.face.MypageService;
import hyeri.util.Paging2;
import ydg.dto.Users;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MypageService mypageService;
	
	@RequestMapping("/writeList")
	public void writeList(@RequestParam(defaultValue = "0") int curPage
			, Model model
			, HttpSession session) {
		
		Paging2 paging = mypageService.getPaging(curPage);
		model.addAttribute("paging", paging);
		
		String uId = (String)session.getAttribute("uId");
		logger.info("uId : {}", uId);
		
		//작성한 글 조회
		List<Gallery> list = mypageService.list(uId);
		for( Gallery g : list ) logger.info("{}", g);
	}

}
