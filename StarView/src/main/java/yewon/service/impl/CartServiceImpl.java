package yewon.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yewon.dao.face.CartDao;
import yewon.dto.Cart;

@Service
public class CartServiceImpl implements yewon.service.face.CartService {

	@Autowired private CartDao cartDao;
	
	@Override
	public void addCart(Cart cart) {
		cartDao.insertCart(cart);
	}

	@Override
	public void deleteCart(Cart cart) {
		cartDao.deleteCart(cart);
	}

}
