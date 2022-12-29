package seulgi.dto;

import java.util.Date;

public class AdminReport {
	
	private int rpCode;
	private Date rpDate;
	private int galleryNo;
	private String uId;
	private String uNick;
	
	public AdminReport() {}

	public AdminReport(int rpCode, Date rpDate, int galleryNo, String uId, String uNick) {
		super();
		this.rpCode = rpCode;
		this.rpDate = rpDate;
		this.galleryNo = galleryNo;
		this.uId = uId;
		this.uNick = uNick;
	}

	@Override
	public String toString() {
		return "AdminReport [rpCode=" + rpCode + ", rpDate=" + rpDate + ", galleryNo=" + galleryNo + ", uId=" + uId
				+ ", uNick=" + uNick + "]";
	}

	public int getRpCode() {
		return rpCode;
	}

	public void setRpCode(int rpCode) {
		this.rpCode = rpCode;
	}

	public Date getRpDate() {
		return rpDate;
	}

	public void setRpDate(Date rpDate) {
		this.rpDate = rpDate;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
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

}
