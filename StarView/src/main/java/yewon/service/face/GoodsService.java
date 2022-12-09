package yewon.service.face;

import java.util.List;
import java.util.Map;

import yewon.dto.Goods;

public interface GoodsService {

	public List<Goods> getGoodsList();

	public List<Goods> getMoreGoods(Map<String, Integer> map);

	public int totalCount();

	public List<Goods> sortByLowPrice();

	public List<Goods> lowPriceMore(Map<String, Integer> map);

	public List<Goods> sortByHighPrice();

	public List<Goods> highPriceMore(Map<String, Integer> map);

}
