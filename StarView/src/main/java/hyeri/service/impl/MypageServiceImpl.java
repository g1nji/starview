package hyeri.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyeri.dao.face.MypageDao;
import hyeri.dto.Gallery;
import hyeri.service.face.MypageService;
import hyeri.util.Paging2;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired MypageDao mypageDao;
	
	@Override
	public Paging2 getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = mypageDao.selectCntAll();
		
		//페이징 계산
		Paging2 paging = new Paging2(totalCount, curPage);
		
		return paging;
	}
	
	@Override
	public List<Gallery> list(String uId) {
		return mypageDao.selectList(uId);
	}
}