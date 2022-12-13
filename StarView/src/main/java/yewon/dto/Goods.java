package yewon.dto;

import java.util.Date;

public class Goods {

	private int gId;
	private String gName;
	private int gPrice;
	private Date delivery;
	private String gDetail;
	private Date regDate;
	private int delPrice;
	private String fileName;
	private int likeCnt;

	public Goods() {}

	public Goods(int gId, String gName, int gPrice, Date delivery, String gDetail, Date regDate, int delPrice, String fileName, int likeCnt) {
		super();
		this.gId = gId;
		this.gName = gName;
		this.gPrice = gPrice;
		this.delivery = delivery;
		this.gDetail = gDetail;
		this.regDate = regDate;
		this.delPrice = delPrice;
		this.fileName = fileName;
		this.likeCnt = likeCnt;
	}

	@Override
	public String toString() {
		return "Goods [gId=" + gId + ", gName=" + gName + ", gPrice=" + gPrice + ", delivery=" + delivery + ", gDetail="
				+ gDetail + ", regDate=" + regDate + ", delPrice=" + delPrice + ", fileName=" + fileName + ", likeCnt="
				+ likeCnt + "]";
	}

	public int getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public int getgPrice() {
		return gPrice;
	}

	public void setgPrice(int gPrice) {
		this.gPrice = gPrice;
	}

	public Date getDelivery() {
		return delivery;
	}

	public void setDelivery(Date delivery) {
		this.delivery = delivery;
	}

	public String getgDetail() {
		return gDetail;
	}

	public void setgDetail(String gDetail) {
		this.gDetail = gDetail;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getDelPrice() {
		return delPrice;
	}

	public void setDelPrice(int delPrice) {
		this.delPrice = delPrice;
	}

	
	
}
