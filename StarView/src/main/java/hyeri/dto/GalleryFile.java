package hyeri.dto;

import java.sql.Date;

public class GalleryFile {
	
	private int photoNo;
	private String photoName;
	private Date photoDate;
	private int galleryNo;
	private String userId;
	
	public GalleryFile() {}

	public GalleryFile(int photoNo, String photoName, Date photoDate, int galleryNo, String userId) {
		super();
		this.photoNo = photoNo;
		this.photoName = photoName;
		this.photoDate = photoDate;
		this.galleryNo = galleryNo;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "GalleryFile [photoNo=" + photoNo + ", photoName=" + photoName + ", photoDate=" + photoDate
				+ ", galleryNo=" + galleryNo + ", userId=" + userId + "]";
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public Date getPhotoDate() {
		return photoDate;
	}

	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
