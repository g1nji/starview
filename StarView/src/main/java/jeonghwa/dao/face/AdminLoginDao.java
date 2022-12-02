package jeonghwa.dao.face;

import jeonghwa.dto.Users;

public interface AdminLoginDao {

	public int selectCntByIdPW(Users loginParam);

}
