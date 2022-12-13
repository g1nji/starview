package jeonghwa.service.face;

import java.util.List;

import jeonghwa.dto.Users;
import jeonghwa.util.Paging;

public interface UserManageService {

	public Paging getPaging(int curPage);

	public List<Users> list(Paging paging);

}
