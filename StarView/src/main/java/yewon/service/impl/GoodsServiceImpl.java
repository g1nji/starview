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

	@Override
	public List<Goods> sortByLowPrice() {
		List<Goods> lowPriceList = goodsDao.selectByLowPrice();
		return lowPriceList;
	}

	@Override
	public List<Goods> lowPriceMore(Map<String, Integer> map) {
		List<Goods> moreGoods = goodsDao.lowPriceMore(map); 
		return moreGoods;	
	}

	@Override
	public List<Goods> sortByHighPrice() {
		List<Goods> highPriceList = goodsDao.selectByHighPrice();
		return highPriceList;
	}

	@Override
	public List<Goods> highPriceMore(Map<String, Integer> map) {
		List<Goods> moreGoods = goodsDao.highPriceMore(map); 
		return moreGoods;	
	}

	@Override
	public List<Goods> sortByDate() {
		List<Goods> latestList = goodsDao.selectByDate();
		return latestList;
	}

	@Override
	public List<Goods> latestMore(Map<String, Integer> map) {
		List<Goods> moreGoods = goodsDao.latestMore(map); 
		return moreGoods;	
	}

	@Override
	public Goods viewGoods(Map<String, Object> map) {
		Goods goodsInfo = goodsDao.selectGoods(map);
		return goodsInfo;
	}

	@Override
	public int getLikeCnt(Map<String, Object> map) {
		int likeCnt = goodsDao.selectLikeCnt(map);
		return likeCnt;
	}

	@Override
	public void likeCntUp(Map<String, Object> map) {
		goodsDao.likeCntUp(map);
	}

	@Override
	public void likeCntDown(Map<String, Object> map) {
		goodsDao.likeCntDown(map);
	}


}
