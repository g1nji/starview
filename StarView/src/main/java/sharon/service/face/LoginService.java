package sharon.service.face;

import sharon.dto.Login;

public interface LoginService {

	/**
	 * 신규 회원가입 
	 * 
	 * @param joinParam -회원가입할 사용자 정보
	 */
	public void join(Login joinParam);

	/**
	 * 로그인 인증 처리
	 * ID&PW를 조회하여 행 COUNT를 이용하여 처리한다
	 * 
	 * @param loginParam -로그인에 사용할 ID&PW 정보
	 * @return -로그인 인증 결과
	 * 	ture-로그인 인증 성공
	 * 	false-로그인 인증 실패
	 */
	public boolean login(Login loginParam);
	
	
	/**
	 * 전달된 id를 이용하여 사용자 정보 조회하기
	 * 
	 * @param loginid -조회할 사용자의 id
	 * @return -조회된 사용자 정보
	 */
	public Login info(String loginid);

	public void delete(String loginid);

}
