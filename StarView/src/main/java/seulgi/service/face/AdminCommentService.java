package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminComment;
import seulgi.dto.AdminGallery;

public interface AdminCommentService {

	public List<AdminComment> list();
	public List<AdminComment> view(AdminGallery viewBoard);
	public void delete(AdminComment board);
	public void report(AdminComment board);

}
