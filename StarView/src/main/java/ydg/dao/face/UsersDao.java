package ydg.dao.face;

import ydg.dto.Users;

public interface UsersDao {

	/**
	 * 입력받은 정보 Users 테이블에 삽입
	 * 
	 * @param users 입력받은 정보
	 * @return
	 */
	public Users insertUser(Users users);

}
