package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminCalendar;
import seulgi.util.Paging;

public interface AdminCalendarService {

	public void upload(AdminCalendar calendar);
	public Paging getPaging(int curPage);
	public List<AdminCalendar> list(Paging paging);
	public AdminCalendar view(AdminCalendar viewBoard);
	public void update(AdminCalendar board);
	public void delete(AdminCalendar board);

}
