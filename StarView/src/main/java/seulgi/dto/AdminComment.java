package seulgi.dto;

import java.util.Date;

public class AdminComment {
	
	private int cmNo;
	private String cmContent;
	private Date cmDate;
	private String uId;
	private int galleryNo;
	
	public AdminComment() {}

	public AdminComment(int cmNo, String cmContent, Date cmDate, String uId, int galleryNo) {
		super();
		this.cmNo = cmNo;
		this.cmContent = cmContent;
		this.cmDate = cmDate;
		this.uId = uId;
		this.galleryNo = galleryNo;
	}

	@Override
	public String toString() {
		return "AdminComment [cmNo=" + cmNo + ", cmContent=" + cmContent + ", cmDate=" + cmDate + ", uId=" + uId
				+ ", galleryNo=" + galleryNo + "]";
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

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}
	
}
