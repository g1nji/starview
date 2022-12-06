package seulgi.dto;

public class AdminBoardPhoto {
	
	private int photoNo;
	private int galleryNo;
	private String uId;
	private String originName;
	private String storedName;
	
	public AdminBoardPhoto() {}

	public AdminBoardPhoto(int photoNo, int galleryNo, String uId, String originName, String storedName) {
		super();
		this.photoNo = photoNo;
		this.galleryNo = galleryNo;
		this.uId = uId;
		this.originName = originName;
		this.storedName = storedName;
	}

	@Override
	public String toString() {
		return "AdminBoardPhoto [photoNo=" + photoNo + ", galleryNo=" + galleryNo + ", uId=" + uId + ", originName="
				+ originName + ", storedName=" + storedName + "]";
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

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

}
