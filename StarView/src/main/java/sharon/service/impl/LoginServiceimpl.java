package sharon.service.impl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sharon.dao.face.LoginDao;
import sharon.dto.Login;
import sharon.service.face.LoginService;
@Service
public class LoginServiceimpl implements LoginService{

	private final Logger logger= LoggerFactory.getLogger(this.getClass());

	//DAO 객체
	@Autowired private LoginDao loginDao;

	@Override
	public void join(Login joinParam) {
		logger.info("join()-{}",joinParam);

		loginDao.insert(joinParam);
	}

	@Override
	public boolean login(Login loginParam) {
		logger.info("login()-{}",loginParam);
		
		if(loginDao.selectCntByIdPW(loginParam)>0) {
			return true; //로그인 인증 성공
		}
		return false; //로그인 인증 실패
	}

	@Override
	public Login info(String loginid) {
		logger.info("info()-{}",loginid);
		
		return loginDao.selectLoginById(loginid);
	}

	@Override
	public void delete(String loginid) {
		logger.info("delete()-{}",loginid);
		loginDao.delete(loginid);
	}

	

}
