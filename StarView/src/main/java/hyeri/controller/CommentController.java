package hyeri.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@PostMapping("/write")
	public String postCmWrite(GComment gComment, Gallery gallery) {
		
		logger.info("/write [POST]");
		logger.info("{}", gComment);
		
		//덧글 작성
		commentService.write(gComment);
		
		logger.info("{}", gComment);
		
		return "redirect:/gallery/view?galleryNo=" + gallery.getGalleryNo();
	}
	
}
