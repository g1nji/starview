package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminCalendar;
import seulgi.util.Paging;

public interface AdminCalendarDao {

	public void insertDate(AdminCalendar calendar);
	public int selectCntAll();
	public List<AdminCalendar> selectAll(Paging paging);
	public AdminCalendar selectBoard(AdminCalendar viewBoard);
	public void updateBoard(AdminCalendar board);
	public void delete(AdminCalendar board);

}
