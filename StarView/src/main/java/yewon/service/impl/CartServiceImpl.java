package yewon.service.impl;

import java.util.List;

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

	@Override
	public int getCartTotal(String uId) {
		return cartDao.selectCartTotal(uId);
	}

	@Override
	public List<Cart> viewCart(String uId) {
		return cartDao.selectCartList(uId);
	}

	@Override
	public int addCheck(Cart cart) {
		return cartDao.addCheck(cart);
	}

	@Override
	public void updateQty(Cart cart) {
		cartDao.updateQty(cart);
	}

}
