package seulgi.dto;

import java.util.Date;

public class AdminGallery {
	
	//공지사항
	//Admin_Notice
	//private int noticeCode;
	//private String noticeTitle;
	//private String noticeContent;
	//private Date noticeDate;
	
	//사진 갤러리
	//Gallery
	private int galleryNo;
	private String galleryTitle;
	private String galleryContent;
	private Date galleryDate;
	private int galleryHit;
	private int galleryLike;
	private String galleryLoc;
	private String galleryTag;
	private int tagNo;
	
	private String uId;
	private String uNick;
	
	private int cmNo;
	private String cmContent;
	private Date cmDate;
	
	private String storedName;

	private int photoNo;

	public AdminGallery() {}

	public AdminGallery(int galleryNo, String galleryTitle, String galleryContent, Date galleryDate, int galleryHit,
			int galleryLike, String galleryLoc, String galleryTag, int tagNo, String uId, String uNick, int cmNo,
			String cmContent, Date cmDate, String storedName, int photoNo) {
		super();
		this.galleryNo = galleryNo;
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
		this.galleryDate = galleryDate;
		this.galleryHit = galleryHit;
		this.galleryLike = galleryLike;
		this.galleryLoc = galleryLoc;
		this.galleryTag = galleryTag;
		this.tagNo = tagNo;
		this.uId = uId;
		this.uNick = uNick;
		this.cmNo = cmNo;
		this.cmContent = cmContent;
		this.cmDate = cmDate;
		this.storedName = storedName;
		this.photoNo = photoNo;
	}

	@Override
	public String toString() {
		return "AdminGallery [galleryNo=" + galleryNo + ", galleryTitle=" + galleryTitle + ", galleryContent="
				+ galleryContent + ", galleryDate=" + galleryDate + ", galleryHit=" + galleryHit + ", galleryLike="
				+ galleryLike + ", galleryLoc=" + galleryLoc + ", galleryTag=" + galleryTag + ", tagNo=" + tagNo
				+ ", uId=" + uId + ", uNick=" + uNick + ", cmNo=" + cmNo + ", cmContent=" + cmContent + ", cmDate="
				+ cmDate + ", storedName=" + storedName + ", photoNo=" + photoNo + "]";
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

	public String getGalleryTag() {
		return galleryTag;
	}

	public void setGalleryTag(String galleryTag) {
		this.galleryTag = galleryTag;
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
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

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

}
