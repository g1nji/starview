package jeonghwa.dao.face;

import java.util.List;

import jeonghwa.dto.Users;
import jeonghwa.util.Paging;

public interface UserManageDao {

	public int selectCntAll();

	public List<Users> selectList(Paging paging);

}
