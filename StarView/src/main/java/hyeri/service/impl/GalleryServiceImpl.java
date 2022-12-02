package hyeri.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import hyeri.dao.face.GalleryDao;
import hyeri.dto.Gallery;
import hyeri.dto.GalleryFile;
import hyeri.service.face.GalleryService;
import hyeri.util.Paging;

@Service
public class GalleryServiceImpl implements GalleryService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired GalleryDao galleryDao;
	
	@Autowired ServletContext context;
	
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
	public void write(Gallery writeParam, MultipartFile file) {
		
		//게시글 처리
		if( "".equals( writeParam.getGalleryTitle() ) ) {
			writeParam.setGalleryTitle("(무제)");
		}
		
		galleryDao.uploadPhoto(writeParam);
		
		//---------------------------------------------------
		
//		//첨부파일 처리
//		
//		//빈 파일일 경우
//		if( file.getSize() <= 0 ) {
//			return;
//		}
//		
//		//파일이 저장될 경로
//		String storedPath = context.getRealPath("upload");
//		File storedFolder = new File( storedPath );
//		if( !storedFolder.exists() ) {
//			storedFolder.mkdir();
//		}
//		
//		//파일이 저장될 이름
//		String originName = file.getOriginalFilename();
//		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
//		
//		//저장할 파일의 정보 객체
//		File dest = new File( storedFolder, storedName );
//		
//		try {
//			file.transferTo(dest);
//		} catch (IllegalStateException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		//---------------------------------------------------
//		
//		//첨부파일 정보 DB 기록
//		
//		GalleryFile galleryFile = new GalleryFile();
//		galleryFile.setGalleryNo( writeParam.getGalleryNo() );
//		galleryFile.setUserId( writeParam.getUserId() );
//		galleryFile.setOriginName(originName);
//		galleryFile.setStoredName(storedName);
//		
//		galleryDao.insertPhoto(galleryFile);
		
	}
	
}
