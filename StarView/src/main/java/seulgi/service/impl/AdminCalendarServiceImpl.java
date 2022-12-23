package seulgi.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminCalendarDao;
import seulgi.dto.AdminCalendar;
import seulgi.service.face.AdminCalendarService;

@Service
public class AdminCalendarServiceImpl implements AdminCalendarService {
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminCalendarDao adminCalendarDao;
	
	@Override
	public void upload(AdminCalendar calendar) {
		logger.info("upload() 사용");
		
		adminCalendarDao.insertDate(calendar);
	}

}
