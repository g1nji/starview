package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminComment;

public interface AdminCommentService {

	public List<AdminComment> list();
	public List<AdminComment> view(int galleryNo);

}
