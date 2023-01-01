package hyeri.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyeri.dao.face.OrderDao;
import hyeri.dto.AfterOrder;
import hyeri.service.face.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired OrderDao orderDao;
	
	@Override
	public void addOrder(AfterOrder afOrder) {
		orderDao.addOrder(afOrder);
	}
	
	@Override
	public void addPUID(String puid) {
		orderDao.addPUID(puid);
	}
	

}
