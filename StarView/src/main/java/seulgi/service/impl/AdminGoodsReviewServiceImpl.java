package seulgi.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminGoodsReviewDao;
import seulgi.dto.AdminGoodsReview;
import seulgi.service.face.AdminGoodsReviewService;
import seulgi.util.Paging;

@Service
public class AdminGoodsReviewServiceImpl implements AdminGoodsReviewService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired
	private AdminGoodsReviewDao adminBoardDao; 
	
	//ServletContext 객체
	@Autowired
	ServletContext context;
	
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminBoardDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	
	@Override
	public List<AdminGoodsReview> list(Paging paging) {
		logger.info("list() 사용");
		
		return adminBoardDao.selectAll(paging);
	}
	
	
	
}
