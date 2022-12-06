package jeonghwa.dao.face;

import jeonghwa.dto.Users;

public interface AdminLoginDao {

	/**
	 * u_id와 u_pw를 동시에 만족하는 회원의 수를 조회한다
	 * 	-> 로그인 인증값으로 사용한다
	 * 
	 * @param loginParam - 조회할 회원의 정보
	 * @return int - 0: 존재하지 않는 회원, 1: 존재하는 회원
	 */
	public int selectCntByIdPW(Users loginParam);

}
