package yewon.dao.face;

import java.util.List;
import java.util.Map;

import yewon.dto.Goods;

public interface GoodsDao {

	public List<Goods> selectAllGoods();

	public List<Goods> selectMoreGoods(Map<String, Integer> map);

	public int selectCntAll();

	public List<Goods> selectByLowPrice();

	public List<Goods> lowPriceMore(Map<String, Integer> map);

	public List<Goods> selectByHighPrice();

	public List<Goods> highPriceMore(Map<String, Integer> map);

	public List<Goods> selectByDate();

	public List<Goods> latestMore(Map<String, Integer> map);

	public Goods selectGoods(Map<String, Object> map);

	public int selectLikeCnt(Map<String, Object> map);

	public void likeCntUp(Map<String, Object> map);

	public void likeCntDown(Map<String, Object> map);
}
