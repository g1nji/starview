package hyeri.service.face;

import java.util.List;

import hyeri.dto.Gallery;
import hyeri.util.Paging2;

public interface MypageService {

	public Paging2 getPaging(int curPage);

	public List<Gallery> list(String uId);

}
