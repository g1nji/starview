package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminComment;

public interface AdminCommentDao {

	public List<AdminComment> selectAll(int galleryNo);

}
