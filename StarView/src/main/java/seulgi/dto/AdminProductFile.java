package seulgi.dto;

public class AdminProductFile {

	private int imgId;
	private int gId;
	private String fileName;
	private String fileType;
	
	public AdminProductFile() {}

	public AdminProductFile(int imgId, int gId, String fileName, String fileType) {
		super();
		this.imgId = imgId;
		this.gId = gId;
		this.fileName = fileName;
		this.fileType = fileType;
	}

	@Override
	public String toString() {
		return "AdminProductImage [imgId=" + imgId + ", gId=" + gId + ", fileName=" + fileName + ", fileType="
				+ fileType + "]";
	}

	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public int getgId() {
		return gId;
	}

	public void setgId(int gId) {
		this.gId = gId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
}
