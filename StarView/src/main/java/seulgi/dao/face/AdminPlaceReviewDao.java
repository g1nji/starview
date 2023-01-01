package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminPlaceReview;
import seulgi.util.Paging;

public interface AdminPlaceReviewDao {

	public int selectCntAll();
	public List<AdminPlaceReview> selectAll(Paging paging);
	public AdminPlaceReview selectBoard(AdminPlaceReview viewBoard);
	public void delete(AdminPlaceReview board);
	public List<AdminPlaceReview> searchBoard(String keyword);

}
