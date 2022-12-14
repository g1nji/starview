package ydg.controller;

import java.util.HashMap;
import java.util.List;

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
			session.setAttribute("login", loginResult);	//true
			
			//유저 닉네임 조회
			String uNick = usersService.finduNick(users);
			
			logger.info("{}", uNick);
			
			session.setAttribute("uId", users.getuId());
//			session.setAttribute("uNick", users.getuNick());
			session.setAttribute("uNick", uNick);
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
		
		logger.info("로그아웃");
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
	
	@RequestMapping("/oauth")
	public String kakaoLogin(@RequestParam(value="code", required = false) String code, Users users, HttpSession session) {
		logger.info("/users/oauth");
		
		logger.info("########" + code);
		
		String access_Token = usersService.getAccessToken(code);
		logger.info("###access_Token### : " + access_Token);
		
		HashMap<String, Object> userInfo = usersService.getUserInfo(access_Token);
		logger.info("###access_Token#### : " + access_Token);
		logger.info("###nickname#### : " + userInfo.get("nickname"));
		logger.info("###email#### : " + userInfo.get("email"));
		logger.info("###gender#### : " + userInfo.get("gender"));
		
		String email = (String) userInfo.get("email");
		String[] emailSpl = email.split("@");
		String id = emailSpl[0];
		String gender = (String) userInfo.get("gender");
		logger.info("id {}", id);
		
		users.setuId(id);
		users.setuEmail(email);
		users.setuGender(gender);
		
		boolean joinResult = usersService.insert(users);
		
		if(joinResult) {
			logger.info("가입완료");
		} else {
			logger.info("이미 존재하는 아이디");
		}
		
		session.setAttribute("login", true);
		session.setAttribute("uId", users.getuId());
		
		return "redirect:/";
	}
	
	@GetMapping("/findid")
	public void findid() {
		logger.info("/users/findid [GET]");
		
		
	}
	
	@PostMapping("/findid")
	public String findidResult(String find, String phoneName, String mailName, Users users, Model model) {
		logger.info("/users/findid [POST]");
		
		List<Users> userId = usersService.findId(find, phoneName, mailName, users);
		
		model.addAttribute("find", find);
		model.addAttribute("userId", userId);
		
		return "/users/findidresult";
	}
	
	@RequestMapping("/findidresult")
	public void findidresult() {
		
	}
	
	@GetMapping("/findpw")
	public void findpw() {
		
	}
	
	
}
