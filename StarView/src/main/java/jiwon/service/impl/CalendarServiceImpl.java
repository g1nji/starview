package jiwon.service.impl;

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

}
