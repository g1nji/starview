package sharon.dao.face;

import ydg.dto.Users;

public interface LoginDao {

	/**
	 * 로그인 ID&PW가 일치하는 행(사용자)의 수 구하기
	 * 
	 * @param loginParam-로그인정보
	 * @return 일치하는 행의 수
	 */
	public int selectCntByIdPW(Users usersParam);

	/**
	 * 전달된 id의 사용자 정보를 조회한다
	 * @param loginid -조회할 대상 id
	 * @return 조회된 회원 정보
	 */
	public Users selectLoginById(String loginid);

	public void delete(String loginid);
	
	public void update(Users users);

	//회원정보 수정 시 비번 확인
	public int selectCntByIdPW(String loginid, String pw);

	//닉네임 중복 확인
	public int selectByuNick(String uNick);

}
