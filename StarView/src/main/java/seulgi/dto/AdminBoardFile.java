package seulgi.dto;

public class AdminBoardFile {
	
	private int photoNo;
	private int galleryNo;
	private String uId;
	private String originName;
	private String storedName;
	private String filepath;
	
	public AdminBoardFile() {}

	public AdminBoardFile(int photoNo, int galleryNo, String uId, String originName, String storedName,
			String filepath) {
		super();
		this.photoNo = photoNo;
		this.galleryNo = galleryNo;
		this.uId = uId;
		this.originName = originName;
		this.storedName = storedName;
		this.filepath = filepath;
	}

	@Override
	public String toString() {
		return "AdminBoardFile [photoNo=" + photoNo + ", galleryNo=" + galleryNo + ", uId=" + uId + ", originName="
				+ originName + ", storedName=" + storedName + ", filepath=" + filepath + "]";
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

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

}
