package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminReport;
import seulgi.util.Paging;

public interface AdminReportService {

	public Paging getPaging(int curPage);
	public List<AdminReport> list(Paging paging);
	public Paging getPaging2(int curPage);
	public List<AdminReport> list2(Paging paging);
	public void delete(AdminReport board);
	public void delete2(AdminReport board);

}
