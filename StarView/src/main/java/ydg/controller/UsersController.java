package ydg.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void loginResult() {
		logger.info("/users/login [POST]");
		
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
	public void joinResult(Users users, String uAdd1, String uAdd2, String email_domain) {
		logger.info("/users/join [POST]");
		
		logger.info("Users " + users);
		
		//회원가입 정보 DB에 저장
		Users user = usersService.insert(users);
		
	}
	
}
