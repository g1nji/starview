package jiwon.dao.face;

import java.util.List;

import jiwon.dto.Calendar;

public interface CalendarDao {

	/**
	 * 게시글 정보 삽입하기
	 * 
	 * @param scheduler - 삽입할 게시글 정보
	 */
	public void insertTodolist(Calendar calendar);

	
	/**
	 * 전체 조회하기
	 * 
	 * @return - 조회된 투두리스트
	 */
	public List<Calendar> selectAll();


	public List<Calendar> selectTodoListSDate(String sDate);

}
