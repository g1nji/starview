package hyeri.dto;

import java.sql.Date;

public class GComment {
	
	private int cmNo;
	private String cmContent;
	private Date cmDate;
	private String userId;
	private int galleryNo;
	
	public GComment() {}

	public GComment(int cmNo, String cmContent, Date cmDate, String userId, int galleryNo) {
		super();
		this.cmNo = cmNo;
		this.cmContent = cmContent;
		this.cmDate = cmDate;
		this.userId = userId;
		this.galleryNo = galleryNo;
	}

	@Override
	public String toString() {
		return "GComment [cmNo=" + cmNo + ", cmContent=" + cmContent + ", cmDate=" + cmDate + ", userId=" + userId
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}
	
}
