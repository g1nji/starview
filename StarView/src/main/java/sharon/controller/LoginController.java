package sharon.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import sharon.dao.face.LoginDao;
import sharon.dto.Login;
import sharon.service.face.LoginService;
import ydg.dto.Users;

@Controller
public class LoginController {
	
	//로그 객체(자기참조:this를 사용한다면 static없애고 하면 된다)
	private final Logger logger= LoggerFactory.getLogger(this.getClass());

		//서비스 객체
		@Autowired private LoginService loginService;
		@Autowired private LoginDao loginDao;
		
		
		@RequestMapping("/login/main")
		public void main() {
			logger.info("/login/main [GET]");
		}
		
		@GetMapping("/login/join")
		public void join() {
			logger.info("/login/join [GET]");
		}
		
		@PostMapping("/login/join")
		public String joinProc(Login joinParam) {
			logger.info("/login/join [POST]");
			logger.info("{}",joinParam);
			
			loginService.join(joinParam);
			
			return "redirect:/login/main";
		}
		
		
		  @GetMapping("/login/login")
		  public void login() {
			  logger.info("/login/login [GET]");
		  }
		  
		  @PostMapping("/login/login") 
		  public String loginProc(Login loginParam,HttpSession session) {
		  logger.info("/login/login [POST]");
		  logger.info("{}",loginParam);
		  
		  boolean isLogin=loginService.login(loginParam);
		  logger.info("isLogin:{}",isLogin);
		  
		  if(isLogin) { //로그인 성공
			  session.setAttribute("isLogin", isLogin);
			  session.setAttribute("loginid", loginParam.getId()); //꼭 pk를 넣는다
		  }else {//로그인 실패
			session.invalidate();  
		  }
		  return "redirect:/login/main";
		  
		  }
		  @RequestMapping("/login/logout")
		  public String logout(HttpSession session) {
			  logger.info("/login/logout");
			  
			  session.invalidate();
			  
			  return "redirect:/login/main";
		  }
		  
		  @RequestMapping("/mypage/mypage")
		  public void mypage(HttpSession session,Model model) {
			  logger.info("/mypage/mypage");
			  
			  String loginid=(String) session.getAttribute("loginid");
			  logger.info("loginid:{}",loginid);
			  
			  Login info=loginService.info(loginid);
			  logger.info("조회결과:{}",info);
			  
			  model.addAttribute("info",info);
			  
		  }
		  
		  @RequestMapping("/delete")
		    public String delete(Users users, HttpSession session) {
			  
			  String loginid=(String) session.getAttribute("loginid");
			  loginService.delete(loginid);
		      session.invalidate();

		        return "/mypage/delete";
		    }


}
