package seulgi.dao.face;

import java.util.List;

import seulgi.dto.AdminBoardFile;
import seulgi.dto.AdminGallery;
import seulgi.util.Paging;

public interface AdminGalleryDao {

	/**
	 * 게시글 전체 조회하기
	 * 
	 * @return 게시글 리스트
	 */
	public List<AdminGallery> selectAll(Paging paging);

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
	public AdminGallery selectBoard(AdminGallery viewBoard);

	/**
	 * 게시글 업로드하기
	 * 
	 * @param board - 업로드할 게시글 정보
	 */
	public void insertBoard(AdminGallery board);

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
	public AdminBoardFile selectFileByBoard(AdminGallery viewBoard);

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
	public void updateBoard(AdminGallery board);

	/**
	 * 게시글이 참조하고 있는 모든 첨부파일 삭제하기
	 * 
	 * @param board - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(AdminGallery board);

	/**
	 * 게시글 삭제
	 * 
	 * @param board - 삭제할 게시글 번호
	 */
	public void delete(AdminGallery board);

	public List<AdminGallery> searchBoard(String keyword);
	//public List<AdminBoard> searchBoard(Search search);

	/**
	 * 게시글이 참조하고 있는 모든 댓글 삭제하기
	 * 
	 * @param board - 댓글을 삭제할 게시글 번호
	 */
	public void deleteComm(AdminGallery board);

	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//	public List<AdminBoard> selectAllBoard();
//	public List<AdminBoard> selectAllBoard(Paging paging);
//	public int selectCntAllBoard();
//	public void insertAllBoard(AdminBoard board);

}
