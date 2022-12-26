package seulgi.dto;

import java.util.Date;

public class AdminGoodsReview {
	
	private String uId;

	//상품 리뷰
	//Review
	private int rId;
	private String rTitle;
	private String rContent;
	private Date regDate;
	private int gId;
	
	public AdminGoodsReview() {}

	public AdminGoodsReview(String uId, int rId, String rTitle, String rContent, Date regDate, int gId) {
		super();
		this.uId = uId;
		this.rId = rId;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.regDate = regDate;
		this.gId = gId;
	}

	@Override
	public String toString() {
		return "AdminGoodsReview [uId=" + uId + ", rId=" + rId + ", rTitle=" + rTitle + ", rContent=" + rContent
				+ ", regDate=" + regDate + ", gId=" + gId + "]";
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

}
