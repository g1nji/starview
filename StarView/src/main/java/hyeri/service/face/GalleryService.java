package hyeri.service.face;

import java.util.List;

import hyeri.dto.Gallery;
import hyeri.util.Paging;

public interface GalleryService {

	/**
	 * 
	 * @param curPage
	 * @return
	 */
	public Paging getPaging(int curPage);

	/**
	 * 
	 * @param paging
	 * @return
	 */
	public List<Gallery> list(Paging paging);

}
