package seulgi.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import seulgi.dao.face.AdminProductDao;
import seulgi.dto.AdminProduct;
import seulgi.dto.AdminProductImage;
import seulgi.service.face.AdminProductService;
import seulgi.util.Paging;

@Service
public class AdminProductServiceImpl implements AdminProductService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired
	private AdminProductDao adminProductDao; 
	
	//ServletContext 객체
	@Autowired
	ServletContext context;
	
	//페이징 처리
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminProductDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	//상품 리스트
	@Override
	public List<AdminProduct> list(Paging paging) {
		logger.info("list() 사용");
		
		return adminProductDao.selectAll(paging);
	}
	
	//상품 상세 조회
	@Override
	public AdminProduct view(AdminProduct viewProd) {
		logger.info("view() 사용");
		
		return adminProductDao.selectProd(viewProd);
	}
	
	//상품, 첨부파일 업로드
	@Override
	public void upload(AdminProduct prod, MultipartFile file) {
		logger.info("upload() 사용");
		
		//상품 업로드
		if("".equals(prod.getgName())) {
			prod.setgName("(상품명 없음)");
		} else {
			adminProductDao.insertProd(prod);
		}
		
		//첨부파일 업로드
		//파일의 크기가 0일 때 파일 업로드 처리 중단
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일 저장될 경로
		String storedPath = context.getRealPath("prodimage");
		
		//파일 저장할 폴더 만들기(prodimage 폴더)
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일 이름
		String fileName = file.getOriginalFilename();
		
		//저장될 이름 추가(dto, DB)
		
		//실제 저장될 파일 객체
		File dest = new File(storedFolder, fileName);
		
		try {
			//업로드된 파일을 폴더에 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//첨부파일 정보 DB 기록
		AdminProductImage prodFile = new AdminProductImage();
		prodFile.setgId(prod.getgId());
		prodFile.setFileName(fileName);
		
		adminProductDao.insertFile(prodFile);
	}
	
	//첨부파일 정보 얻어오기
	@Override
	public AdminProductImage getAttachFile(AdminProduct viewProd) {
		logger.info("getAttachFile() 사용");
		
		return adminProductDao.selectImageFile(viewProd);
	}
	
	@Override
	public void update(AdminProduct prod, MultipartFile file) {
		logger.info("upload() 사용");
		
		//상품 업데이트
		if("".equals(prod.getgName())) {
			prod.setgName("(상품명 없음)");
		} else {
			adminProductDao.updateProd(prod);
		}
		
		//첨부파일 업데이트
		//파일의 크기가 0일 때 파일 업로드 처리 중단
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일 저장될 경로
		String storedPath = context.getRealPath("prodimage");
		
		//파일 저장할 폴더 만들기(prodimage 폴더)
		File storedFolder = new File(storedPath);
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일 이름
		String fileName = file.getOriginalFilename();
		
		//저장될 이름 추가(dto, DB)
		
		//실제 저장될 파일 객체
		File dest = new File(storedFolder, fileName);
		
		try {
			//업로드된 파일을 폴더에 저장하기
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//첨부파일 정보 DB 기록
		AdminProductImage prodFile = new AdminProductImage();
		prodFile.setgId(prod.getgId());
		prodFile.setFileName(fileName);

		//기존에 상품에 연결된 첨부파일을 삭제한다
		adminProductDao.deleteFile(prod);
		
		//새로운 첨부파일을 삽입한다
		adminProductDao.insertFile(prodFile);
	}
	
	@Override
	public void update(AdminProduct prod) {
		logger.info("upload() 사용");
		
		//상품 업데이트
		if("".equals(prod.getgName())) {
			prod.setgName("(상품명 없음)");
		} else {
			adminProductDao.updateProd(prod);
		}
		
	}
}
