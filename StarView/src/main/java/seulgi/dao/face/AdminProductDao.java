package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminProduct;

public interface AdminProductDao {

	/**
	 * 상품 전체 조회하기
	 * 
	 * @return 상품 리스트
	 */
	public List<AdminProduct> selectAll();

	/**
	 * 상품 업로드하기
	 * 
	 * @param product - 업로드할 상품 정보
	 * @return 업로드된 상품 정보
	 */
	public AdminProduct insert(AdminProduct product);

}
