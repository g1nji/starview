package yewon.dto;

public class Wish {

	private int wId;
	private int gId;
	private String uId;
	private int likeCheck;

	public Wish() {}

	public Wish(int wId, int gId, String uId, int likeCheck) {
		super();
		this.wId = wId;
		this.gId = gId;
		this.uId = uId;
		this.likeCheck = likeCheck;
	}

	@Override
	public String toString() {
		return "Wish [wId=" + wId + ", gId=" + gId + ", uId=" + uId + ", likeCheck=" + likeCheck + "]";
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

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}
	
	
}
