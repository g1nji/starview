package jiwon.dao.face;

import jiwon.dto.Calendar;

public interface CalendarDao {

	/**
	 * 게시글 정보 삽입하기
	 * 
	 * @param scheduler - 삽입할 게시글 정보
	 */
	public void insertTodolist(Calendar calendar);

}
