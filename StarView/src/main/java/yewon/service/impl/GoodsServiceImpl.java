package yewon.service.impl;

import java.util.List;

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
	private List<Goods> goodslist;
	
	//로그 객체
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public List<Goods> getGoodsList() {
		
		goodslist = goodsDao.selectAllGoods();
		
		return goodslist;
	}

}
