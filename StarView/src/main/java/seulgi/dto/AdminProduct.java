package seulgi.dto;

import java.util.Date;

public class AdminProduct {
	
	private String uId;
	private String uNick;
	
	//상품 리뷰
	private int gId;
	private String gName;
	private int gPrice;
	private Date delivery;
	private Date regDate;
	private String gDetail;
	private int delPrice;
	
	//상품 이미지
	//private int imgId;
	private String fileName;
	//private String fileType;
	
	public AdminProduct() {}

	public AdminProduct(int gId, String gName, int gPrice, Date delivery, Date regDate, String gDetail, int delPrice,
			String fileName) {
		super();
		this.gId = gId;
		this.gName = gName;
		this.gPrice = gPrice;
		this.delivery = delivery;
		this.regDate = regDate;
		this.gDetail = gDetail;
		this.delPrice = delPrice;
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "AdminProduct [gId=" + gId + ", gName=" + gName + ", gPrice=" + gPrice + ", delivery=" + delivery
				+ ", regDate=" + regDate + ", gDetail=" + gDetail + ", delPrice=" + delPrice + ", fileName=" + fileName
				+ "]";
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getgDetail() {
		return gDetail;
	}

	public void setgDetail(String gDetail) {
		this.gDetail = gDetail;
	}

	public int getDelPrice() {
		return delPrice;
	}

	public void setDelPrice(int delPrice) {
		this.delPrice = delPrice;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}