package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminBoard;
import seulgi.dto.AdminBoardFile;
import seulgi.util.Paging;
import seulgi.util.Search;

public interface AdminBoardDao {

	/**
	 * 게시글 전체 조회하기
	 * 
	 * @return 게시글 리스트
	 */
	public List<AdminBoard> selectAll(Paging paging);

	/**
	 * 전체 게시글 수를 조회하기
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

	/**
	 * 게시글 업로드하기
	 * 
	 * @param board - 업로드할 게시글 정보
	 */
	public void insertBoard(AdminBoard board);

	/**
	 * 첨부파일 정보 업로드하기
	 * 
	 * @param boardFile - 업로드할 첨부파일 정보
	 */
	public void insertFile(AdminBoardFile boardFile);
	
	/**
	 * 게시글 번호를 이용하여 첨부파일 정보 조회하기
	 * 
	 * @param viewBoard - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public AdminBoardFile selectFileByBoard(AdminBoard viewBoard);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회하기
	 * 
	 * @param boardFile - 조회할 첨부파일 번호
	 * @return 조회된 첨부파일 정보
	 */
	public AdminBoardFile selectFileByFile(AdminBoardFile boardFile);
	
	/**
	 * 게시글 정보 수정하기
	 * 
	 * @param board - 수정할 게시글 정보
	 */
	public void updateBoard(AdminBoard board);

	/**
	 * 게시글이 참조하고 있는 모든 첨부파일 삭제하기
	 * 
	 * @param board - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(AdminBoard board);

	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글 번호
	 */
	public void delete(AdminBoard board);

	public List<AdminBoard> searchBoard(String keyword);
	//public List<AdminBoard> searchBoard(Search search);
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	public int selectCntAll2();
	public List<AdminBoard> selectAll2(Paging paging);

	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	public int selectCntAll3();
	public List<AdminBoard> selectAll3(Paging paging);

	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//	public List<AdminBoard> selectAllBoard();
//	public List<AdminBoard> selectAllBoard(Paging paging);
//	public int selectCntAllBoard();
//	public void insertAllBoard(AdminBoard board);


}
