package seulgi.service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import seulgi.dto.AdminBoard;
import seulgi.dto.AdminBoardFile;
import seulgi.util.Paging;

public interface AdminBoardService {

	/**
	 * 페이징이 적용된 게시글 전체 조회하기
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 리스트
	 */
	public List<AdminBoard> list(Paging paging);

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
	 * 게시글 번호 이용하여 게시글 상세 조회하기
	 * 
	 * @param viewProd - 상세 조회하려는 게시글 정보 객체
	 * @return 조회된 게시글 정보 객체
	 */
	public AdminBoard view(AdminBoard viewBoard);

	/**
	 * 게시글, 첨부파일 업로드하기
	 * 
	 * @param board - 업로드할 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void upload(AdminBoard board, MultipartFile file);

	/**
	 * 게시글 업로드하기
	 * 
	 * @param board - 업로드할 게시글 정보 객체
	 */
	public void upload(AdminBoard board);
	
	/**
	 * 게시글 번호를 이용하여 업로드된 사진 정보 조회하기
	 * 
	 * @param viewBoard - 조회할 게시글 정보 객체
	 * @return 첨부파일 정보 객체
	 */
	public AdminBoardFile getAttachFile(AdminBoard viewBoard);

	/**
	 * 파일 번호를 이용하여 업로드된 파일 정보 조회하기
	 * 
	 * @param boardFile - 조회할 파일 번호 객체
	 * @return 첨부 파일 정보 객체
	 */
	public AdminBoardFile getFile(AdminBoardFile boardFile);
	
	/**
	 * 게시글 정보, 첨부파일 함께 처리하기
	 * 
	 * @param board - 수정할 게시글 정보 객체
	 * @param file - 첨부파일 정보 객체
	 */
	public void update(AdminBoard board, MultipartFile file);

	/**
	 * 게시글 정보만 처리하기
	 * 
	 * @param board - 수정할 게시글 정보 객체
	 */
	public void update(AdminBoard board);

	/**
	 * 게시글 삭제 + 첨부파일 삭제하기
	 * 
	 * @param board - 삭제할 게시글 정보 객체
	 */
	public void delete(AdminBoard board);

	public List<AdminBoard> list();
	public List<AdminBoard> search(String keyword);

	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	public Paging getPaging2(int curPage);
	public List<AdminBoard> list2(Paging paging);
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	public Paging getPaging3(int curPage);
	public List<AdminBoard> list3(Paging paging);

	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	public List<AdminBoard> listAll(Paging paging);
	public Paging getPagingAll(int curPage);


}
