package hyeri.service.face;

import java.util.List;

import hyeri.dto.GComment;
import hyeri.dto.Gallery;
import hyeri.util.Paging2;

public interface MypageService {

	public Paging2 getPaging(int curPage, String uId);

	public List<Gallery> list(Paging2 paging, String uId);

	public Paging2 getPaging2(int curPage, String uId);
	
	public List<GComment> clist(Paging2 paging, String uId);

}
