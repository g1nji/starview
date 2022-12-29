package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminComment;
import seulgi.dto.AdminGallery;

public interface AdminCommentDao {

	public List<AdminComment> selectAll();
	public List<AdminComment> selectComment(AdminGallery viewBoard);
	public void delete(AdminComment board);

}
