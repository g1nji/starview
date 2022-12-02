package yewon.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import yewon.dao.face.GoodsDao;
import yewon.dto.Goods;
import yewon.service.face.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired GoodsDao goodsDao;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<Goods> getGoodsList() {
		List<Goods> goodslist = goodsDao.selectAllGoods();
		return goodslist;
	}

	@Override
	public List<Goods> getMoreGoods(Map<String, Integer> map) {
		List<Goods> moreGoods = goodsDao.selectMoreGoods(map); 
		return moreGoods;
	}

	@Override
	public int totalCount() {
		int totalCount = goodsDao.selectCntAll();
		return totalCount;
	}

}
