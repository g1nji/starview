package jeonghwa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jeonghwa.dao.face.AdminLoginDao;
import jeonghwa.dto.Users;
import jeonghwa.service.face.AdminLoginService;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	//DAO 객체
	@Autowired AdminLoginDao adminLogindao;
	
	@Override
	public boolean login(Users loginParam) {

		if ( adminLogindao.selectCntByIdPW(loginParam) > 0 ) {
			return true;
		}
		return false;
	}
	

}
