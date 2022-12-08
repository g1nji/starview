package hyeri.dto;

public class GTag {
	
	private int tagNo;
	private String tagName;
	
	public GTag() {}

	public GTag(int tagNo, String tagName) {
		super();
		this.tagNo = tagNo;
		this.tagName = tagName;
	}

	@Override
	public String toString() {
		return "GTag [tagNo=" + tagNo + ", tagName=" + tagName + "]";
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
	
}
