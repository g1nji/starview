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
@RequestMapping("/mypage")
public class LoginController {
	
	//로그 객체(자기참조:this를 사용한다면 static없애고 하면 된다)
	private final Logger logger= LoggerFactory.getLogger(this.getClass());

		//서비스 객체
		@Autowired private LoginService loginService;
		@Autowired private LoginDao loginDao;
		
		
		@RequestMapping("/main")
		public void main() {
			logger.info("/login/main [GET]");
		}
		
		@GetMapping("/join")
		public void join() {
			logger.info("/login/join [GET]");
		}
		
		@PostMapping("/join")
		public String joinProc(Users joinParam) {
			logger.info("/login/join [POST]");
			logger.info("{}",joinParam);
			
			loginService.join(joinParam);
			
			return "redirect:/main";
		}
		
		
		  @GetMapping("/login")
		  public void login() {
			  logger.info("/login/login [GET]");
		  }
		  
		  @PostMapping("/login") 
		  public String loginProc(Users usersParam,HttpSession session) {
		  logger.info("/login/login [POST]");
		  logger.info("{}",usersParam);
		  
		  boolean isLogin=loginService.login(usersParam);
		  logger.info("isLogin:{}",isLogin);
		  
		  if(isLogin) { //로그인 성공
			  session.setAttribute("isLogin", isLogin);
			  session.setAttribute("loginid", usersParam.getuId()); //꼭 pk를 넣는다
		  }else {//로그인 실패
			session.invalidate();  
		  }
		  return "redirect:/mypage/main";
		  
		  }
		  @RequestMapping("/logout")
		  public String logout(HttpSession session) {
			  logger.info("/login/logout");
			  
			  session.invalidate();
			  
			  return "redirect:/mypage/main";
		  }
		  
		  @RequestMapping("/mypage")
		  public void mypage(HttpSession session,Model model) {
			  logger.info("/login/mypage");
			  
			  String loginid=(String) session.getAttribute("loginid");
			  logger.info("loginid:{}",loginid);
			  
			  Users info=loginService.info(loginid);
			  logger.info("조회결과:{}",info);
			  
			  model.addAttribute("info",info);
			  
		  }
		  
		  @GetMapping("/update")
		  public String update(HttpSession session,Model model,Users users) {
			  logger.info("/login/update [get]");
			  //회원정보 조회
//			  String loginid=(String) session.getAttribute("loginid");
//			  Login info=loginService.info(loginid);
			  model.addAttribute("users",loginService.info((String)session.getAttribute("loginid")));
			  logger.info("users.model");
			  
			  return "/mypage/update";
		  }
		  @PostMapping("/update")
		  public String updateProc(Users users) {
			  logger.info("/login/update [post]");
			  
			  loginService.update(users);
			  return "redirect:/mypage/mypage";
		  }
		  
		  
		  
		  @RequestMapping("/delete")
		    public String delete(Users users, HttpSession session) {
			  
			  String loginid=(String) session.getAttribute("loginid");
			  loginService.delete(loginid);
		      session.invalidate();

		        return "/mypage/delete";
		    }



}
