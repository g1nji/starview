package hyeri.service.face;

import org.springframework.web.multipart.MultipartFile;

import hyeri.dto.PlaceReview;

public interface ReviewService {

	public void write(PlaceReview placeReview, MultipartFile file);

	public void write2(PlaceReview placeReview);

	public void delete(PlaceReview placeReview);

}
