package hyeri.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

import hyeri.dto.GComment;
import hyeri.dto.GTag;
import hyeri.dto.Gallery;
import hyeri.dto.GalleryFile;
import hyeri.service.face.CommentService;
import hyeri.service.face.GalleryService;
import hyeri.util.Paging;

@Controller
@RequestMapping("/gallery")
public class GalleryController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired GalleryService galleryService;
	@Autowired CommentService commentService;
	
//	게시글 리스트 조회
	@RequestMapping("/list")
	public void list(@RequestParam(defaultValue = "0") int curPage, Model model,
			Gallery viewGallery, GComment gComment) {
		
		Paging paging = galleryService.getPaging(curPage);
		model.addAttribute("paging", paging);
		
		List<Gallery> list = galleryService.list(paging);
//		for( Gallery g : list ) logger.info("{}", g);
		model.addAttribute("list", list);
		
	}
	
	
//	게시글 상세 조회
	@RequestMapping("/view")
	public void view(Gallery viewGallery, int galleryNo, Model model, HttpSession session) {
		logger.info("/view");
		
		//게시글 조회
		viewGallery = galleryService.view(viewGallery);
		
		//모델값 전달
		model.addAttribute("viewGallery", viewGallery);
		
		//첨부파일 모델값 전달
		GalleryFile galleryFile = galleryService.getAttachFile(viewGallery);
		model.addAttribute("galleryFile", galleryFile);
		
		//덧글 조회
		List<GComment> list = null;
		list = commentService.view(galleryNo);
		
		//모델값 전달
		model.addAttribute("comment", list);
		
		//태그 조회
		List<GTag> list2 = null;
		list2 = galleryService.viewTag(galleryNo);
		
		logger.info("태그 리스트 : {}", list2);
		
		//모델값 전달
		model.addAttribute("tags", list2);
		
		//좋아요 확인
		String uId = (String)session.getAttribute("uId");
		int like = galleryService.findLike(galleryNo, uId);
		int getLike = galleryService.getLike(galleryNo);
		
		//모델값 전달
		model.addAttribute("like", like);
		model.addAttribute("getLike", getLike);
		
	}
	
	//좋아요 추가
	@PostMapping("/likeup")
	public String likeupPost(
			Gallery viewGallery
			, int galleryNo
			, String uId
			, Model model) {
		
		galleryService.likeUp(galleryNo, uId);
		
		return "redirect:/gallery/view?galleryNo=" + viewGallery.getGalleryNo();
	}
	
	//좋아요 취소
	@PostMapping("/likedown")
	public String likedownPost(
			Gallery viewGallery
			, int galleryNo
			, String uId
			, Model model) {
		
		galleryService.likeDown(galleryNo, uId);
		
		return "redirect:/gallery/view?galleryNo=" + viewGallery.getGalleryNo();
	}
	
//	게시글 작성 get
	@GetMapping("/write")
	public void write() {
		logger.info("/write [GET]");
		
	}
	
//	게시글 작성 post
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
		
//		태그가 있을 경우
		if( tag != null && !tag.equals("") ) {
			
			JsonArray jsonArray = JsonParser.parseString(tag).getAsJsonArray();
			logger.info("jsonArray {}", jsonArray );
			
			List<GTag> tagList = new ArrayList<GTag>();
			
			for( int i=0; i<jsonArray.size(); i++) {
				String t = jsonArray.get(i).getAsJsonObject().get("value").getAsString();
				logger.info("t {}", t);
				
				tagList.add( new GTag(0, t, 0) );
			}
			
			logger.info("tagList {}", tagList);
			
			//게시글, 첨부파일, 태그
			galleryService.write(gallery, file, tagList);
			
			
//		태그가 없을 경우
		} else {
			galleryService.write2(gallery, file);
		}
	
		
		//작성자 정보 추가
		logger.info("{}", gallery);
		
		
		return "redirect:./list";
	}
	
	
//	게시글 수정 get
	@GetMapping("/update")
	public String update(Gallery viewGallery, GTag tag, Model model) {
		logger.info("{}", viewGallery);
		
		//게시글 조회
		viewGallery = galleryService.view(viewGallery);
		logger.info("조회된 게시글 {}", viewGallery);
		
		//모델값 전달
		model.addAttribute("updateGallery", viewGallery);
		
		//태그 조회
		List<GTag> list2 = null;
		list2 = galleryService.viewTag(viewGallery.getGalleryNo());
		
		logger.info("태그 리스트 : {}", list2);
		
		//모델값 전달
		model.addAttribute("updateTag", list2);
		
		//첨부파일 모델값 전달
		GalleryFile galleryFile = galleryService.getAttachFile(viewGallery);
		model.addAttribute("galleryFile", galleryFile);
		
//		logger.info("updateGallery {}", viewGallery);
//		logger.info("galleryFile {}", galleryFile);
		return "/gallery/update";
	}
	
	
//	게시글 수정 post
	@PostMapping("/update")
	public String updateProcess(Gallery viewGallery, MultipartFile file, HttpServletRequest req, String tag) {
		logger.info("/update [POST]");
		
		logger.info("viewGallery : {}", viewGallery);
		logger.info("file : {}", file);
		logger.info("tag : {}", tag);
		
//		태그가 있을 경우
		if( tag != null && !tag.equals("") ) {
			
			JsonArray jsonArray = JsonParser.parseString(tag).getAsJsonArray();
			logger.info("jsonArray {}", jsonArray );
			
			List<GTag> tagList = new ArrayList<GTag>();
			
			for( int i=0; i<jsonArray.size(); i++) {
				String t = jsonArray.get(i).getAsJsonObject().get("value").getAsString();
				logger.info("t {}", t);
				
				tagList.add( new GTag(0, t, 0) );
			}
			
			logger.info("tagList {}", tagList);
			
			//게시글, 첨부파일, 태그
			galleryService.update(viewGallery, file, tagList);
			
			
//		태그가 없을 경우
		} else {
			galleryService.update2(viewGallery, file);
		}
		
//		String referer = req.getHeader("Referer");
//	    return "redirect:"+ referer;
		return "redirect:/gallery/view?galleryNo=" + viewGallery.getGalleryNo();
	}
	
	
//	게시글 삭제
	@RequestMapping("/delete")
	public String delete(
			Gallery viewGallery) {
		
		galleryService.delete(viewGallery);
		
		return "redirect:./list";
	}
	
//	게시글 신고
	@ResponseBody
	@RequestMapping("/reportt")
	public int reportGallery(@RequestParam(value = "chbox[]") List<String> chArr, Gallery board) {
		//logger.info("/reportt 주소 연결");
		
		int result = 0;
		int select_data = 0;
		 
		for(String i : chArr) {   
			select_data = Integer.parseInt(i);
			board.setGalleryNo(select_data);
			galleryService.report(board);
		}
		
		result = 1;
			  
		return result; 
	}
	
//	게시글 검색
	
	@PostMapping("/search")
	public String searchPost(String keywordInput, Model model) {
		logger.info("{}", "/search");
		logger.info("{}", keywordInput);
		
		if( keywordInput != null && !keywordInput.equals("") ) {
			
			List<Gallery> gallery = galleryService.search(keywordInput);
			
			logger.info("검색결과 : {}", gallery);
			
			if( gallery.isEmpty() ) {
				
				logger.info("검색결과 없음");
				
				return "redirect:./search_not-found";
				
			} else {
				
				model.addAttribute("gallery", gallery);
				logger.info("검색결과 있음 : {}", gallery);
				return "redirect:./search_list?keywordInput=" + keywordInput;			
				
			}
			

		} else {
		
			logger.info("검색어 입력안함");
			
			return "redirect:./search_not-found";
		}
	}
	
	@RequestMapping("/search_list")
	public void searchList(String keywordInput, Model model) {
		logger.info("{}", keywordInput);
			
		List<Gallery> gallery = galleryService.search(keywordInput);
		model.addAttribute("gallery", gallery);
		
	}

}
