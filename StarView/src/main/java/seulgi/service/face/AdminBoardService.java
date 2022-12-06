package seulgi.service.face;

import java.util.List;

import seulgi.dto.AdminBoard;
import seulgi.dto.AdminBoardPhoto;
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
	 * @param viewProd - 상세 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public AdminBoard view(AdminBoard viewBoard);

	/**
	 * 게시글 번호를 이용하여 업로드된 사진 정보 조회하기
	 * 
	 * @param viewBoard - 조회할 게시글 객체
	 * @return 첨부파일 정보 객체
	 */
	public AdminBoardPhoto getAttachFile(AdminBoard viewBoard);

}
