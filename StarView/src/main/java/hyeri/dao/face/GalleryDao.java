package hyeri.dao.face;

import java.util.List;

import hyeri.dto.Gallery;
import hyeri.dto.GalleryFile;
import hyeri.util.Paging;

public interface GalleryDao {
	
	/**
	 * 
	 * @return
	 */
	public int selectCntAll();

	/**
	 * 
	 * @param paging
	 * @return
	 */
	public List<Gallery> selectList(Paging paging);

	/**
	 * 
	 * @param writeParam
	 */
	public void uploadPhoto(Gallery writeParam);

	public void insertPhoto(GalleryFile galleryFile);

	
}
