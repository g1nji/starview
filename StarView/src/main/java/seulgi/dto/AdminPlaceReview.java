package seulgi.dto;

import java.util.Date;

public class AdminPlaceReview {
	
	private String uId;
	private String uNick;

	//명소 후기
	//Place_Review
	private int sreviewNo;
	private String sreviewContent;
	private Date sreviewDate;
	private int arrivalNum;
	private String storedName;
	
	public AdminPlaceReview() {}

	public AdminPlaceReview(String uId, String uNick, int sreviewNo, String sreviewContent, Date sreviewDate,
			int arrivalNum, String storedName) {
		super();
		this.uId = uId;
		this.uNick = uNick;
		this.sreviewNo = sreviewNo;
		this.sreviewContent = sreviewContent;
		this.sreviewDate = sreviewDate;
		this.arrivalNum = arrivalNum;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "AdminPlaceReview [uId=" + uId + ", uNick=" + uNick + ", sreviewNo=" + sreviewNo + ", sreviewContent="
				+ sreviewContent + ", sreviewDate=" + sreviewDate + ", arrivalNum=" + arrivalNum + ", storedName="
				+ storedName + "]";
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
