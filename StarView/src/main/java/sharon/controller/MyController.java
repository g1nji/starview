package sharon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import sharon.service.face.MyService;
import ydg.dto.Users;
@RequestMapping("/mypage")
@Controller
public class MyController {
	
	@Autowired private MyService myService;

	//회원정보 상세
	@RequestMapping("/MyDetail")
	public void MyDetail(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.getAttribute("uId");
		model.addAttribute("Users", session.getAttribute("uId"));
		
//		 return mypage/MyDetail;
	}
	//회원정보 수정
	@RequestMapping("/Modify")
    public String Modify(Users users) {
        myService.Modify(users);

        return "forward:/";
    }
	
	//회원 탈퇴
    @RequestMapping("/withDraw")
    public String withDraw(Users users, HttpSession session) {
    	myService.withDraw(users);
        session.invalidate();

        return "redirect:/";
    }
}
