package yewon.service.face;

import java.util.List;
import java.util.Map;

import yewon.dto.Goods;

public interface GoodsService {

	public List<Goods> getGoodsList();

	public List<Goods> getMoreGoods(Map<String, Integer> map);

	public int totalCount();

}
