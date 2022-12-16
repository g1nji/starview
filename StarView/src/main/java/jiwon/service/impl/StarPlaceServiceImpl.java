package jiwon.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jiwon.dao.face.StarPlaceDao;
import jiwon.dto.StarPlace;
import jiwon.service.face.StarPlaceService;

@Service
public class StarPlaceServiceImpl implements StarPlaceService {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired private StarPlaceDao starplaceDao;

	@Override
	public List<StarPlace> list() {
		logger.info("list()");
		
		//게시판 전체 조회하기
		List<StarPlace> starPlaceList = starplaceDao.selectAll();
		
		logger.info("전체 조회");
		for( StarPlace s : starPlaceList ) logger.info("{}", s);
		
		return starPlaceList;
	}

	
	
	//명소 상세 조회
	@Override
	public StarPlace view(StarPlace viewStarplace) {
		
		//상세보기 조회 결과 리턴하기
		return starplaceDao.selectStarplace(viewStarplace);
	}



	
}
