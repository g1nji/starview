package hyeri.dto;

public class ReviewFile {
	
	private int photoNo;
	private String originName;
	private String storedName;
	private String filepath;
	private int sreviewNo;
	
	public ReviewFile() {}

	public ReviewFile(int photoNo, String originName, String storedName, String filepath, int sreviewNo) {
		super();
		this.photoNo = photoNo;
		this.originName = originName;
		this.storedName = storedName;
		this.filepath = filepath;
		this.sreviewNo = sreviewNo;
	}

	@Override
	public String toString() {
		return "ReviewFile [photoNo=" + photoNo + ", originName=" + originName + ", storedName=" + storedName
				+ ", filepath=" + filepath + ", sreviewNo=" + sreviewNo + "]";
	}

	public int getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
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

	public int getSreviewNo() {
		return sreviewNo;
	}

	public void setSreviewNo(int sreviewNo) {
		this.sreviewNo = sreviewNo;
	}

}
