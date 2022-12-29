package seulgi.dto;

import java.util.Date;

public class AdminReport {
	
	private int reportCode;
	private Date reportDate;
	
	private int galleryNo;
	private String galleryTitle;
	private String galleryContent;
	private Date galleryDate;
	
	private int cmNo;
	private String cmContent;
	private Date cmDate;
	
	private String uId;
	private String uNick;
	
	public AdminReport() {}

	public AdminReport(int reportCode, Date reportDate, int galleryNo, String galleryTitle, String galleryContent,
			Date galleryDate, int cmNo, String cmContent, Date cmDate, String uId, String uNick) {
		super();
		this.reportCode = reportCode;
		this.reportDate = reportDate;
		this.galleryNo = galleryNo;
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
		this.galleryDate = galleryDate;
		this.cmNo = cmNo;
		this.cmContent = cmContent;
		this.cmDate = cmDate;
		this.uId = uId;
		this.uNick = uNick;
	}

	@Override
	public String toString() {
		return "AdminReport [reportCode=" + reportCode + ", reportDate=" + reportDate + ", galleryNo=" + galleryNo
				+ ", galleryTitle=" + galleryTitle + ", galleryContent=" + galleryContent + ", galleryDate="
				+ galleryDate + ", cmNo=" + cmNo + ", cmContent=" + cmContent + ", cmDate=" + cmDate + ", uId=" + uId
				+ ", uNick=" + uNick + "]";
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}

	public String getGalleryTitle() {
		return galleryTitle;
	}

	public void setGalleryTitle(String galleryTitle) {
		this.galleryTitle = galleryTitle;
	}

	public String getGalleryContent() {
		return galleryContent;
	}

	public void setGalleryContent(String galleryContent) {
		this.galleryContent = galleryContent;
	}

	public Date getGalleryDate() {
		return galleryDate;
	}

	public void setGalleryDate(Date galleryDate) {
		this.galleryDate = galleryDate;
	}

	public int getCmNo() {
		return cmNo;
	}

	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	public Date getCmDate() {
		return cmDate;
	}

	public void setCmDate(Date cmDate) {
		this.cmDate = cmDate;
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
