package hyeri.service.face;

import java.util.List;

import hyeri.dto.GComment;
import hyeri.dto.Gallery;

public interface CommentService {

	/**
	 * 
	 * @param gComment
	 */
	public void write(GComment gComment);

	/**
	 * 
	 * @param galleryNo
	 * @return
	 */
	public List<GComment> view(int galleryNo);

}
