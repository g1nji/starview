package yewon.dto;

public class Wish {

	private int wId;
	private int gId;
	private String uId;

	public Wish() {}

	public Wish(int wId, int gId, String uId) {
		super();
		this.wId = wId;
		this.gId = gId;
		this.uId = uId;
	}

	@Override
	public String toString() {
		return "Wish [wId=" + wId + ", gId=" + gId + ", uId=" + uId + "]";
	}

	public int getwId() {
		return wId;
	}

	public void setwId(int wId) {
		this.wId = wId;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}
	
}
