package jiwon.dao.face;

import java.util.List;

import jiwon.dto.StarPlace;

public interface StarPlaceDao {


	/**
	 * 전체 명소 목록 조회하기
	 * 
	 * @return 조회된 목록
	 */
	public List<StarPlace> selectAll();

	/**
	 * 명소 번호를 이용해 명소를 상세조회함
	 * 
	 * @param viewStarplace - 조회하려는 명소 번호
	 * @return 조회된 명소의 정보
	 */
	public StarPlace selectStarplace(StarPlace viewStarplace);

	
}
