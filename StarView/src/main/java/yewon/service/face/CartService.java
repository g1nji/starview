package yewon.service.face;

import java.util.List;

import yewon.dto.Cart;

public interface CartService {

	public void addCart(Cart cart);

	public void deleteCart(Cart cart);

	public int getCartTotal(Cart cart);

	public List<Cart> viewCart(Cart cart);

	public int addCheck(Cart cart);

	public void updateQty(Cart cart);

//	public void cartUpdate(Cart cart);

	public Cart nonuserCart(Cart goods);

}
