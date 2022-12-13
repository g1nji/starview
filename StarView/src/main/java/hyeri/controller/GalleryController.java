package hyeri.controller;

import java.util.ArrayList;
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

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import hyeri.dto.GTag;
import hyeri.dto.Gallery;
import hyeri.dto.GalleryFile;
import hyeri.service.face.GalleryService;
import hyeri.util.Paging;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GalleryService galleryService;
	
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Model model,
			Gallery viewGallery) {
		
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
		logger.info("{}", viewGallery);
		
		//모델값 전달
		model.addAttribute("viewGallery", viewGallery);
		
		//첨부파일 모델값 전달
		GalleryFile galleryFile = galleryService.getAttachFile(viewGallery);
		logger.info("{}", galleryFile);
		model.addAttribute("galleryFile", galleryFile);
		
	}
	
	@GetMapping("/write")
	public void write() {
		logger.info("/write [GET]");
		
	}
	
	@PostMapping("/write")
	public String writeProc(
			Gallery gallery,
			MultipartFile file,
			HttpSession session,
			String tag
			) {
		
		logger.info("/write [POST]");
		
		logger.info("gallery : {}", gallery);
		logger.info("file : {}", file);

		logger.info("{}", tag);
		
		if( tag != null && !tag.equals("") ) {
			
			JsonArray jsonArray = JsonParser.parseString(tag).getAsJsonArray();
			logger.info("jsonArray {}", jsonArray );
			
			List<GTag> tagList = new ArrayList<GTag>();
			
			for( int i=0; i<jsonArray.size(); i++) {
				String t = jsonArray.get(i).getAsJsonObject().get("value").getAsString();
				logger.info("t {}", t);
				
				tagList.add( new GTag(0, t) );
			}
			
			logger.info("tagList {}", tagList);
			
			//게시글, 첨부파일, 태그
			galleryService.write(gallery, file, tagList);
			
			
			
		} else {
			galleryService.write2(gallery, file);
		}
	
		
		//작성자 정보 추가
		logger.info("{}", gallery);
		
		
		return "redirect:./list";
	}
	
	@GetMapping("/update")
	public String update(Gallery viewGallery, Model model) {
		logger.info("{}", viewGallery);
		
		//게시글 조회
		viewGallery = galleryService.view(viewGallery);
		logger.info("조회된 게시글 {}", viewGallery);
		
		//모델값 전달
		model.addAttribute("updateGallery", viewGallery);
		
		//첨부파일 모델값 전달
		GalleryFile galleryFile = galleryService.getAttachFile(viewGallery);
		model.addAttribute("galleryFile", galleryFile);
		
		logger.info("updateGallery {}", viewGallery);
		logger.info("galleryFile {}", galleryFile);
		return "/gallery/update";
	}
	
	@PostMapping("/update")
	public String updateProcess(Gallery viewGallery, MultipartFile file) {
		logger.info("/update [POST]");
		
		galleryService.update(viewGallery, file);
		
		return "redirect:/gallery/view?galleryNo=" + viewGallery.getGalleryNo();
	}
	
	@RequestMapping("/delete")
	public String delete(Gallery gallery) {
		
		galleryService.delete(gallery);
		
		return "redirect:./list";
	}
	
	@PostMapping("/search")
	public String search(String keywordInput, Model model) {
		
		logger.info("{}", "/search");
		logger.info("{}", keywordInput);
		
		if( keywordInput != null && !keywordInput.equals("") ) {
			
			List<Gallery> gallery = galleryService.search(keywordInput);
			
			model.addAttribute("gallery", gallery);
			
			return "redirect:./search_list";

		} else {
		
			return "redirect:./search_not-found";
		}
		
	}

}
