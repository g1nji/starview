package ydg.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ydg.dao.face.UsersDao;
import ydg.dto.Users;
import ydg.service.face.UsersService;

@Service
public class UsersServiceImpl implements UsersService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired UsersDao usersDao;
	
	@Override
	public int insert(Users users) {
		return usersDao.insertUser(users);
	}
	
	@Override
	public int idcheck(String uId) {
		
		return usersDao.selectByuId(uId);
	}
	
}
