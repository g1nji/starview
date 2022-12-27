package hyeri.dto;

import java.sql.Date;

public class PlaceReview {

	private int sreviewNo;
	private String sreviewContent;
	private Date sreviewDate;
	private String uId;
	private int arrivalNum;
	
	public PlaceReview() {}

	public PlaceReview(int sreviewNo, String sreviewContent, Date sreviewDate, String uId, int arrivalNum) {
		super();
		this.sreviewNo = sreviewNo;
		this.sreviewContent = sreviewContent;
		this.sreviewDate = sreviewDate;
		this.uId = uId;
		this.arrivalNum = arrivalNum;
	}

	@Override
	public String toString() {
		return "PlaceReview [sreviewNo=" + sreviewNo + ", sreviewContent=" + sreviewContent + ", sreviewDate="
				+ sreviewDate + ", uId=" + uId + ", arrivalNum=" + arrivalNum + "]";
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

	public int getArrivalNum() {
		return arrivalNum;
	}

	public void setArrivalNum(int arrivalNum) {
		this.arrivalNum = arrivalNum;
	}
	
}
