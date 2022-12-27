package hyeri.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import hyeri.dao.face.ReviewDao;
import hyeri.dto.PlaceReview;
import hyeri.dto.ReviewFile;
import hyeri.service.face.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired ReviewDao reviewDao;
	
	@Autowired ServletContext context;
	
	@Override
	public void write(PlaceReview placeReview, MultipartFile file) {
		
		//덧글 처리
		reviewDao.insertReview(placeReview);
		
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
		
		ReviewFile reviewFile = new ReviewFile();
		reviewFile.setSreviewNo( placeReview.getSreviewNo() );
		reviewFile.setOriginName(originName);
		reviewFile.setStoredName(storedName);
		reviewFile.setFilepath(storedPath);
		
		reviewDao.insertPhoto(reviewFile);
		
		//---------------------------------------------------
		
		reviewDao.updateFilepath(placeReview);
		
	}
	
	@Override
	public void write2(PlaceReview placeReview) {
		
		//덧글 처리
		reviewDao.insertReview(placeReview);
	}
	
	@Override
	public void delete(PlaceReview placeReview) {
		
		if( placeReview.getStoredName() != null ) {
			//첨부파일 삭제
			reviewDao.deleteFile(placeReview);
		}
		
		//리뷰 삭제
		reviewDao.delete(placeReview);
		
	}

}
