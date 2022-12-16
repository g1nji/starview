package hyeri.dao.face;

import java.util.List;

import hyeri.dto.Gallery;
import hyeri.util.Paging2;

public interface MypageDao {

	public int selectCntAll();

	public List<Gallery> selectList(String uId);

}
