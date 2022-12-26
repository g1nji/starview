package seulgi.dto;

import java.util.Date;

public class AdminComment {
	
	private int cmNo;
	private String cmContent;
	private Date cmDate;
	private int galleryNo;
	private String uId;
	private String uNick;
	
	public AdminComment() {}

	public AdminComment(int cmNo, String cmContent, Date cmDate, int galleryNo, String uId, String uNick) {
		super();
		this.cmNo = cmNo;
		this.cmContent = cmContent;
		this.cmDate = cmDate;
		this.galleryNo = galleryNo;
		this.uId = uId;
		this.uNick = uNick;
	}

	@Override
	public String toString() {
		return "AdminComment [cmNo=" + cmNo + ", cmContent=" + cmContent + ", cmDate=" + cmDate + ", galleryNo="
				+ galleryNo + ", uId=" + uId + ", uNick=" + uNick + "]";
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
