package hyeri.dto;

public class GalleryTag {
	
	private int tagNo;
	private int galleryNo;
	
	public GalleryTag() {}

	public GalleryTag(int tagNo, int galleryNo) {
		super();
		this.tagNo = tagNo;
		this.galleryNo = galleryNo;
	}

	@Override
	public String toString() {
		return "GalleryTag [tagNo=" + tagNo + ", galleryNo=" + galleryNo + "]";
	}

	public int getTagNo() {
		return tagNo;
	}

	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}

	public int getGalleryNo() {
		return galleryNo;
	}

	public void setGalleryNo(int galleryNo) {
		this.galleryNo = galleryNo;
	}
	
}
