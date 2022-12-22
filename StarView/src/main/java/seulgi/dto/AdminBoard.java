package seulgi.dto;

import java.util.Date;

public class AdminBoard {
	
	//카테고리
	//Admin_Board_Category
	//private int cateCode;
	
	//공지사항
	//Admin_Notice
	private int noticeCode;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	
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
	private int photoNo;
	private int tagNo;
	
	private String uId;

	//상품 리뷰
	//Review
	private int rId;
	private String rTitle;
	private String rContent;
	private Date regDate;
	private int gId;
	
	//명소 후기
	//Place_Review
	private int sreviewNo;
	private String sreviewContent;
	private Date sreviewDate;
	private int arrivalNum;

	public AdminBoard() {}

	public AdminBoard(int noticeCode, String noticeTitle, String noticeContent, Date noticeDate, int galleryNo,
			String galleryTitle, String galleryContent, Date galleryDate, int galleryHit, int galleryLike,
			String galleryLoc, String galleryTag, int photoNo, int tagNo, String uId, int rId, String rTitle,
			String rContent, Date regDate, int gId, int sreviewNo, String sreviewContent, Date sreviewDate,
			int arrivalNum) {
		super();
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.galleryNo = galleryNo;
		this.galleryTitle = galleryTitle;
		this.galleryContent = galleryContent;
		this.galleryDate = galleryDate;
		this.galleryHit = galleryHit;
		this.galleryLike = galleryLike;
		this.galleryLoc = galleryLoc;
		this.galleryTag = galleryTag;
		this.photoNo = photoNo;
		this.tagNo = tagNo;
		this.uId = uId;
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
		return "AdminBoard [noticeCode=" + noticeCode + ", noticeTitle=" + noticeTitle + ", noticeContent="
				+ noticeContent + ", noticeDate=" + noticeDate + ", galleryNo=" + galleryNo + ", galleryTitle="
				+ galleryTitle + ", galleryContent=" + galleryContent + ", galleryDate=" + galleryDate + ", galleryHit="
				+ galleryHit + ", galleryLike=" + galleryLike + ", galleryLoc=" + galleryLoc + ", galleryTag="
				+ galleryTag + ", photoNo=" + photoNo + ", tagNo=" + tagNo + ", uId=" + uId + ", rId=" + rId
				+ ", rTitle=" + rTitle + ", rContent=" + rContent + ", regDate=" + regDate + ", gId=" + gId
				+ ", sreviewNo=" + sreviewNo + ", sreviewContent=" + sreviewContent + ", sreviewDate=" + sreviewDate
				+ ", arrivalNum=" + arrivalNum + "]";
	}

	public int getNoticeCode() {
		return noticeCode;
	}

	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
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

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
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
