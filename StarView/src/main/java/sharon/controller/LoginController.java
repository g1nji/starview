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
import sharon.service.face.LoginService;
import ydg.dto.Users;

@Controller
@RequestMapping("/mypage")
public class LoginController {
	
	private final Logger logger= LoggerFactory.getLogger(this.getClass());

		//서비스 객체
		@Autowired private LoginService loginService;
		@Autowired private LoginDao loginDao;
		
		//마이페이지 회원정보
	  @RequestMapping("/mypage")
	  public void mypage(HttpSession session,Model model) {			  
		  logger.info("/mypage");
			  
		 String loginid=(String) session.getAttribute("uId");
		 logger.info("loginid:{}",loginid);
			  
		 Users info=loginService.info(loginid);
		 logger.info("조회결과:{}",info);
			  
		 model.addAttribute("info",info);
			  
}

		  //회원정보 수정 전 비밀번호 확인
		  @GetMapping("/preupdate")
		  public String pwCheck1(HttpSession session,Model model,Users users) {
			  logger.info("/preupdate [get]");
			
			  
			  model.addAttribute("users",loginService.info((String)session.getAttribute("uId")));
			  logger.info("users.model");
			  
			  return "/mypage/preupdate";
		  }
		  
		  @PostMapping("/preupdate")
		  public String pwCheck2(HttpSession session,Model model,Users users,Users usersParam) {
			  logger.info("/preupdate [post]");
			  
			  boolean res=loginService.pwCheck(usersParam);

			  if(res) {
				  logger.info("비번일치");
				  model.addAttribute("users",loginService.info((String)session.getAttribute("uId")));
				  return "/mypage/update";
			  }else {
				  logger.info("비번불일치");
				  model.addAttribute("msg","비밀번호 불일치");
				  return "/mypage/preupdate";
			  }
			  
		  }
		  
		  //회원정보 수정
		  @GetMapping("/update")
		  public String update(HttpSession session,Model model,Users users) {
			  logger.info("/update [get]");
			  
			  model.addAttribute("users",loginService.info((String)session.getAttribute("uId")));
			  logger.info("users.model");
			  
			  return "/mypage/update";
		  }
		  @PostMapping("/update")
		  public String updateProc(Users users) {
			  logger.info("/update [post]");
			  
			  loginService.update(users);
			  return "redirect:/mypage/mypage";
		  }
		  
		  
		//회원정보 탈퇴 전 비밀번호 확인
		  @GetMapping("/predelete")
		  public String predelete(HttpSession session,Model model,Users users) {
			  logger.info("/preupdate [get]");
			
			  
			  model.addAttribute("users",loginService.info((String)session.getAttribute("uId")));
			  logger.info("users.model");
			  
			  return "/mypage/predelete";
		  }
		  
		  @PostMapping("/predelete")
		  public String predelete(HttpSession session,Model model,Users users,Users usersParam) {
			  logger.info("/preupdate [post]");
			  
			  boolean res=loginService.pwCheck(usersParam);

			  if(res) {
				  logger.info("비번일치");
				  String loginid=(String) session.getAttribute("uId");
				  loginService.delete(loginid);
			      session.invalidate();
				  return "/mypage/delete";
			  }else {
				  logger.info("비번불일치");
				  model.addAttribute("msg","비밀번호 불일치");
				  return "/mypage/predelete";
			  }
			  
		  }
		  



}
