package seulgi.dto;

import java.util.Date;

public class AdminBoard {
	
	//사진 갤러리
	private int galleryNo;
	private String galleryTitle;
	private String galleryContent;
	private Date galleryDate;
	private int galleryHit;
	private int galleryLike;
	private String uId;
	private int photoNo;
	private String galleryLoc;
	private String galleryTag;
	
	//상품 리뷰
	//private int rId;
	//private String rTitle;
	//private String rContent;
	//private Date regDate;
	//private int gId;
	
	//명소 후기
	//private int sreviewNo;
	//private String sreviewContent;
	//private Date sreviewDate;
	//private int arrivalNum;

	public AdminBoard() {}

	public AdminBoard(int galleryNo, String galleryTitle, String galleryContent, Date galleryDate, int galleryHit,
			int galleryLike, String uId, int photoNo, String galleryLoc, String galleryTag) {
		super();
		this.galleryNo = galleryNo;
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
		this.galleryDate = galleryDate;
		this.galleryHit = galleryHit;
		this.galleryLike = galleryLike;
		this.uId = uId;
		this.photoNo = photoNo;
		this.galleryLoc = galleryLoc;
		this.galleryTag = galleryTag;
	}

	@Override
	public String toString() {
		return "AdminBoard [galleryNo=" + galleryNo + ", galleryTitle=" + galleryTitle + ", galleryContent="
				+ galleryContent + ", galleryDate=" + galleryDate + ", galleryHit=" + galleryHit + ", galleryLike="
				+ galleryLike + ", uId=" + uId + ", photoNo=" + photoNo + ", galleryLoc=" + galleryLoc + ", galleryTag="
				+ galleryTag + "]";
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

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
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

}
