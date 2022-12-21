package yewon.dao.face;

import java.util.List;

import yewon.dto.Cart;

public interface CartDao {

	public void insertCart(Cart cart);

	public void userInsertCart(Cart cart);
	
	public void deleteCart(Cart cart);

	public void userDeleteCart(Cart cart);

	public int selectCartTotal(Cart cart);

	public List<Cart> selectCartList(Cart cart);

	public int addCheck(Cart cart);

	public void updateQty(Cart cart);

	public void cartUpdate(String uId, String ckid);


}
