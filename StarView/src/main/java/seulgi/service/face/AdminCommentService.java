package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminComment;
import seulgi.dto.AdminGallery;
import seulgi.util.Paging;

public interface AdminCommentService {

	public Paging getPaging(int curPage);
	public List<AdminComment> list(Paging paging);
	public List<AdminComment> view(AdminGallery viewBoard);
	public void delete(AdminComment board);
	public void report(AdminComment board);
	public List<AdminComment> search(String keyword);

}
