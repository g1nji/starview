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

}
