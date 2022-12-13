package sharon.service.impl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sharon.dao.face.LoginDao;
import sharon.dto.Login;
import sharon.service.face.LoginService;
import ydg.dto.Users;
@Service
public class LoginServiceimpl implements LoginService{

	private final Logger logger= LoggerFactory.getLogger(this.getClass());

	//DAO 객체
	@Autowired private LoginDao loginDao;

	@Override
	public Users info(String loginid) {
		logger.info("info()-{}",loginid);
		
		return loginDao.selectLoginById(loginid);
	}

	@Override
	public void delete(String loginid) {
		logger.info("delete()-{}",loginid);
		loginDao.delete(loginid);
	}
	
	@Override
	public void update(Users users) {
		logger.info("update()-{}",users);
		loginDao.update(users);
	}

	@Override
	public boolean pwCheck(Users usersParam) {
		logger.info("pwCheck()-{}",usersParam);
		
		int res= loginDao.selectCntByIdPW(usersParam);
		
		if(res>0) 	return true;
		else		return false;
		
	}

	

}
