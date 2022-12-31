package seulgi.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminReportDao;
import seulgi.dto.AdminReport;
import seulgi.service.face.AdminReportService;
import seulgi.util.Paging;

@Service
public class AdminReportServiceImpl implements AdminReportService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminReportDao adminReportDao;
	
	//페이징 처리
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminReportDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public Paging getPaging2(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminReportDao.selectCntAll2();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 리스트
	@Override
	public List<AdminReport> list(Paging paging) {
		logger.info("list() 사용");
		
		return adminReportDao.selectAll(paging);
	}
	
	//댓글 리스트
	@Override
	public List<AdminReport> list2(Paging paging) {
		logger.info("list() 사용");
		
		return adminReportDao.selectAll2(paging);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 삭제
	//신고글 테이블, 갤러리 테이블 동시에 삭제되도록
	
	//댓글 삭제
	//신고댓글 테이블, 갤러리 댓글 테이블 동시에 삭제되도록
}
