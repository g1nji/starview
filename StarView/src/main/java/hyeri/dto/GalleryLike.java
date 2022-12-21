package hyeri.dto;

public class GalleryLike {
	
	private int likeNo;
	private int galleryNo;
	private String uId;
	private int likeCheck;
	
	public GalleryLike() {}

	public GalleryLike(int likeNo, int galleryNo, String uId, int likeCheck) {
		super();
		this.likeNo = likeNo;
		this.galleryNo = galleryNo;
		this.uId = uId;
		this.likeCheck = likeCheck;
	}

	@Override
	public String toString() {
		return "GalleryLike [likeNo=" + likeNo + ", galleryNo=" + galleryNo + ", uId=" + uId + ", likeCheck="
				+ likeCheck + "]";
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
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

	public int getLikeCheck() {
		return likeCheck;
	}

	public void setLikeCheck(int likeCheck) {
		this.likeCheck = likeCheck;
	}

}
