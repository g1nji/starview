package seulgi.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminCommentDao;
import seulgi.dto.AdminComment;
import seulgi.service.face.AdminCommentService;

@Service
public class AdminCommentServiceImpl implements AdminCommentService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCommentDao adminCommentDao;
	
	@Override
	public List<AdminComment> list() {
		logger.info("list() 사용");
		
		return adminCommentDao.selectAll();
	}
	
	@Override
	public List<AdminComment> view(int galleryNo) {
		logger.info("view() 사용");
		
		return adminCommentDao.selectComment(galleryNo);
	}
	
}
