package yewon.dto;

public class Cart {

	private int cId;
	private int gId;
	private String uId;
	private int cQty;
	private int gPrice;
	private int delPrice;
	private String fileName;
	private String gName;
	
	public Cart() {}

	public Cart(int cId, int gId, String uId, int cQty, int gPrice, int delPrice, String fileName, String gName) {
		super();
		this.cId = cId;
		this.gId = gId;
		this.uId = uId;
		this.cQty = cQty;
		this.gPrice = gPrice;
		this.delPrice = delPrice;
		this.fileName = fileName;
		this.gName = gName;
	}

	@Override
	public String toString() {
		return "Cart [cId=" + cId + ", gId=" + gId + ", uId=" + uId + ", cQty=" + cQty + ", gPrice=" + gPrice
				+ ", delPrice=" + delPrice + ", fileName=" + fileName + ", gName=" + gName + "]";
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

	public int getcQty() {
		return cQty;
	}

	public void setcQty(int cQty) {
		this.cQty = cQty;
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

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}
	
	
}
