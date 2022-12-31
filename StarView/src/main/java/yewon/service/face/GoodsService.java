package yewon.service.face;

import java.util.List;
import java.util.Map;

import yewon.dto.Goods;
import yewon.dto.Wish;

public interface GoodsService {

	public List<Goods> getGoodsList();

	public List<Goods> getMoreGoods(Map<String, Integer> map);

	public int totalCount();

	public List<Goods> sortByLowPrice();

	public List<Goods> lowPriceMore(Map<String, Integer> map);

	public List<Goods> sortByHighPrice();

	public List<Goods> highPriceMore(Map<String, Integer> map);

	public Goods viewGoods(Wish wish);

	public List<Goods> sortByDate();

	public List<Goods> latestMore(Map<String, Integer> map);

}
