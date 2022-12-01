package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminProduct;
import seulgi.util.Paging;

public interface AdminProductService {

	/**
	 * 상품 전체 조회하기
	 * 
	 * @return 상품 리스트
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
	 * @param viewProd - 상세 조회하려는 상품 번호
	 * @return 조회된 상품 정보
	 */
	public AdminProduct view(AdminProduct viewProd);

	/**
	 * 상품 업로드하기
	 * 
	 * @param prod - 업로드할 상품 정보
	 * @return 업로드된 상품 정보
	 */
	public void upload(AdminProduct prod);
}
