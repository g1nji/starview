package hyeri.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import hyeri.dao.face.GalleryDao;
import hyeri.dto.GComment;
import hyeri.dto.GTag;
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
	public Gallery view(Gallery viewGallery) {
		
		//조회수 증가
		galleryDao.updateHit(viewGallery);
		
		//상세보기 조회 결과 리턴
		return galleryDao.selectGallery(viewGallery);
		
	}
	
	@Override
	public GalleryFile getAttachFile(Gallery viewGallery) {
		return galleryDao.selectGalleryFileByGalleryNo(viewGallery);
	}

	@Override
	public void write(Gallery gallery, MultipartFile file, List<GTag> tagList) {
		
		//게시글 처리
		if( "".equals( gallery.getGalleryTitle() ) ) {
			gallery.setGalleryTitle("(무제)");
		}
		
		galleryDao.uploadPhoto(gallery);
		
		//---------------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------
		
		//첨부파일 정보 DB 기록
		
		GalleryFile galleryFile = new GalleryFile();
		galleryFile.setGalleryNo( gallery.getGalleryNo() );
		galleryFile.setuId( gallery.getuId() );
		galleryFile.setOriginName(originName);
		galleryFile.setStoredName(storedName);
		galleryFile.setFilepath(storedPath);
		
		galleryDao.insertPhoto(galleryFile);
		
		//---------------------------------------------------
		
		GTag gTag = new GTag();
		for( int i=0; i<tagList.size(); i++ ) {
			String t= tagList.get(i).getTagName();
			gTag.setTagName(t);
			gTag.setGalleryNo( gallery.getGalleryNo() );
		}
		
		galleryDao.insertTag(gTag);
		
	}
	
	@Override
	public void write2(Gallery gallery, MultipartFile file) {

		//게시글 처리
		if( "".equals( gallery.getGalleryTitle() ) ) {
			gallery.setGalleryTitle("(무제)");
		}
		
		galleryDao.uploadPhoto(gallery);
		
		//---------------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------
		
		//첨부파일 정보 DB 기록
		
		GalleryFile galleryFile = new GalleryFile();
		galleryFile.setGalleryNo( gallery.getGalleryNo() );
		galleryFile.setuId( gallery.getuId() );
		galleryFile.setOriginName(originName);
		galleryFile.setStoredName(storedName);
		galleryFile.setFilepath(storedPath);
		
		galleryDao.insertPhoto(galleryFile);
		
	}
	
	@Override
	public void update(Gallery viewGallery, MultipartFile file) {
		
		//게시글 처리
		if( "".equals( viewGallery.getGalleryTitle() ) ) {
			viewGallery.setGalleryTitle("(무제)");
		}
		
		galleryDao.updatePhoto(viewGallery);
		
		//---------------------------------------------------
		
		//첨부파일 처리
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//---------------------------------------------------
		
		//첨부파일 정보 DB 기록
		
		GalleryFile galleryFile = new GalleryFile();
		galleryFile.setGalleryNo( viewGallery.getGalleryNo() );
		galleryFile.setuId( viewGallery.getuId() );
		galleryFile.setOriginName(originName);
		galleryFile.setStoredName(storedName);
		
		//기존에 게시글에 연결된 첨부파일 삭제
		galleryDao.deleteFile(viewGallery);
		
		galleryDao.insertPhoto(galleryFile);
		
	}
	
	@Override
	public void delete(Gallery gallery) {

		//첨부파일 삭제
		galleryDao.deleteFile(gallery);
		
		//게시글 삭제
		galleryDao.delete(gallery);
	}
	
	@Override
	public List<Gallery> search(String keywordInput) {
		
		return galleryDao.selectByKeyword(keywordInput);
	}
	
}
