package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminGoodsReview;
import seulgi.util.Paging;

public interface AdminGoodsReviewDao {

	public int selectCntAll();
	public List<AdminGoodsReview> selectAll(Paging paging);
	public AdminGoodsReview selectBoard(AdminGoodsReview viewBoard);
	public void delete(AdminGoodsReview board);

}
