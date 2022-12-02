package hyeri.dto;

import java.sql.Date;

public class GalleryFile {
	
	private int photoNo;
	private int galleryNo;
	private String userId;
	private String storedName;
	private String originName;
	
	public GalleryFile() {}

	public GalleryFile(int photoNo, int galleryNo, String userId, String storedName, String originName) {
		super();
		this.photoNo = photoNo;
		this.galleryNo = galleryNo;
		this.userId = userId;
		this.storedName = storedName;
		this.originName = originName;
	}

	@Override
	public String toString() {
		return "GalleryFile [photoNo=" + photoNo + ", galleryNo=" + galleryNo + ", userId=" + userId + ", storedName="
				+ storedName + ", originName=" + originName + "]";
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
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

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}
	
}
