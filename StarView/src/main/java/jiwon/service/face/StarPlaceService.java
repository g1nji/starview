package jiwon.service.face;

import java.util.List;

import jiwon.dto.StarPlace;

public interface StarPlaceService {


	/**
	 * 명소 목록 전체 조회하기
	 * 
	 * @return 조회된 전체 목록
	 */
	public List<StarPlace> list();

	
	/**
	 * 명소 상세 조회하기
	 * 
	 * @param viewStarplace - 상세조회할 명소 번호 객체
	 * @return 조회된 상세 명소번호
	 */
	public StarPlace view(StarPlace viewStarplace);


	
}
