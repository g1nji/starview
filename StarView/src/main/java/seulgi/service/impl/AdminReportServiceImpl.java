package seulgi.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminReportDao;
import seulgi.service.face.AdminReportService;

@Service
public class AdminReportServiceImpl implements AdminReportService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	//서비스 객체
	@Autowired
	private AdminReportDao adminReportDao;
	
	
}
