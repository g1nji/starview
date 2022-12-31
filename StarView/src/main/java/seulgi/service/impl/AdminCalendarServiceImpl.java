package seulgi.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminCalendarDao;
import seulgi.dto.AdminCalendar;
import seulgi.service.face.AdminCalendarService;
import seulgi.util.Paging;

@Service
public class AdminCalendarServiceImpl implements AdminCalendarService {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCalendarDao adminCalendarDao;
	
	//추천일 등록
	@Override
	public void upload(AdminCalendar calendar) {
		logger.info("upload() 사용");
		
		adminCalendarDao.insertDate(calendar);
	}

	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//페이징 처리
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminCalendarDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//추천일 리스트
	@Override
	public List<AdminCalendar> list(Paging paging) {
		logger.info("list() 사용");
		
		return adminCalendarDao.selectAll(paging);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//추천일 상세 조회
	@Override
	public AdminCalendar view(AdminCalendar viewBoard) {
		logger.info("view() 사용");
		
		return adminCalendarDao.selectBoard(viewBoard);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	//추천일 수정
	@Override
	public void update(AdminCalendar board) {
		logger.info("update() 사용");
		
		adminCalendarDao.updateBoard(board);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//추천일 삭제
	@Override
	public void delete(AdminCalendar board) {
		logger.info("delete() 사용");
		
		//게시글 삭제
		adminCalendarDao.delete(board);
	}
	
}
