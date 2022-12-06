package seulgi.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminBoardDao;
import seulgi.dto.AdminBoard;
import seulgi.dto.AdminBoardPhoto;
import seulgi.service.face.AdminBoardService;
import seulgi.util.Paging;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired
	private AdminBoardDao adminBoardDao; 
	
	//페이징 처리
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminBoardDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	//게시글 리스트
	@Override
	public List<AdminBoard> list(Paging paging) {
		logger.info("list() 사용");
		
		return adminBoardDao.selectAll(paging);
	}
	
	//게시글 상세 조회
	@Override
	public AdminBoard view(AdminBoard viewBoard) {
		logger.info("view() 사용");
		
		return adminBoardDao.selectBoard(viewBoard);
	}
	
	//첨부파일 정보 얻어오기
	@Override
	public AdminBoardPhoto getAttachFile(AdminBoard viewBoard) {
		return adminBoardDao.selectPhotoFile(viewBoard);
	}
}
