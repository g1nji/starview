package yewon.dao.face;

import java.util.Map;

public interface WishDao {

	public int findLike(Map<String, Object> map);

	public void insertLike(Map<String, Object> map);

	public void deleteLike(Map<String, Object> map);

	public int selectLikeCntAll(Map<String, Object> map);

}
