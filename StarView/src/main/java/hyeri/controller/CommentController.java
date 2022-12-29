package hyeri.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import hyeri.dto.GComment;
import hyeri.dto.Gallery;
import hyeri.service.face.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired CommentService commentService;

	private Logger logger = LoggerFactory.getLogger(this.getClass());

//	덧글 작성
	@PostMapping("/write")
	public String postCmWrite(GComment gComment, Gallery gallery) {
		
		logger.info("/write [POST]");
		logger.info("{}", gComment);
		
		//덧글 작성
		commentService.write(gComment);
		
		logger.info("{}", gComment);
		
		return "redirect:/gallery/view?galleryNo=" + gallery.getGalleryNo();
	}
	
	
//	덧글 수정 get
	@GetMapping("/modify")
	public void modifyComment(
			GComment gComment
			, Model model
			) {
		
		
	}
	
//	덧글 수정 post
	@PostMapping("/modify")
	public String modifyComment(
			HttpServletRequest req
			) {
		
		
		String referer = req.getHeader("Referer");
		return "redirect:"+ referer;
	}
	
//	덧글 삭제
	@RequestMapping("/delete")
	public String deleteComment(
			GComment gComment
			, HttpServletRequest req
			) {
		
		commentService.delete(gComment);
		
		String referer = req.getHeader("Referer");
	    return "redirect:"+ referer;
	}
	
	
	
//	덧글 신고
	@PostMapping("/report")
	public String cmReport() {
		
		return "";
	}
	
}
