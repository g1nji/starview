package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminReport;
import seulgi.util.Paging;

public interface AdminReportDao {

	public int selectCntAll();
	public int selectCntAll2();
	public List<AdminReport> selectAll(Paging paging);
	public List<AdminReport> selectAll2(Paging paging);

}
