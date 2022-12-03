package jeonghwa.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jeonghwa.dto.Users;
import jeonghwa.service.face.AdminLoginService;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {

	//로그 객체
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired AdminLoginService adminLoginservice;
			

	@RequestMapping("/main")
	public void main() {
		logger.info("/admin/main");

	}
	
	
	@GetMapping("/login")
	public void AdminLogin() {
		
		logger.info("/admin/login [GET]");
		
		
	}

	
	
	@PostMapping("/login")
	public String AdminLoginProc(Users loginParam, HttpSession session) {
		
		logger.info("/admin/login [POST]");
		logger.info("{}", loginParam);
		
		//로그인 인증
		boolean isLogin = adminLoginservice.login(loginParam);
		logger.info("isLogin : {}", isLogin);
		
		//로그인 인증 성공
		if (isLogin) {
			logger.info("로그인 성공");
			
			session.setAttribute("isLogin", isLogin);
			session.setAttribute("id", loginParam.getuId());
		} else {
			session.invalidate();
		}
		
		//로그인 성공 후 메인페이지로 리다이렉트
		return "redirect:/admin/main";
		
		
	}
	
	@RequestMapping("/logout")
	public String AdminLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/admin/login";
		
		
	}
	
	
}
























