package seulgi.dto;

import java.util.Date;

public class AdminReport {
	
	private int rpCode;
	private Date rpDate;
	private String uId;
	private int galleryNo;
	
	public AdminReport() {}

	public AdminReport(int rpCode, Date rpDate, String uId, int galleryNo) {
		super();
		this.rpCode = rpCode;
		this.rpDate = rpDate;
		this.uId = uId;
		this.galleryNo = galleryNo;
	}

	@Override
	public String toString() {
		return "AdminReport [rpCode=" + rpCode + ", rpDate=" + rpDate + ", uId=" + uId + ", galleryNo=" + galleryNo
				+ "]";
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

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}
	
}
