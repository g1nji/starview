package yewon.dto;

public class Cart {

	private int cId;
	private int gId;
	private int uId;
	
	public Cart() {}

	public Cart(int cId, int gId, int uId) {
		super();
		this.cId = cId;
		this.gId = gId;
		this.uId = uId;
	}

	@Override
	public String toString() {
		return "Cart [cId=" + cId + ", gId=" + gId + ", uId=" + uId + "]";
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}
	
	
}
