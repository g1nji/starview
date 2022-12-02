package ydg.service.face;

import ydg.dto.Users;

public interface UsersService {

	/**
	 * 입력받은 정보를 Users테이블에 삽입
	 * 
	 * @param users 입력받은 정보
	 * @return
	 */
	public int insert(Users users);

	public int idcheck(String uId);

}
