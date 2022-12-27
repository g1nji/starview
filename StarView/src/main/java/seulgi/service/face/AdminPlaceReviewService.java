package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminPlaceReview;
import seulgi.util.Paging;

public interface AdminPlaceReviewService {

	public Paging getPaging3(int curPage);
	public List<AdminPlaceReview> list3(Paging paging);

}
