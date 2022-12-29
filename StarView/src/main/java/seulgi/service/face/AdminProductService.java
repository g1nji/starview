package seulgi.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import seulgi.dto.AdminGoodsReview;
import seulgi.dto.AdminProduct;
import seulgi.dto.AdminProductFile;
import seulgi.util.Paging;

public interface AdminProductService {

	/**
	 * 페이징이 적용된 상품 전체 조회하기
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 상품 리스트
	 */
	public List<AdminProduct> list(Paging paging);

	/**
	 * 게시글 목록을 위한 페이징 객체 생성하기
	 * 
	 * 	파라미터 curPage(현재 페이지)
	 * 	DB에서 조회한 totalCount(총 게시글 수)
	 * 	두 가지 데이터를 활용하여 페이징객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging객체
	 */
	public Paging getPaging(int curPage);
	
	/**
	 * 상품 번호 이용하여 상품 상세 조회하기
	 * 
	 * @param viewProd - 상세 조회하려는 상품 정보 객체
	 * @return 조회된 상품 정보 객체
	 */
	public AdminProduct view(AdminProduct viewProd);

	/**
	 * 상품, 첨부파일 업로드하기
	 * 
	 * @param prod - 업로드할 상품 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void upload(AdminProduct prod, MultipartFile file);

	/**
	 * 상품 번호를 이용하여 업로드된 파일 정보 조회하기
	 * 
	 * @param viewProd - 조회할 상품 정보 객체
	 * @return 첨부파일 정보 객체
	 */
	public AdminProductFile getAttachFile(AdminProduct viewProd);

	/**
	 * 상품 정보, 첨부파일을 함께 처리하기
	 * 
	 * @param prod - 수정할 상품 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(AdminProduct prod, MultipartFile file);
	
	/**
	 * 상품 정보만 처리하기
	 * 
	 * @param prod - 수정할 상품 정보 객체
	 */
	public void update(AdminProduct prod);

	/**
	 * 상품 삭제 + 첨부파일 삭제하기
	 * 
	 * @param prod - 삭제할 상품 정보 객체
	 */
	public void delete(AdminProduct prod);

	public AdminProductFile getAttachFile(AdminGoodsReview viewBoard);

	public AdminProduct view(AdminGoodsReview viewBoard);
	
}
