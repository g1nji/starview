package hyeri.dao.face;

import java.util.List;

import hyeri.dto.GComment;
import hyeri.dto.Gallery;

public interface CommentDao {

	/**
	 * 
	 * @param gComment
	 */
	public void insertComment(GComment gComment);

	/**
	 * 
	 * @param gComment
	 * @return
	 */
	public List<GComment> selectGalleryNo(int galleryNo);

}
