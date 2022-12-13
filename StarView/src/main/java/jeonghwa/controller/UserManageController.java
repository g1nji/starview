package jeonghwa.controller;

import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jeonghwa.dto.Users;
import jeonghwa.service.face.UserManageService;
import jeonghwa.util.Paging;

@Controller
@RequestMapping("/admin/user")
public class UserManageController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired UserManageService userManageService;
	
	@RequestMapping("/list")
	public void list(
			@RequestParam(value = "curPage", defaultValue = "0") int curPage,
			Model model
			) {
		logger.info("/user/list [GET]");
		
		//전달파라미터에서 현재 페이징 객체 계산하기
		Paging paging = userManageService.getPaging(curPage);
		logger.debug("{}", paging);
		
		//페이징 객체를 MODEL값 전달
		model.addAttribute("paging", paging);
		
		
		//회원 페이징 목록 조회
		List<Users> list = userManageService.list(paging);
		
		//조회 결과 확인
		for( Users u : list )
		logger.debug("{}", u);
		
		//조회결과를 MODEL값 전달
		model.addAttribute("list", list);	
		
	}
	
	
	@RequestMapping("/view")
	public String view(Users uNo, Model model) {
		
		return "redirect:/admin/user/list";
	}
	
}















