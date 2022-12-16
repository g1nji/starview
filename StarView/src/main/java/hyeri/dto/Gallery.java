package hyeri.dto;

import java.sql.Date;

public class Gallery {
	
	private int galleryNo;
	private String galleryTitle;
	private String galleryContent;
	private Date galleryDate;
	private int galleryHit;
	private int galleryLike;
	private String galleryLoc;
	private String uId;
	private String uNick;
	
	public Gallery() {}

	public Gallery(int galleryNo, String galleryTitle, String galleryContent, Date galleryDate, int galleryHit,
			int galleryLike, String galleryLoc, String uId, String uNick) {
		super();
		this.galleryNo = galleryNo;
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
		this.galleryDate = galleryDate;
		this.galleryHit = galleryHit;
		this.galleryLike = galleryLike;
		this.galleryLoc = galleryLoc;
		this.uId = uId;
		this.uNick = uNick;
	}

	@Override
	public String toString() {
		return "Gallery [galleryNo=" + galleryNo + ", galleryTitle=" + galleryTitle + ", galleryContent="
				+ galleryContent + ", galleryDate=" + galleryDate + ", galleryHit=" + galleryHit + ", galleryLike="
				+ galleryLike + ", galleryLoc=" + galleryLoc + ", uId=" + uId + ", uNick=" + uNick + "]";
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

	public String getGalleryLoc() {
		return galleryLoc;
	}

	public void setGalleryLoc(String galleryLoc) {
		this.galleryLoc = galleryLoc;
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
