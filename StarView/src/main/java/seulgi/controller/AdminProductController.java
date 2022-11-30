package seulgi.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import seulgi.dto.AdminProduct;
import seulgi.service.face.AdminProductService;

@Controller
@RequestMapping(value="/admin/prod")
public class AdminProductController {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//서비스 객체
	@Autowired
	private AdminProductService adminProductService;
	
	//나중에 페이징 추가하기
	//상품 페이지
	@RequestMapping(value="/list")
	public void getProdList(Model model) {
		logger.info("/list 주소 연결");
		
		//상품 리스트
		List<AdminProduct> prodList = adminProductService.list();
		
		model.addAttribute("prodList", prodList);
	}
	
	//상품 업로드 페이지
	@RequestMapping(value="/insert", method = RequestMethod.GET)
	public void insertProd() {
		logger.info("/insert 주소 연결 - [GET]");
	}
	
	//상품 업로드
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public void insertProdProc(AdminProduct product) {
		logger.info("/insert 주소 연결 - [POST]");
		logger.info("상품 정보: {}", product);
		
		adminProductService.upload(product);
	}
	
}
