package yewon.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yewon.dao.face.WishDao;
import yewon.service.face.WishService;

@Service
public class WishServiceImpl implements WishService {

	@Autowired WishDao wishDao;
	
	@Override
	public int findLike(Map<String, Object> map) {
		return wishDao.findLike(map);
	}
	
	@Override
	public int getLikeCntAll(Map<String, Object> map) {
		return wishDao.selectLikeCntAll(map);
	}

	@Override
	public void insertLike(Map<String, Object> map) {
		wishDao.insertLike(map);
	}

	@Override
	public void deleteLike(Map<String, Object> map) {
		wishDao.deleteLike(map);
	}


}
