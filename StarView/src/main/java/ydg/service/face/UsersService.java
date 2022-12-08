package ydg.service.face;

import java.util.HashMap;

import ydg.dto.Users;

public interface UsersService {

	/**
	 * 입력받은 정보를 Users테이블에 삽입
	 * 
	 * @param users 입력받은 정보
	 * @return
	 */
	public boolean insert(Users users);

	/**
	 * 중복된 아이디 값 찾기
	 * 
	 * @param uId - 유저 ID 값
	 * @return
	 */
	public int idcheck(String uId);

	/**
	 * ID와 PW가 있는지 확인
	 * 
	 * @param users
	 * @return
	 */
	public boolean login(Users users);

	/**
	 * 카카오 로그인 토큰 받기
	 * 
	 * @param code
	 * @return
	 */
	public String getAccessToken(String code);

	/**
	 * 
	 * @param access_Token
	 * @return
	 */
	public HashMap<String, Object> getUserInfo(String access_Token);

}
