package jiwon.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jiwon.dao.face.CalendarDao;
import jiwon.dto.Calendar;
import jiwon.service.face.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CalendarDao calendarDao;
	
	@Override
	public void write(Calendar calendar) {
		logger.info("SchedulerService - write");
		
		calendarDao.insertTodolist(calendar);
		
	}

	@Override
	public List<Calendar> list() {
		logger.info("list()");
		
		List<Calendar> todoList = calendarDao.selectAll();
		
		logger.info("전체조회하기");
		for( Calendar c : todoList ) logger.info("{}", c);
		
		return todoList;
	}

	@Override
	public List<Calendar> sDateTodolist(String sDate) {
		return calendarDao.selectTodoListSDate(sDate);
	}

	
	@Override
	public void delete(Calendar calendar) {
		calendarDao.delete(calendar);
	}

	
//	@Override
//	public Calendar view() {
//		return null;
//	}



}
