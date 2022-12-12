package sharon.service.face;

import ydg.dto.Users;

public interface LoginService {

	/**
	 * 전달된 id를 이용하여 사용자 정보 조회하기
	 * 
	 * @param loginid -조회할 사용자의 id
	 * @return -조회된 사용자 정보
	 */
	public Users info(String loginid);

	public void delete(String loginid);
	
	public void update(Users users);


	public boolean pwCheck(Users usersParam);

}
