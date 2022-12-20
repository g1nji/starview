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

	//마이페이지 탈퇴
	public void delete(String loginid);

	//마이페이지 수정
	public void update(Users users);

	//비밀번호 재확인(수정,탈퇴시)
	public boolean pwCheck(Users usersParam);

	//닉네임 중복
	public int nickCheck(String uNick);

}
