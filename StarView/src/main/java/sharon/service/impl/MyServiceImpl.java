package sharon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import sharon.dao.face.MyDao;
import sharon.service.face.MyService;
import ydg.dto.Users;

public class MyServiceImpl implements MyService {
	//DAO 객체
	@Autowired private MyDao myDao;
	
	@Override
	public void Modify(Users users) {
		myDao.Modify(users);
	}

	@Override
	public void withDraw(Users users) {
		myDao.withDraw(users);
	}

}
