package seulgi.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import seulgi.dao.face.AdminProductDao;
import seulgi.dto.AdminProduct;
import seulgi.service.face.AdminProductService;

@Service
public class AdminProductServiceImpl implements AdminProductService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired
	private AdminProductDao adminProductDao; 
	
	@Override
	public List<AdminProduct> list() {
		logger.info("list() 사용");
		
		return adminProductDao.selectAll();
	}
	
	@Override
	public AdminProduct upload(AdminProduct product) {
		logger.info("upload() 사용");
		
		return adminProductDao.insert(product);
	}
}
