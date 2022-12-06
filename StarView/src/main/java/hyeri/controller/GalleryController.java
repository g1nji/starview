package hyeri.controller;

import java.util.List;

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
import org.springframework.web.multipart.MultipartFile;

import hyeri.dto.Gallery;
import hyeri.service.face.GalleryService;
import hyeri.util.Paging;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GalleryService galleryService;
	
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Model model) {
		
		Paging paging = galleryService.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Gallery> list = galleryService.list(paging);
		for( Gallery g : list ) logger.info("{}", g);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("/view")
	public void view(Gallery viewGallery, Model model) {
		logger.info("/view");
		
		//게시글 조회
		viewGallery = galleryService.view(viewGallery);
		logger.info("조회된 게시글 {}", viewGallery);
		
		//모델값 전달
		model.addAttribute("viewGallery", viewGallery);
		
	}
	
	@GetMapping("/write")
	public void write() {
		logger.info("/write [GET]");
		
	}
	
	@PostMapping("/write")
	public String writeProc(
			Gallery gallery,
			MultipartFile file
//			,HttpSession session
			) {
		logger.info("/write [POST]");
		logger.info("{}", gallery);
		logger.info("{}", file);
		
		//작성자 정보 추가
//		writeParam.setUserId( (String) session.getAttribute("id") );
//		logger.info("{}", writeParam);
		
		//게시글, 첨부파일 처리
		galleryService.write(gallery, file);
		
		return "redirect:/";
	}

}
