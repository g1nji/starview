package sharon.dao.face;

import sharon.dto.Login;

public interface LoginDao {

	/**
	 * 신규회원 정보 삽입하기
	 * 
	 * @param joinParam-신규회원 가입 정보
	 */

	public void insert(Login joinParam);

	/**
	 * 로그인 ID&PW가 일치하는 행(사용자)의 수 구하기
	 * 
	 * @param loginParam-로그인정보
	 * @return 일치하는 행의 수
	 */
	public int selectCntByIdPW(Login loginParam);

	/**
	 * 전달된 id의 사용자 정보를 조회한다
	 * @param loginid -조회할 대상 id
	 * @return 조회된 회원 정보
	 */
	public Login selectLoginById(String loginid);

	public void delete(String loginid);

}
