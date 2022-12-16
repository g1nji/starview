package hyeri.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import hyeri.dto.Gallery;
import hyeri.util.Paging2;

public interface MypageDao {

	public int selectCntAll(String uId);

	public List<Gallery> selectList(@Param("paging") Paging2 paging,@Param("uId") String uId);
	
}
