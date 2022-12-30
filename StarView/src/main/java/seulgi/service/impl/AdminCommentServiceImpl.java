package seulgi.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminCommentDao;
import seulgi.dto.AdminComment;
import seulgi.dto.AdminGallery;
import seulgi.service.face.AdminCommentService;
import seulgi.util.Paging;

@Service
public class AdminCommentServiceImpl implements AdminCommentService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCommentDao adminCommentDao;
	
	//페이징 처리
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminCommentDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	//댓글 리스트
	@Override
	public List<AdminComment> list(Paging paging) {
		logger.info("list() 사용");
		
		return adminCommentDao.selectAll(paging);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//댓글 상세 조회
	@Override
	public List<AdminComment> view(AdminGallery viewBoard) {
		logger.info("view() 사용");

		return adminCommentDao.selectComment(viewBoard);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	//댓글 삭제
	@Override
	public void delete(AdminComment board) {
		logger.info("delete() 사용");
		
		adminCommentDao.delete(board);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 검색
	@Override
	public List<AdminComment> search(String keyword) {
		logger.info("search() 사용");
		
		return adminCommentDao.searchBoard(keyword);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//댓글 신고
	@Override
	public void report(AdminComment board) {
		logger.info("report() 사용");
		
		adminCommentDao.insertBoard(board);
	}
}
