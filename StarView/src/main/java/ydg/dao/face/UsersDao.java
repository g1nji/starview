package ydg.dao.face;

import java.util.List;

import ydg.dto.Users;

public interface UsersDao {

	/**
	 * 입력받은 정보 Users 테이블에 삽입
	 * 
	 * @param users 입력받은 정보
	 * @return
	 */
	public int insertUser(Users users);

	/**
	 * 중복된 아이디값 찾기
	 * 
	 * @param uId - 파라미터로 받은 uId
	 * @return
	 */
	public int selectByuId(String uId);

	/**
	 * 
	 * 
	 * @param users - 로그인 정보
	 * @return
	 */
	public int selectCntById(Users users);
	
	/**
	 * ID PW값이 존재하는지 확인
	 * 
	 * @param users
	 * @return
	 */
	public int selectCntUsers(Users users);

	/**
	 * 전화번호로 찾기
	 * 
	 * @param users
	 * @return
	 */
	public List<Users> selectByphone(Users users);

	/**
	 * 이메일로 찾기
	 * 
	 * @param users
	 * @return
	 */
	public List<Users> selectByEmail(Users users);

	/**
	 * 
	 * @param users
	 * @return
	 */
	public String finduNick(Users users);




}
