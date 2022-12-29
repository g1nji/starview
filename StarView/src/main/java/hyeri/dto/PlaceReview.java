package hyeri.dto;

import java.sql.Date;

public class PlaceReview {

	private int sreviewNo;
	private String sreviewContent;
	private Date sreviewDate;
	private String uId;
	private String uNick;
	private int arrivalNum;
	private String storedName;
	
	public PlaceReview() {}

	public PlaceReview(int sreviewNo, String sreviewContent, Date sreviewDate, String uId, String uNick, int arrivalNum,
			String storedName) {
		super();
		this.sreviewNo = sreviewNo;
		this.sreviewContent = sreviewContent;
		this.sreviewDate = sreviewDate;
		this.uId = uId;
		this.uNick = uNick;
		this.arrivalNum = arrivalNum;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "PlaceReview [sreviewNo=" + sreviewNo + ", sreviewContent=" + sreviewContent + ", sreviewDate="
				+ sreviewDate + ", uId=" + uId + ", uNick=" + uNick + ", arrivalNum=" + arrivalNum + ", storedName="
				+ storedName + "]";
	}

	public int getSreviewNo() {
		return sreviewNo;
	}

	public void setSreviewNo(int sreviewNo) {
		this.sreviewNo = sreviewNo;
	}

	public String getSreviewContent() {
		return sreviewContent;
	}

	public void setSreviewContent(String sreviewContent) {
		this.sreviewContent = sreviewContent;
	}

	public Date getSreviewDate() {
		return sreviewDate;
	}

	public void setSreviewDate(Date sreviewDate) {
		this.sreviewDate = sreviewDate;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public String getuNick() {
		return uNick;
	}

	public void setuNick(String uNick) {
		this.uNick = uNick;
	}

	public int getArrivalNum() {
		return arrivalNum;
	}

	public void setArrivalNum(int arrivalNum) {
		this.arrivalNum = arrivalNum;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

}
