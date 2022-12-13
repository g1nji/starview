package jeonghwa.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonghwa.dao.face.UserManageDao;
import jeonghwa.dto.Users;
import jeonghwa.service.face.UserManageService;
import jeonghwa.util.Paging;

@Service
public class UserManageServiceImpl implements UserManageService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	//DAO 객체
	@Autowired UserManageDao userManageDao;
	
	@Override
	public Paging getPaging(int curPage) {

		//총 회원 수 조회하기
		int totalCount = userManageDao.selectCntAll();
		
		//Paging객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
		
	}

	@Override
	public List<Users> list(Paging paging) {
		
		List<Users> list =  userManageDao.selectList(paging);
		
		return list;
	}

}
