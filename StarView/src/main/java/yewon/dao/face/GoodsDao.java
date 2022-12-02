package yewon.dao.face;

import java.util.List;
import java.util.Map;

import yewon.dto.Goods;

public interface GoodsDao {

	public List<Goods> selectAllGoods();

	public List<Goods> selectMoreGoods(Map<String, Integer> map);

	public int selectCntAll();

}
