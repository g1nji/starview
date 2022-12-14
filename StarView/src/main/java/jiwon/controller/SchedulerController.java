package jiwon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jiwon.service.face.SchedulerService;

@Controller
public class SchedulerController {

	//로그
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private SchedulerService schedulerservice;
	
	
	@RequestMapping("/calendar/main")
	public void schedulermain() {
		logger.info("/calendar/main");
		
	}
	
	@GetMapping("/calendar/scheduler")
	public void schedulerview() {
		logger.info("/calendar/scheduler");
	}
	
	@PostMapping("/calendar/scheduler")
	public void schedulerwrite() {
		logger.info("/calendar/scheduler [POST]");
	}
}
