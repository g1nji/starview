package hyeri.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyeri.dao.face.CommentDao;
import hyeri.dto.GComment;
import hyeri.dto.Gallery;
import hyeri.service.face.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired CommentDao commentDao;
	
	@Override
	public void write(GComment gComment) {

		commentDao.insertComment(gComment);
		
	}
	
	@Override
	public List<GComment> view(int galleryNo) {

		return commentDao.selectGalleryNo(galleryNo);
	}

	@Override
	public void delete(GComment gComment) {
		
		commentDao.delete(gComment);
		
	}
	
}
