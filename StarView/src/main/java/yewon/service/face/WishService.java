package yewon.service.face;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface WishService {

	public int findLike(Map<String, Object> map);
	
	public int getLikeCntAll(Map<String, Object> map);

	public void insertLike(Map<String, Object> map);

	public void deleteLike(Map<String, Object> map);


}
