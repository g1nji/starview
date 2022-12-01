package seulgi.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminBoardDao;
import seulgi.dto.AdminBoard;
import seulgi.service.face.AdminBoardService;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired
	private AdminBoardDao adminBoardDao; 
	
	@Override
	public List<AdminBoard> list() {
		logger.info("list() 사용");
		
		return adminBoardDao.selectAll();
	}
	
}
