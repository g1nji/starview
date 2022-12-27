package seulgi.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import seulgi.dao.face.AdminGalleryDao;
import seulgi.dto.AdminBoardFile;
import seulgi.dto.AdminGallery;
import seulgi.service.face.AdminGalleryService;
import seulgi.util.Paging;

@Service
public class AdminGalleryServiceImpl implements AdminGalleryService {

	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//DAO 객체
	@Autowired
	private AdminGalleryDao adminBoardDao; 
	
	//ServletContext 객체
	@Autowired
	ServletContext context;
	
	//페이징 처리
//	@Override
//	public Paging getPagingAll(int curPage) {
//		//총 게시글 수 조회
//		int totalCount = adminBoardDao.selectCntAllBoard();
//		
//		//페이징 계산
//		Paging paging = new Paging(totalCount, curPage);
//		
//		return paging;
//	}
	
	@Override
	public Paging getPaging(int curPage) {
		//총 게시글 수 조회
		int totalCount = adminBoardDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 리스트
	//페이징 처리 없이
//	@Override
//	public List<AdminBoard> list() {
//		logger.info("list() 사용");
//		
//		return adminBoardDao.selectAllBoard();
//	}

	//페이징 처리 추가
//	@Override
//	public List<AdminBoard> listAll(Paging paging) {
//		logger.info("list() 사용");
//		
//		return adminBoardDao.selectAllBoard(paging);
//	}
	
	@Override
	public List<AdminGallery> list(Paging paging) {
		logger.info("list() 사용");
		
		return adminBoardDao.selectAll(paging);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 상세 조회
	@Override
	public AdminGallery view(AdminGallery viewBoard) {
		logger.info("view() 사용");
		
		return adminBoardDao.selectBoard(viewBoard);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	//게시글만 업로드
//	@Override
//	public void upload(AdminBoard board) {
//		logger.info("upload() 사용");
//		
//		//게시글 업로드
//		if("".equals(board.getNoticeTitle())) {
//			board.setGalleryTitle("(공지사항입니다)");
//		} else {
//			adminBoardDao.insertAllBoard(board);
//		}
//	}
	
	//게시글, 첨부파일 업로드
	@Override
	public void upload(AdminGallery board, MultipartFile file) {
		logger.info("upload() 사용");
		
		//게시글 업로드
		if("".equals(board.getGalleryTitle())) {
			board.setGalleryTitle("(제목없음)");
		} else {
			adminBoardDao.insertBoard(board);
		}
		
		//첨부파일 업로드
		//빈 파일일 경우
		if(file.getSize() <= 0) {
			return ;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("boardFile");
		logger.info("파일 주소: {}", storedPath);
		
		//파일 저장할 폴더 만들기(boardFile 폴더)
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = FilenameUtils.getBaseName(file.getOriginalFilename());
		String storedName = originName + UUID.randomUUID().toString().split("-")[4]
				+ "." + FilenameUtils.getExtension(file.getOriginalFilename());
		
		//저장할 파일의 정보 객체
		File dest = new File(storedFolder, storedName);
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//첨부파일 정보 DB 기록
		AdminBoardFile boardFile = new AdminBoardFile();
		boardFile.setGalleryNo(board.getGalleryNo());
		boardFile.setOriginName(originName);
		boardFile.setStoredName(storedName);
	
		adminBoardDao.insertFile(boardFile);
	}
	
	//첨부파일 정보 얻어오기
	@Override
	public AdminBoardFile getAttachFile(AdminGallery viewBoard) {
		logger.info("getAttachFile() 사용");
		
		return adminBoardDao.selectFileByBoard(viewBoard);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
	//첨부파일 다운로드
	@Override
	public AdminBoardFile getFile(AdminBoardFile boardFile) {
		logger.info("getFile() 사용");
		
		return adminBoardDao.selectFileByFile(boardFile);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글만 수정
	@Override
	public void update(AdminGallery board) {
		logger.info("update() 사용");
		
		//게시글 처리
		if("".equals(board.getGalleryTitle())) {
			board.setGalleryTitle("(제목없음)");
		}
		
		adminBoardDao.updateBoard(board);
	}
	
	//게시글, 첨부파일 수정
	@Override
	public void update(AdminGallery board, MultipartFile file) {
		logger.info("update() 사용");
		
		//게시글 수정
		if("".equals(board.getGalleryTitle())) {
			board.setGalleryTitle("(제목없음)");
		} else {
			adminBoardDao.updateBoard(board);
		}
		
		//첨부파일 수정
		//빈 파일일 경우
		if(file.getSize() <= 0) {
			return ;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("boardFile");
		
		//파일 저장할 폴더 만들기(boardFile 폴더)
		File storedFolder = new File(storedPath);
		if(!storedFolder.exists()) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		//String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, originName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//첨부파일 정보 DB 기록
		AdminBoardFile boardFile = new AdminBoardFile();
		boardFile.setGalleryNo(board.getGalleryNo());
		boardFile.setOriginName(originName);
		//boardFile.setStoredName(storedName);
	
		//기존에 게시글에 연결된 첨부파일을 삭제한다
		adminBoardDao.deleteFile(board);
		
		//새로운 첨부파일을 삽입한다
		adminBoardDao.insertFile(boardFile);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 삭제
	@Override
	public void delete(AdminGallery board) {
		logger.info("delete() 사용");
		
		//첨부파일 삭제
		adminBoardDao.deleteFile(board);
		
		//게시글 삭제
		adminBoardDao.delete(board);
	}
	
	//----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	//게시글 검색
	@Override
	public List<AdminGallery> search(String keyword) {
		return adminBoardDao.searchBoard(keyword);
	}
	
}
