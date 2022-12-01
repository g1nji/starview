package seulgi.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminProductDao;
import seulgi.dto.AdminProduct;
import seulgi.service.face.AdminProductService;
import seulgi.util.Paging;

@Service
public class AdminProductServiceImpl implements AdminProductService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired
	private AdminProductDao adminProductDao; 
	
	//페이징 처리
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminProductDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	//상품 리스트
	@Override
	public List<AdminProduct> list(Paging paging) {
		logger.info("list() 사용");
		
		return adminProductDao.selectAll(paging);
	}
	
	//상품 상세 조회
	@Override
	public AdminProduct view(AdminProduct viewProd) {
		logger.info("view() 사용");
		
		return adminProductDao.selectProd(viewProd);
	}
	
	//상품 업로드
	@Override
	public void upload(AdminProduct prod) {
		logger.info("upload() 사용");
		
		adminProductDao.insert(prod);
	}
	
}
