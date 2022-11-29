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
	
	//상품 리뷰
	private int rId;
	private String rTitle;
	private String rContent;
	private Date regDate;
	private int gId;
	
	//명소 후기
	private int sreviewNo;
	private String sreviewContent;
	private Date sreviewDate;
	private int arrivalNum;

	public AdminBoard() {}

	public AdminBoard(int galleryNo, String galleryTitle, String galleryContent, Date galleryDate, int galleryHit,
			int galleryLike, String uId, int photoNo, int rId, String rTitle, String rContent, Date regDate, int gId,
			int sreviewNo, String sreviewContent, Date sreviewDate, int arrivalNum) {
		super();
		this.galleryNo = galleryNo;
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
		this.galleryDate = galleryDate;
		this.galleryHit = galleryHit;
		this.galleryLike = galleryLike;
		this.uId = uId;
		this.photoNo = photoNo;
		this.rId = rId;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.regDate = regDate;
		this.gId = gId;
		this.sreviewNo = sreviewNo;
		this.sreviewContent = sreviewContent;
		this.sreviewDate = sreviewDate;
		this.arrivalNum = arrivalNum;
	}

	@Override
	public String toString() {
		return "AdminBoard [galleryNo=" + galleryNo + ", galleryTitle=" + galleryTitle + ", galleryContent="
				+ galleryContent + ", galleryDate=" + galleryDate + ", galleryHit=" + galleryHit + ", galleryLike="
				+ galleryLike + ", uId=" + uId + ", photoNo=" + photoNo + ", rId=" + rId + ", rTitle=" + rTitle
				+ ", rContent=" + rContent + ", regDate=" + regDate + ", gId=" + gId + ", sreviewNo=" + sreviewNo
				+ ", sreviewContent=" + sreviewContent + ", sreviewDate=" + sreviewDate + ", arrivalNum=" + arrivalNum
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

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

	public int getSreviewNo() {
		return sreviewNo;
	}

	public void setSreviewNo(int sreviewNo) {
		this.sreviewNo = sreviewNo;
	}

	public String getSreviewContent() {
		return sreviewContent;
	}

	public void setSreviewContent(String sreviewContent) {
		this.sreviewContent = sreviewContent;
	}

	public Date getSreviewDate() {
		return sreviewDate;
	}

	public void setSreviewDate(Date sreviewDate) {
		this.sreviewDate = sreviewDate;
	}

	public int getArrivalNum() {
		return arrivalNum;
	}

	public void setArrivalNum(int arrivalNum) {
		this.arrivalNum = arrivalNum;
	}
	
}
