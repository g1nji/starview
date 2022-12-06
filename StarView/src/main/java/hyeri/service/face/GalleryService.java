package hyeri.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import hyeri.dto.Gallery;
import hyeri.util.Paging;

public interface GalleryService {

	/**
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * 파라미터 curPage(현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Gallery> list(Paging paging);

	/**
	 * 게시글 정보, 첨부파일을 함께 처리한다
	 * 
	 * @param writeParam - 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void write(Gallery gallery, MultipartFile file);

	/**
	 * 게시글 상세보기
	 * 
	 * @param viewGallery - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Gallery view(Gallery viewGallery);

}
