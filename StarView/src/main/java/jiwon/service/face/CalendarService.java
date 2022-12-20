package jiwon.service.face;

import jiwon.dto.Calendar;

public interface CalendarService {

	/**
	 * 게시글 처리
	 * 
	 * @param scheduler - 작성한 게시글 정보 객체
	 */
	public void write(Calendar calendar);

}
