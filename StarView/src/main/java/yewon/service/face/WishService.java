package yewon.service.face;

import org.springframework.stereotype.Service;

import yewon.dto.Wish;

@Service
public interface WishService {

	public int findLike(Wish wish);
	
	public int getLikeCntAll(Wish wish);

	public void insertLike(Wish wish);

	public void deleteLike(Wish wish);


}
