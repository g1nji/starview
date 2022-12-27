package hyeri.dao.face;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import hyeri.dto.GComment;
import hyeri.dto.GTag;
import hyeri.dto.Gallery;
import hyeri.dto.GalleryFile;
import hyeri.util.Paging;

public interface GalleryDao {
	
	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 *  
	 * @param paging - 페이징 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Gallery> selectList(Paging paging);
	
	/**
	 * 조회하려는 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param viewGallery - 조회된 게시글 번호
	 */
	public void updateHit(Gallery viewGallery);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param viewGallery - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public Gallery selectGallery(Gallery viewGallery);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param gallery - 삽입할 게시글 정보
	 */
	public void uploadPhoto(Gallery gallery);
	
	public void updateCm(Gallery gallery);

	/**
	 * 첨부파일 정보를 삽입한다
	 * 
	 * @param galleryFile - 삽입할 첨부파일 정보
	 */
	public void insertPhoto(GalleryFile galleryFile);

	/**
	 * 파일 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param viewGallery - 조회할 첨부파일 객체
	 * @return 조회된 첨부파일 정보
	 */
	public GalleryFile selectGalleryFileByGalleryNo(Gallery viewGallery);

	/**
	 * 게시글 정보 수정
	 * 
	 * @param viewGallery - 수정할 게시글 정보
	 */
	public void updatePhoto(Gallery viewGallery);
	
	/**
	 * 게시글을 참조하고 있는 모든 첨부파일 삭제ㅔ
	 * 
	 * @param galleryFile - 첨부파일을 삭제할 게시글 번호
	 */
	public void deleteFile(GalleryFile galleryFile);

	/**
	 * 게시글 삭제
	 * 
	 * @param gallery - 삭제할 게시글 번호
	 */
	public void delete(Gallery gallery);

	/**
	 * 
	 * @param gTag
	 */
	public void insertTag(GTag gTag);

	/**
	 * 
	 * @param keywordInput
	 * @return
	 */
	public List<Gallery> selectByKeyword(String keywordInput);

	public List<GComment> selectCList(Paging paging);

	public void updateFilepath(Gallery gallery);

	public List<GTag> selectGalleryNo(int galleryNo);


}
