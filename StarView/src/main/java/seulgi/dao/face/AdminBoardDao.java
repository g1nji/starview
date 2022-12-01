package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminBoard;

public interface AdminBoardDao {

	/**
	 * 게시글 전체 조회하기
	 * 
	 * @return 게시글 리스트
	 */
	public List<AdminBoard> selectAll();

}
