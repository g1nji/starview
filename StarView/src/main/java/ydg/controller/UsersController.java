package ydg.controller;

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
	public void joinResult(Users users, Model model) {
		logger.info("/users/join [POST]");
		
		logger.info("Users " + users);
		
		//회원가입 정보 DB에 저장
		usersService.insert(users);
		
	}
	
	@RequestMapping("/checkid")
    public String idcheck(String uId, Model model) {
        
        logger.info("userId : {}",uId);
 
        int count = usersService.idcheck(uId);
        logger.info("count, {}", count);
        
        model.addAttribute("count", count );
        
        return "/users/doneid";
    }
	
	@RequestMapping("/doneid")
	public void doneid() {
		
	}
	
	
	
}
