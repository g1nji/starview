package seulgi.service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminPlaceReviewDao;
import seulgi.dto.AdminPlaceReview;
import seulgi.service.face.AdminPlaceReviewService;
import seulgi.util.Paging;

@Service
public class AdminPlaceReviewServiceImpl implements AdminPlaceReviewService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired
	private AdminPlaceReviewDao adminBoardDao; 
	
	//ServletContext 객체
	@Autowired
	ServletContext context;
	
	//페이징 처리
	@Override
	public Paging getPaging3(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminBoardDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 리스트
	@Override
	public List<AdminPlaceReview> list3(Paging paging) {
		logger.info("list() 사용");
		
		return adminBoardDao.selectAll(paging);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 상세 조회
	@Override
	public AdminPlaceReview view(AdminPlaceReview viewBoard) {
		logger.info("view() 사용");
		
		return adminBoardDao.selectBoard(viewBoard);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 삭제
	@Override
	public void delete(AdminPlaceReview board) {
		logger.info("delete() 사용");
		
		//게시글 삭제
		adminBoardDao.delete(board);
		
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 검색
	@Override
	public List<AdminPlaceReview> search(String keyword) {
		logger.info("search() 사용");
		
		return adminBoardDao.searchBoard(keyword);
	}
		
	
}
