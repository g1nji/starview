package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminGoodsReview;
import seulgi.dto.AdminProduct;
import seulgi.dto.AdminProductFile;
import seulgi.util.Paging;

public interface AdminProductDao {

	/**
	 * 상품 전체 조회하기
	 * 
	 * @return 상품 리스트
	 */
	public List<AdminProduct> selectAll(Paging paging);

	/**
	 * 전체 게시글 수 조회하기
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();
	

	/**
	 * 상품 번호 이용하여 상품 상세 조회하기
	 * 
	 * @param viewProd - 상세 조회하려는 상품 번호
	 * @return 조회된 상품 정보
	 */
	public AdminProduct selectProd(AdminProduct viewProd);

	/**
	 * 상품 업로드하기
	 * 
	 * @param prod - 업로드할 상품 정보
	 */
	public void insertProd(AdminProduct prod);

	/**
	 * 첨부파일 업로드하기
	 * 
	 * @param prodFile - 업로드할 첨부파일 정보
	 */
	public void insertFile(AdminProductFile prodFile);

	/**
	 * 상품 번호를 이용하여 첨부파일 정보 조회하기
	 * 
	 * @param viewProd - 조회할 상품 번호
	 * @return 조회된 첨부파일 정보
	 */
	public AdminProductFile selectImageFile(AdminProduct viewProd);

	/**
	 * 상품 수정하기
	 * 
	 * @param prod - 수정할 상품 정보
	 */
	public void updateProd(AdminProduct prod);

	/**
	 * 상품이 참조하고 있는 모든 첨부파일 삭제하기
	 * 
	 * @param prod - 첨부파일을 삭제할 상품 번호
	 */
	public void deleteFile(AdminProduct prod);

	/**
	 * 상품 삭제
	 * 
	 * @param prod - 삭제할 상품 번호
	 */
	public void deleteProd(AdminProduct prod);

	public AdminProductFile selectImageFile2(AdminGoodsReview viewBoard);
	public void deleteFile2(AdminGoodsReview board);
	public AdminProduct selectProd2(AdminGoodsReview viewBoard);

	public List<AdminProduct> searchProd(String keyword);

}
