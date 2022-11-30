package hyeri.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyeri.dao.face.GalleryDao;
import hyeri.dto.Gallery;
import hyeri.service.face.GalleryService;
import hyeri.util.Paging;

@Service
public class GalleryServiceImpl implements GalleryService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GalleryDao galleryDao;
	
	@Override
	public Paging getPaging(int curPage) {

		//총 게시글 수 조회
		int totalCount = galleryDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Gallery> list(Paging paging) {
		return galleryDao.selectList(paging);
	}

	@Override
	public void write(Gallery writeParam) {
		galleryDao.uploadPhoto(writeParam);
	}
	
}
