package ydg.service.face;

import java.util.HashMap;
import java.util.List;

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

	/**
	 * 아이디찾기
	 * 
	 * @param find
	 * @param phoneName
	 * @param mailName
	 * @param users
	 * @return
	 */
	public List<Users> findId(String find, String phoneName, String mailName, Users users);

	/**
	 * 로그인 시 유저 닉네임 가져오기
	 * 
	 * @param users
	 * @return
	 */
	public String finduNick(Users users);



}
