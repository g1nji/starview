package hyeri.dto;

public class GTag {
	
	private int tagNo;
	private String tagName;
	private int galleryNo;
	
	public GTag() {}

	public GTag(int tagNo, String tagName, int galleryNo) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
		this.galleryNo = galleryNo;
	}

	@Override
	public String toString() {
		return "GTag [tagNo=" + tagNo + ", tagName=" + tagName + ", galleryNo=" + galleryNo + "]";
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}

}
