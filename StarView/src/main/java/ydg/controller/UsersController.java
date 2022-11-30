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
	
	@Autowired UsersService userService;
	
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
	public void joinResult(Users users, String mail, String email_id, String email_domain) {
		logger.info("/users/join [POST]");
		
		logger.info("email_id {}", email_id);
		logger.info("email_domain {}", email_domain);
		
		users.setuAddress(email_id + "@" + email_domain);
		
		logger.info("users {}", users.getuAddress());
		
		
	}
	
}
