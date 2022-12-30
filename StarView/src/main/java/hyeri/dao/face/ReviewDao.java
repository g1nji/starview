package hyeri.dao.face;

import hyeri.dto.PlaceReview;
import hyeri.dto.ReviewFile;

public interface ReviewDao {

	public void insertReview(PlaceReview placeReview);

	public void insertPhoto(ReviewFile reviewFile);

	public void updateFilepath(PlaceReview placeReview);

	public void deleteFile(PlaceReview placeReview);

	public void delete(PlaceReview placeReview);

}
