package yewon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yewon.dao.face.WishDao;
import yewon.dto.Wish;
import yewon.service.face.WishService;

@Service
public class WishServiceImpl implements WishService {

	@Autowired WishDao wishDao;
	
	@Override
	public int findLike(Wish wish) {
		return wishDao.findLike(wish);
	}
	
	@Override
	public int getLikeCntAll(Wish wish) {
		return wishDao.selectLikeCntAll(wish);
	}

	@Override
	public void insertLike(Wish wish) {
		wishDao.insertLike(wish);
	}

	@Override
	public void deleteLike(Wish wish) {
		wishDao.deleteLike(wish);
	}


}
