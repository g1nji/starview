package hyeri.dto;

import java.sql.Date;

public class GalleryFile {
	
	private int photoNo;
	private int galleryNo;
	private String uId;
	private String storedName;
	private String originName;
	private String filepath;
	
	public GalleryFile() {}

	public GalleryFile(int photoNo, int galleryNo, String uId, String storedName, String originName, String filepath) {
		super();
		this.photoNo = photoNo;
		this.galleryNo = galleryNo;
		this.uId = uId;
		this.storedName = storedName;
		this.originName = originName;
		this.filepath = filepath;
	}

	@Override
	public String toString() {
		return "GalleryFile [photoNo=" + photoNo + ", galleryNo=" + galleryNo + ", uId=" + uId + ", storedName="
				+ storedName + ", originName=" + originName + ", filepath=" + filepath + "]";
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

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
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

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

}
