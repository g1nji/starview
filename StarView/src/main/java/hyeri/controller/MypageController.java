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

import hyeri.dto.GComment;
import hyeri.dto.Gallery;
import hyeri.service.face.MypageService;
import hyeri.util.Paging2;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MypageService mypageService;
	
	@RequestMapping("/writeList")
	public void writeList(@RequestParam(defaultValue = "0") int curPage
			, Model model
			, HttpSession session) {
		
		String uId = (String)session.getAttribute("uId");
		logger.info("uId : {}", uId);
		
		Paging2 paging = mypageService.getPaging(curPage, uId);
		model.addAttribute("paging", paging);
		
		//작성한 글 조회
		List<Gallery> list = mypageService.list(paging, uId);
		for( Gallery g : list ) logger.info("{}", g);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/writeCList")
	public void writeCList(@RequestParam(defaultValue = "0") int curPage
		, Model model
		, HttpSession session) {
		
		String uId = (String) session.getAttribute("uId");
		
		Paging2 paging = mypageService.getPaging2(curPage, uId);
		model.addAttribute("paging", paging);
		
		//작성한 덧글 조회
		List<GComment> clist = mypageService.clist(paging, uId);
		for( GComment c : clist ) logger.info("{}", c);
		model.addAttribute("clist", clist);
	}

}
