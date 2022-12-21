package yewon.dao.face;

import java.util.List;

import yewon.dto.Cart;

public interface CartDao {

	public void insertCart(Cart cart);

	public void deleteCart(Cart cart);

	public int selectCartTotal(String uId);

	public List<Cart> selectCartList(String uId);

	public int addCheck(Cart cart);

	public void updateQty(Cart cart);

}
