package hyeri.dto;

import java.sql.Date;

public class GComment {
	
	private int cmNo;
	private String cmContent;
	private Date cmDate;
	private String uId;
	private String uNick;
	private int galleryNo;
	
	public GComment() {}

	public GComment(int cmNo, String cmContent, Date cmDate, String uId, String uNick, int galleryNo) {
		super();
		this.cmNo = cmNo;
		this.cmContent = cmContent;
		this.cmDate = cmDate;
		this.uId = uId;
		this.uNick = uNick;
		this.galleryNo = galleryNo;
	}

	@Override
	public String toString() {
		return "GComment [cmNo=" + cmNo + ", cmContent=" + cmContent + ", cmDate=" + cmDate + ", uId=" + uId
				+ ", uNick=" + uNick + ", galleryNo=" + galleryNo + "]";
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

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}

}
