package hyeri.dto;

import java.sql.Date;

public class Gallery {
	
	private int galleryNo;
	private String galleryTitle;
	private String galleryContent;
	private Date galleryDate;
	private int galleryHit;
	private int galleryLike;
	private String uId;
	private String uNick;
	private String galleryLoc;
	private String tag;
	
	public Gallery() {}

	public Gallery(int galleryNo, String galleryTitle, String galleryContent, Date galleryDate, int galleryHit,
			int galleryLike, String uId, String uNick, String galleryLoc, String tag) {
		super();
		this.galleryNo = galleryNo;
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
		this.galleryDate = galleryDate;
		this.galleryHit = galleryHit;
		this.galleryLike = galleryLike;
		this.uId = uId;
		this.uNick = uNick;
		this.galleryLoc = galleryLoc;
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "Gallery [galleryNo=" + galleryNo + ", galleryTitle=" + galleryTitle + ", galleryContent="
				+ galleryContent + ", galleryDate=" + galleryDate + ", galleryHit=" + galleryHit + ", galleryLike="
				+ galleryLike + ", uId=" + uId + ", uNick=" + uNick + ", galleryLoc=" + galleryLoc + ", tag=" + tag
				+ "]";
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

	public int getGalleryHit() {
		return galleryHit;
	}

	public void setGalleryHit(int galleryHit) {
		this.galleryHit = galleryHit;
	}

	public int getGalleryLike() {
		return galleryLike;
	}

	public void setGalleryLike(int galleryLike) {
		this.galleryLike = galleryLike;
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

	public String getGalleryLoc() {
		return galleryLoc;
	}

	public void setGalleryLoc(String galleryLoc) {
		this.galleryLoc = galleryLoc;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

}
