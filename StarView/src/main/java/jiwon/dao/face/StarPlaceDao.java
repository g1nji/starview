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
}
