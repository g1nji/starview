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
	
}
