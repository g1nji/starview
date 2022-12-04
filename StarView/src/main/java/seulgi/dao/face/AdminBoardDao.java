package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminBoard;
import seulgi.util.Paging;

public interface AdminBoardDao {

	/**
	 * 게시글 전체 조회하기
	 * 
	 * @return 게시글 리스트
	 */
	public List<AdminBoard> selectAll(Paging paging);

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 게시글 번호 이용하여 게시글 상세 조회하기
	 * 
	 * @param viewBoard - 상세 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public AdminBoard selectBoard(AdminBoard viewBoard);
}
