package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminComment;
import seulgi.dto.AdminGallery;
import seulgi.util.Paging;

public interface AdminCommentDao {

	public List<AdminComment> selectAll(Paging paging);
	public int selectCntAll();
	public List<AdminComment> selectComment(AdminGallery viewBoard);
	public void delete(AdminComment board);
	public void insertBoard(AdminComment board);
	public List<AdminComment> searchBoard(String keyword);

}
