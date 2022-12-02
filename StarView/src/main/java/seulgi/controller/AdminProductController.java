package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import seulgi.dto.AdminProduct;
import seulgi.dto.AdminProductImage;
import seulgi.service.face.AdminProductService;
import seulgi.util.Paging;

@Controller
@RequestMapping(value="/admin/prod")
public class AdminProductController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired
	private AdminProductService adminProductService;
	
	//상품 페이지
	@RequestMapping(value="/list")
	public void getProdList(Model model, @RequestParam(defaultValue = "0") int curPage) {
		logger.info("/list 주소 연결");
		
		//페이징 추가
		Paging paging = adminProductService.getPaging(curPage);
		logger.info("페이징 정보: {}", paging);
		model.addAttribute("paging", paging);
		
		//상품 리스트 조회
		List<AdminProduct> prodList = adminProductService.list(paging);
		
		//for (AdminProduct p : prodList)
			//logger.info("{}", p);
		
		model.addAttribute("prodList", prodList);
	}
	
	//파일 추가
	//상품 상세 페이지
	@RequestMapping("/view")
	public String viewProd(AdminProduct viewProd, Model model) {
		logger.info("/view 주소 연결");

		//잘못된 상품 번호 처리
		if( viewProd.getgId() < 0 ) {
			return "redirect:admin/prod/list";
		}
		
		//상품 상세 조회
		viewProd = adminProductService.view(viewProd);
		logger.info("조회된 상품: {}", viewProd);
		
		//모델값 전달
		model.addAttribute("viewProd", viewProd);
		
		//첨부파일 모델값 전달
		AdminProductImage imagefile = adminProductService.getAttachFile(viewProd);
		model.addAttribute("imagefile", imagefile);
		
		return "admin/prod/view";
	}
	
	//파일 추가
	//상품 업로드 페이지
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public void insertProd() {
		logger.info("/insert 주소 연결 - [GET]");
	}
	
	//상품 업로드
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public void insertProdProc(AdminProduct prod, MultipartFile file) {
		logger.info("/insert 주소 연결 - [POST]");
		logger.info("상품 정보: {}", prod);
		
		//게시글, 첨부파일 처리
		adminProductService.upload(prod, file);
	}
	
}
