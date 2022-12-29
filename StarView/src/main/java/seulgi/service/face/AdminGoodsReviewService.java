package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminGoodsReview;
import seulgi.util.Paging;

public interface AdminGoodsReviewService {

	public Paging getPaging(int curPage);
	public List<AdminGoodsReview> list(Paging paging);
	public AdminGoodsReview view(AdminGoodsReview viewBoard);
	public void delete(AdminGoodsReview board);

}
