package ydg.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ydg.dto.Users;
import ydg.service.face.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UsersService usersService;
	
	@GetMapping("/login")
	public void login() {
		logger.info("/users/login [GET]");
	}
	
	@PostMapping("/login")
	public String loginResult(Users users, HttpSession session, HttpServletResponse reps) {
		logger.info("/users/login [POST]");
		
		logger.info("users {}", users);
		
		boolean loginResult = usersService.login(users);
		logger.info("loginResult : {}", loginResult);
		
		if(loginResult) {
			logger.info("로그인 성공");
			
			//세션 저장
			session.setAttribute("login", loginResult);
			session.setAttribute("uId", users.getuId());
			session.setAttribute("uNick", users.getuNick());
			session.setAttribute("uName", users.getuName());
			
			//쿠키 저장
			Cookie cookie = new Cookie("userInputId", users.getuId());
			
			reps.addCookie(cookie);
			
			return "redirect:/";
			
		} else {
			logger.info("로그인 실패");
			
			session.invalidate();
			
			return "redirect:/users/login";
		}
		
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/agree")
	public void agree() {
		logger.info("/users/agree");
	}
	
	@GetMapping("/join")
	public void join() {
		logger.info("/users/join");
		
	}
	
	@PostMapping("/join")
	public String joinResult(Users users, Model model) {
		logger.info("/users/join [POST]");
		
		logger.info("Users " + users);
		
		//회원가입 정보 DB에 저장
		boolean joinResult = usersService.insert(users);
		
		if( joinResult ) {
			logger.info("회원가입 성공");
			model.addAttribute("users", users);
			return "/users/doneid";
		} else {
			logger.info("회원가입 실패");
			return "redirect:/member/join";
		}
		
		
	}
	
	@RequestMapping("/checkid")
    public void idcheck(String uId, Model model) {
        
        logger.info("userId : {}",uId);
 
        int count = usersService.idcheck(uId);
        logger.info("count, {}", count);
        
        model.addAttribute("count", count );
        
    }
	
	@RequestMapping("/doneid")
	public void doneid() {
		
	}
	
	
	
	
}
