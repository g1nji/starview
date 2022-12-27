package jiwon.service.face;

import java.util.List;

import jiwon.dto.Calendar;

public interface CalendarService {

	/**
	 * 게시글 처리
	 * 
	 * @param scheduler - 작성한 게시글 정보 객체
	 */
	public void write(Calendar calendar);

	/**
	 * 
	 * @return 조회된 list 목록
	 */
	public List<Calendar> list();
	
	public List<Calendar> sDateTodolist(String sDate);

//	/**
//	 * 조회할 게시글 번호 객체
//	 * 
//	 * @return 조회된 번호
//	 */
//	public Calendar view();

}
