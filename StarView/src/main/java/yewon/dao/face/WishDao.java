package yewon.dao.face;

import yewon.dto.Wish;

public interface WishDao {

	public int findLike(Wish wish);

	public void insertLike(Wish wish);

	public void deleteLike(Wish wish);

	public int selectLikeCntAll(Wish wish);

}
